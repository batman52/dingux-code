#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>
#include "config.h"
#include "mp_msg.h"
#include "sys/stat.h"
#include "sys/fcntl.h"
#include "sys/ioctl.h"
#include "sys/mman.h"
#include "fcntl.h"
#include <linux/fb.h>
#include <unistd.h>

#include "libavcodec/avcodec.h"
#include "libmpcodecs/img_format.h"
#include "stream/stream.h"
#include "libmpdemux/demuxer.h"
#include "libmpdemux/stheader.h"

#include "libmpcodecs/img_format.h"
#include "libmpcodecs/mp_image.h"
#include "libmpcodecs/vf.h"
#include "libswscale/swscale.h"
#include "libswscale/swscale_internal.h"
#include "libmpcodecs/vf_scale.h"

#include "jz4740_ipu.h"

#ifdef JZ4740_IPU

#undef printf
//#define USE_FIX_4M
#ifndef USE_FIX_4M
#define USE_IMEM_ALLOC 
#endif

typedef struct {
    AVCodecContext *avctx;
    AVFrame *pic;
    enum PixelFormat pix_fmt;
    float last_aspect;
    int do_slices;
    int do_dr1;
    int vo_inited;
    int best_csp;
    int b_age;
    int ip_age[2];
    int qp_stat[32];
    double qp_sum;
    double inv_qp_sum;
    int ip_count;
    int b_count;
} vd_ffmpeg_ctx;

struct vf_priv_s {
    int w,h;
    int v_chr_drop;
    double param[2];
    unsigned int fmt;
    struct SwsContext *ctx;
    struct SwsContext *ctx2; //for interlaced slices only
    unsigned char* palette;
    int interlaced;
    int noup;
    int accurate_rnd;
    int query_format_cache[64];
};

#define PAGE_SIZE (4096)
#define MEM_ALLOC_DEV_NUM 2

struct mem_dev {
  unsigned int vaddr;
  unsigned int paddr;
  unsigned int totalsize;
  unsigned int usedsize;
} memdev[MEM_ALLOC_DEV_NUM]; 

#ifdef USE_IMEM_ALLOC 
char *memfname[]={"/proc/jz/imem", 
                  "/proc/jz/imem",
                  "/proc/jz/imem", 
                  "/proc/jz/imem"};
#else
char *memfname[]={"/proc/jz/ipu", 
                  "/proc/jz/ipu",
                  "/proc/jz/ipu", 
                  "/proc/jz/ipu"};
#endif

unsigned int dcache[4096];
static int mem_init = 0, memdev_count = 0;
int mmapfd = 0;
static int ipu_inited = 0, ipu_size_cfg = 0, get_fbinfo_already = 0;
static int ipu_rtable_init = 0, ipu_rtable_len;
int  ipufd, ipu_maped = 0, ipu_image_completed = 0;
static volatile unsigned char *ipu_vbase=NULL, *img_ptr=NULL, *frame_buffer=NULL;
unsigned int fb_w, fb_h, phy_fb, fbmemlen, fb_line_len;
unsigned int rsize_w = 0, rsize_h = 0;
unsigned int out_width, out_height;

#define IPU_LUT_LEN 20
struct Ration2m ipu_ratio_table[(IPU_LUT_LEN) * (IPU_LUT_LEN)];
rsz_lut h_lut[IPU_LUT_LEN];
rsz_lut v_lut[IPU_LUT_LEN];

void get_fbaddr_info ()
{
  int fbfd;
  struct fb_var_screeninfo fbvar;
  struct fb_fix_screeninfo fbfix;

  if ((fbfd = open("/dev/fb0", O_RDWR)) == -1) {
       printf("++ ERR: can't open /dev/fb0 ++\n");
       exit(1);
  }

  ioctl(fbfd, FBIOGET_VSCREENINFO, &fbvar);
  ioctl(fbfd, FBIOGET_FSCREENINFO, &fbfix);

  fb_w = fbvar.xres;
  fb_h = fbvar.yres;

  phy_fb= fbfix.smem_start;
  fbmemlen = fbfix.smem_len;
  fb_line_len=  fbfix.line_length; 

  if ((frame_buffer = (uint8_t *) mmap(0, fbmemlen, PROT_READ | PROT_WRITE, MAP_SHARED, fbfd, 0)) == (uint8_t *) -1) 
  {
    printf ("++ jz4740_soc.c: Can't mmap frame buffer ++\n");
    exit (1);
  }

  printf ("++ jz47 fb_w=%d, fb_h=%d, phy_fb=0x%x, fbmemlen=%d, fb_line_len=%d\n",
          fb_w, fb_h, phy_fb, fbmemlen, fb_line_len);
}

unsigned int get_phy_addr (unsigned int vaddr)
{
  int i;
  for (i = 0; i < memdev_count; i++)
  {
    if (vaddr >= memdev[i].vaddr && vaddr < memdev[i].vaddr + memdev[i].totalsize)
      return memdev[i].paddr + (vaddr -  memdev[i].vaddr);
  }
  return 0;
}

void jz4740_free_devmem ()
{
  int power = 255, i;
  unsigned char cmdbuf[100];

#ifndef  USE_FIX_4M
#ifdef USE_IMEM_ALLOC 
  sprintf (cmdbuf, "echo FF > %s", memfname[0]);
  system (cmdbuf);
#else
  sprintf (cmdbuf, "echo %x > %s", power, memfname[0]);
  system (cmdbuf);
#endif
#endif
  for (i = 0; i < memdev_count; i++)
  {
    if (memdev[i].vaddr) {
	 munmap((void *)memdev[i].vaddr,memdev[i].totalsize);
	 memset(&memdev[i],0,sizeof(struct mem_dev));
	}	
   } 
  
  mem_init = 0;
  memdev_count = 0;
}

void *jz4740_alloc_frame (int align, int size)
{
	int power, pages = 1, fd, i;
	int cur_pid = 0;
	unsigned int paddr, vaddr, data;
	unsigned char cmdbuf[100];
	/* Free all proc memory. */
#ifndef USE_FIX_4M
	if (mem_init == 0) {
#ifdef USE_IMEM_ALLOC 
		sprintf (cmdbuf, "echo FF > %s", memfname[0]);
		//echo FF > /proc/jz/imem
		system (cmdbuf);
#else
		int power = 255;
		sprintf (cmdbuf, "echo %x > %s", power, memfname[0]);
		system (cmdbuf);
#endif
		mem_init = 1;
	}
#endif
	/* open /dev/mem for mmap the memory. */

	if (mmapfd == 0)
	 	mmapfd = open ("/dev/mem", O_RDWR);
	if (mmapfd <= 0) {
		printf("++ Jz47 alloc frame failed: can not mmap the memory ++\n");
		exit (1);
	}

	for (i = 0; i < memdev_count; i++) {
		int alloc_size, used_size, total_size;
		used_size = memdev[i].usedsize;
		total_size = memdev[i].totalsize;
		alloc_size = total_size - used_size;

		if (alloc_size >= size) {
			/* align to 16 boundary.  */
			alloc_size = (size + 15) & ~(15);
			memdev[i].usedsize = used_size + alloc_size;
			vaddr = memdev[i].vaddr + used_size;
			printf ("jz mem alloc [%d]: vaddr = 0x%x, paddr = 0x%x size = 0x%x , total = 0x%x\n",i, vaddr, memdev[i].paddr + used_size, size, memdev[i].usedsize);

			//call toggle_tlb
			if (memdev[i].usedsize >= 0xd9200) {
				cur_pid = getpid();
				//printf ("call parameter : \npid = %d, vaddr = 0x%x, paddr = 0x%x ,total = 0x%x\n",cur_pid, memdev[i].vaddr, memdev[i].paddr, memdev[i].usedsize);
#if 0
				sprintf(cmdbuf, "echo 0x%08x 0x%08x 0x%08x 0x%08x > %s", cur_pid, memdev[i].vaddr, memdev[i].paddr, memdev[i].usedsize, "/proc/jz/ipu");
#else
				sprintf(cmdbuf, "echo 00%08x 00%08x 00%08x 00%08x > %s", cur_pid, memdev[i].vaddr, memdev[i].paddr, memdev[i].usedsize, "/proc/jz/ipu");
#endif
				printf("system call command: cmdbuf=%s\n",cmdbuf);
				system(cmdbuf);
			}
			return (void *)vaddr;
		}
	}
#ifdef USE_FIX_4M
	{
		pages = 0x400000 / (PAGE_SIZE);
		paddr =0x3c00000;
		/* mmap the memory and record vadd and paddr. */
		vaddr = (unsigned int)mmap ((void *)0, (pages * PAGE_SIZE), (PROT_READ|PROT_WRITE),  MAP_SHARED, mmapfd, paddr);
		memdev[memdev_count].vaddr = vaddr;
		memdev[memdev_count].paddr = paddr;
		memdev[memdev_count].totalsize = (pages * PAGE_SIZE);
		memdev[memdev_count].usedsize = 0;
		memdev_count++;
		printf ("++ jz47 Dev alloc: vaddr = 0x%x, paddr = 0x%x size = 0x%x ++\n", 
                        vaddr, paddr, (pages * PAGE_SIZE));
	}
#else
	/* request the new memory space */
	power = 9;//10;    /* request mem size of 2 ^ 10 pages, 4M space */
	pages = 512;//1024;
	while (power >= 0)  {
		/* open the memory device. */
		if (memdev_count <  MEM_ALLOC_DEV_NUM) {
			// request mem
			sprintf (cmdbuf, "echo %d > %s", power, 
				 memfname[memdev_count]);
			system (cmdbuf);
			// get paddr
			fd = open(memfname[memdev_count], O_RDWR);
			if (fd >= 0)
				read (fd, &paddr, 4); 
			close(fd);
			/* failed, so free the memory. */
			if (paddr == 0) { 
				power--;            /* request mem size of 2 ^ 10 pages, 4M space */
				pages = pages / 2;
				continue;
			} else {
				/* mmap the memory and record vadd and paddr. */
				vaddr = (unsigned int)mmap ((void *)0x2b800000,
							    (pages * PAGE_SIZE),
							    (PROT_READ|PROT_WRITE),
							    MAP_SHARED, 
							    mmapfd, 
							    paddr);/* modify */
				
				memdev[memdev_count].vaddr = vaddr;
				memdev[memdev_count].paddr = paddr;
				memdev[memdev_count].totalsize = (pages * PAGE_SIZE);
				memdev[memdev_count].usedsize = 0;
				memdev_count++;
				printf ("jz Dev alloc 2: vaddr = 0x%x, paddr = 0x%x size = 0x%x ++\n", vaddr, paddr, (pages * PAGE_SIZE));
				break;
			}
		} else//if (memdev_count <  MEM_ALLOC_DEV_NUM)
			printf("++ Jz47 alloc: not enough memory device can be allocated ++\n");
		exit (1);
	}
#endif
	for (i = 0; i < memdev_count; i++) {
		int alloc_size, used_size, total_size;
		used_size = memdev[i].usedsize;
		total_size = memdev[i].totalsize;
		alloc_size = total_size - used_size;

		if (alloc_size >= size) {
			/* align to 16 boundary.  */
			alloc_size = (size + 15) & ~(15);
			memdev[i].usedsize = used_size + alloc_size;
			vaddr = memdev[i].vaddr + used_size;
			printf ("jz mem alloc [%d]: vaddr = 0x%x, paddr = 0x%x size = 0x%x\n", i, vaddr, memdev[i].paddr + used_size, size);
			//vaddr = 0x2b5f1000, paddr = 0x3400000 size = 0x48600
			return (void *)vaddr;
		}
	}
	printf ("++ Jz47 alloc: memory allocated is failed (size = %d) ++\n", size);
	exit (1);
}

/*----------------------------------------------------------------------------------*/

char *ipu_regs_name[] = {
    "REG_CTRL",         /* 0x0 */ 
    "REG_STATUS",       /* 0x4 */ 
    "REG_D_FMT",        /* 0x8 */ 
    "REG_Y_ADDR",       /* 0xc */ 
    "REG_U_ADDR",       /* 0x10 */ 
    "REG_V_ADDR",       /* 0x14 */ 
    "REG_IN_FM_GS",     /* 0x18 */ 
    "REG_Y_STRIDE",     /* 0x1c */ 
    "REG_UV_STRIDE",    /* 0x20 */ 
    "REG_OUT_ADDR",     /* 0x24 */ 
    "REG_OUT_GS",       /* 0x28 */ 
    "REG_OUT_STRIDE",   /* 0x2c */ 
    "RSZ_COEF_INDEX",   /* 0x30 */ 
    "REG_CSC_C0_COEF",  /* 0x34 */ 
    "REG_CSC_C1_COEF",  /* 0x38 */ 
    "REG_CSC_C2_COEF",  /* 0x3c */ 
    "REG_CSC_C3_COEF",  /* 0x40 */ 
    "REG_CSC_C4_COEF",  /* 0x44 */ 
};

int jz47_dump_ipu_regs(int num)
{
  int i, total;
  if (num >= 0)
  {
    //printf ("ipu_reg: %s: 0x%x\n", ipu_regs_name[num >> 2], REG32(ipu_vbase + num));
  	return 1;
  }
  if (num == -1)
  {
    total = sizeof (ipu_regs_name) / sizeof (char *);
    for (i = 0; i < total; i++)
      printf ("ipu_reg: %s: 0x%x\n", ipu_regs_name[i], REG32(ipu_vbase + (i << 2)));
  }
  if (num == -2)
  {
    for (i = 0; i < IPU_LUT_LEN; i++)
      printf ("ipu_H_LUT(%d): 0x%x\n", i, REG32(ipu_vbase + HRSZ_LUT_BASE + i * 4));
    for (i = 0; i < IPU_LUT_LEN; i++)
      printf ("ipu_V_LUT(%d): 0x%x\n", i, REG32(ipu_vbase + VRSZ_LUT_BASE + i * 4));
  }
  return 1;
}

/* set ipu data format.  */
int jz47_set_ipu_csc_cfg (SwsContext *c, int outW, int outH, int Wdiff, int Hdiff)
{
  unsigned int in_fmt = 0, out_fmt = 0;
  const int dstFormat= c->dstFormat;
  const int srcFormat= c->srcFormat;

  switch (srcFormat)
  {
    case PIX_FMT_YUV420P:
      Hdiff = (Hdiff + 1) & ~1;
      Wdiff = (Wdiff + 1) & ~1;
      in_fmt = INFMT_YCbCr420;
      break;

    case PIX_FMT_YUV422P:
      Wdiff = (Wdiff + 1) & ~1;
      in_fmt = INFMT_YCbCr422;
      break;

    case PIX_FMT_YUV444P:
      in_fmt = INFMT_YCbCr444;
      break;

    case PIX_FMT_YUV411P:
      in_fmt = INFMT_YCbCr411;
      break;
  }

   out_width =outW;
   out_height=outH;
   printf ("++ out_width = %d, out_heigth = %d  ++\n", out_width, out_height);

  switch (dstFormat)
  {
    case PIX_FMT_RGB32:
      out_fmt = OUTFMT_RGB888;
      outW = outW << 2;
      
      break;

    case PIX_FMT_RGB555:
    case PIX_FMT_BGR555:
      out_fmt = OUTFMT_RGB555;
      outW = outW << 1;
      break;

    case PIX_FMT_RGB565:
    case PIX_FMT_BGR565:
      out_fmt = OUTFMT_RGB565;
      outW = outW << 1;
      break;
  }

// Set GS register
  REG32(ipu_vbase + REG_IN_FM_GS) = IN_FM_W((c->srcW - Wdiff) & ~0x1) | IN_FM_H((c->srcH - Hdiff) & ~0x1);
  REG32(ipu_vbase + REG_OUT_GS) = OUT_FM_W(outW) | OUT_FM_H(outH);

// set Format
  REG32(ipu_vbase + REG_D_FMT) = in_fmt | out_fmt;

// set parameter
  REG32(ipu_vbase + REG_CSC_C0_COEF) = YUV_CSC_C0;
  REG32(ipu_vbase + REG_CSC_C1_COEF) = YUV_CSC_C1;
  REG32(ipu_vbase + REG_CSC_C2_COEF) = YUV_CSC_C2;
  REG32(ipu_vbase + REG_CSC_C3_COEF) = YUV_CSC_C3;
  REG32(ipu_vbase + REG_CSC_C4_COEF) = YUV_CSC_C4;
  return 0;
}


int init_ipu_ratio_table ()
{
  int i, j, cnt;
  float r, min, diff;

  // orig table, first calculate
   for (i = 1; i <= (IPU_LUT_LEN); i++)
    for (j = 1; j <= (IPU_LUT_LEN); j++)
    {
      ipu_ratio_table [(i - 1) * 20 + j - 1].ratio = i / (float)j;
      ipu_ratio_table [(i - 1) * 20 + j - 1].n = i;
      ipu_ratio_table [(i - 1) * 20 + j - 1].m = j;
    }

// Eliminate the ratio greater than 1:2
  for (i = 0; i < (IPU_LUT_LEN) * (IPU_LUT_LEN); i++)
    if (ipu_ratio_table[i].ratio < 0.4999)
      ipu_ratio_table[i].n = ipu_ratio_table[i].m = -1;

// eliminate the same ratio
  for (i = 0; i < (IPU_LUT_LEN) * (IPU_LUT_LEN); i++)
    for (j = i + 1; j < (IPU_LUT_LEN) * (IPU_LUT_LEN); j++)
    {
      diff = ipu_ratio_table[i].ratio - ipu_ratio_table[j].ratio;
      if (diff > -0.001 && diff < 0.001)
      {
        ipu_ratio_table[j].n = -1;
        ipu_ratio_table[j].m = -1;
      }
    }

// reorder ipu_ratio_table
cnt = 0;
  for (i = 0; i < (IPU_LUT_LEN) * (IPU_LUT_LEN); i++)
    if (ipu_ratio_table[i].n != -1)
    {
      if (cnt != i)
        ipu_ratio_table[cnt] = ipu_ratio_table[i];
      cnt++;
    }
  ipu_rtable_len = cnt;

  return 0;
}

int find_ipu_ratio_factor (float ratio)
{
  int i, sel; 
  float diff, min=100;
  sel = ipu_rtable_len;

  for (i = 0; i < ipu_rtable_len; i++)
  {
    if (ratio > ipu_ratio_table[i].ratio)
      diff = ratio - ipu_ratio_table[i].ratio;
    else
      diff = ipu_ratio_table[i].ratio - ratio;

    if (diff < min || i == 0)
    {
      min = diff;
      sel = i;
    }
  }

  printf ("resize: sel = %d, n=%d, m=%d\n", sel, ipu_ratio_table[sel].n,
          ipu_ratio_table[sel].m);
  return sel;
}

int resize_lut_cal (int srcN, int dstM, int upScale, rsz_lut lut[]);
int resize_out_cal (int insize, int outsize, int srcN, int dstM, int upScale, int *diff);
int jz47_set_ipu_resize (SwsContext *c, int *outWp, int *outHp,
                         int *Wdiff, int *Hdiff)
{
  static int W = 0, H = 0, Hsel = 0, Wsel = 0;
  int srcN, dstM, width_up, height_up;
  int Height_lut_max, Width_lut_max;
  int i;

   rsize_w = (rsize_w == 0) ? c->dstW : rsize_w;
   rsize_h = (rsize_h == 0) ? c->dstH : rsize_h;

   rsize_w = (rsize_w > fb_w) ? fb_w : rsize_w;
   rsize_h = (rsize_h > fb_h) ? fb_h : rsize_h;

  *outWp = rsize_w;
  *outHp = rsize_h;
  *Wdiff = *Hdiff = 0;

// Don't need do resize ?
  if (((c->srcW == rsize_w) && (c->srcH == rsize_h)) || (rsize_w > 2 * c->srcW)
      || (rsize_h > 2 * c->srcH))
  {
    disable_rsize (ipu_vbase);
    return 0;
  }

// init the resize factor table
  if (!ipu_rtable_init)
  {
    init_ipu_ratio_table ();
    ipu_rtable_init = 1;
  }

// enable resize
  enable_rsize (ipu_vbase);

// get the resize factor
  if (W != rsize_w)
  {
    Wsel = find_ipu_ratio_factor(((float) c->srcW)/rsize_w);
    W = rsize_w;
  }

  if (H != rsize_h)
  {
    Hsel = find_ipu_ratio_factor(((float) c->srcH)/rsize_h);
    H = rsize_h;
  }

// set IPU_CTRL register
  width_up  = rsize_w >= c->srcW;
  height_up = rsize_h >= c->srcH;
  REG32(ipu_vbase + REG_CTRL) |= (height_up << V_SCALE_SHIFT) | (width_up << H_SCALE_SHIFT);

// set IPU_INDEX register
  Width_lut_max  = width_up  ? ipu_ratio_table[Wsel].m : ipu_ratio_table[Wsel].n;
  Height_lut_max = height_up ? ipu_ratio_table[Hsel].m : ipu_ratio_table[Hsel].n;
  REG32(ipu_vbase + REG_RSZ_COEF_INDEX) =   ((Height_lut_max - 1) << VE_IDX_SFT) 
                                          | ((Width_lut_max - 1)  << HE_IDX_SFT);

// calculate out W/H and LUT
  srcN = ipu_ratio_table[Wsel].n;
  dstM = ipu_ratio_table[Wsel].m;
  *outWp = resize_out_cal (c->srcW, rsize_w, srcN, dstM, width_up,  Wdiff);
  resize_lut_cal (srcN, dstM, width_up,  h_lut);

  srcN = ipu_ratio_table[Hsel].n;
  dstM = ipu_ratio_table[Hsel].m;
  *outHp = resize_out_cal (c->srcH, rsize_h, srcN, dstM, height_up, Hdiff);
  resize_lut_cal (srcN, dstM, height_up, v_lut);

// set IPU LUT register
  for (i = 0; i < Height_lut_max; i++)
    REG32(ipu_vbase + VRSZ_LUT_BASE + i * 4) = (v_lut[i].coef << W_COEF_SFT)
          | (v_lut[i].in_n << IN_N_SFT) | (v_lut[i].out_n  << OUT_N_SFT);
  for (i = 0; i < Width_lut_max; i++)
    REG32(ipu_vbase + HRSZ_LUT_BASE + i * 4) = (h_lut[i].coef << W_COEF_SFT)
          | (h_lut[i].in_n << IN_N_SFT) | (h_lut[i].out_n  << OUT_N_SFT);

  return 0;
}

int resize_out_cal (int insize, int outsize, int srcN, int dstM, 
                    int upScale, int *diff)
{
  int calsize, delta;
  float tmp, tmp2;
  delta = 1;

  do {
    tmp = (insize - delta) * dstM / (float)srcN;
    tmp2 = tmp  * srcN / dstM;
    if (upScale)
    {
      if (tmp2 == insize - delta)
        calsize = tmp + 1;
      else
        calsize = tmp + 2;
    }
    else   // down Scale
    {
      if (tmp2 == insize - delta)
        calsize = tmp;
      else
        calsize = tmp + 1;
    }
    delta++;
  } while (calsize > outsize);

  *diff = delta - 2;

  return calsize;
}

int resize_lut_cal (int srcN, int dstM, int upScale, rsz_lut lut[])
{
  int i, t, x;
  float w_coef, factor, factor2;

  if (upScale)
  {
    for (i = 0, t=0; i < dstM; i++)
    {
      factor = (float) (i * srcN) / (float)dstM;
      factor2 = factor - (int)factor;
      w_coef = 1.0  - factor2;
      lut[i].coef = (unsigned int)(128.0 * w_coef);
// calculate in & out
      lut[i].out_n = 1;
      if (t <= factor)
      {
        lut[i].in_n = 1;
        t++;
      }
      else
       lut[i].in_n = 0;
    } // end for
  }
  else
  {
    for (i = 0, t = 0, x = 0; i < srcN; i++)
    {
      factor = (float) (t * srcN + 1) / (float)dstM;
      if (dstM == 1)
      {
// calculate in & out
        lut[i].coef =  (i == 0) ? 64 : 0;
        lut[i].out_n = (i == 0) ? 1  : 0;
      }
      else 
      if (((t * srcN + 1) / dstM - i) >= 1)
        lut[i].coef = 0;
      else
      if (factor - i == 0)
      {
        lut[i].coef = 128;
        t++;
      }
      else
      {
        factor2 = (float) (t * srcN) / (float)dstM;
        factor = factor - (int)factor2;
        w_coef = 1.0  - factor;
        lut[i].coef = (unsigned int)(128.0*w_coef);
        t++;
      }
// calculate in & out
      lut[i].in_n = 1;
      if (dstM != 1)
      {
        if (((x * srcN + 1) / dstM - i) >= 1)
          lut[i].out_n = 0;
        else
        {
          lut[i].out_n = 1;
          x++;
        }
      }
    } /* for end down Scale*/
  } /* else upScale */
  return 0;
}

int jz47_ipu_init (struct vf_instance_s* vf)
{
  SwsContext *c = vf->priv->ctx;
  int outW, outH, Wdiff, Hdiff;

  outW= c->dstW;
  outH= c->dstH;

  if (!ipu_maped)
  {
    ipufd = open ("/dev/mem", O_RDWR);
    if (ipufd < 0) {
      printf("++ open /dev/mem error. program aborted. ++\n");
      exit (1);
    }
    ipu_vbase = mmap((void *)0, IPU__SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, ipufd,
                        IPU__OFFSET);
    ipu_maped = 1;
  }

  if (!ipu_inited)
  {
//init
    stop_ipu  (ipu_vbase);
    reset_ipu (ipu_vbase);
    clear_end_flag (ipu_vbase);

//disable irq
    disable_irq(ipu_vbase);

// set IPU resize field
    jz47_set_ipu_resize (c, &outW, &outH, &Wdiff, &Hdiff);

// set CSC parameter and format
    jz47_set_ipu_csc_cfg(c, outW, outH, Wdiff, Hdiff);

// set out frame buffer
#ifdef NEED_COPY_IMGBUF

    img_ptr = (unsigned char *)jz4740_alloc_frame (32, fbmemlen);
    REG32(ipu_vbase + REG_OUT_ADDR) = get_phy_addr ((unsigned int)img_ptr); 
#else
    REG32(ipu_vbase + REG_OUT_ADDR) = phy_fb;
#endif
    REG32(ipu_vbase + REG_OUT_STRIDE) = fb_line_len;
    ipu_inited = 1;
    ipu_size_cfg = 0;
   }
   else
   if (ipu_size_cfg)
   {
// set IPU resize field
    jz47_set_ipu_resize (c, &outW, &outH, &Wdiff, &Hdiff);

// set CSC parameter and format
    jz47_set_ipu_csc_cfg(c, outW, outH, Wdiff, Hdiff);

    ipu_size_cfg = 0;
  }

  //jz47_dump_ipu_regs(-1);
  return 0;
  
}

void  ipu_image_start()
{
  jz4740_free_devmem();
  ipu_inited = 0;
  ipu_image_completed = 0;
  rsize_w = 0;
  rsize_h = 0;
}

void  ipu_outsize_changed(int x,int y,int w, int h)
{
	//int offset_x =x;
	//int offset_y =y;
	if ((w==0) && (h==0))
	{
		if ((rsize_w == 0) && ( rsize_h == 0)) return;
		rsize_w = 0;
		rsize_h = 0;
		ipu_size_cfg = 1;	
	}
	else 
    { 
    	if (rsize_w != w || rsize_h != h) {
    		rsize_w = w;
    		rsize_h = h;    		
    		ipu_size_cfg = 1;
    	}
    }
}


void  copy_image_to_fb ()
{  
   memcpy ((void *)frame_buffer, (void *)img_ptr, fbmemlen);  
   return;
}

int jz47_put_image_with_ipu (struct vf_instance_s* vf, mp_image_t *mpi, double pts)
{
  unsigned int paddr;
  //SwsContext *c = vf->priv->ctx;

  if (!get_fbinfo_already)
  {
    get_fbaddr_info();
    get_fbinfo_already = 1;
  }

  jz47_ipu_init (vf);
  while ((!polling_end_flag(ipu_vbase)) && ipu_is_enable(ipu_vbase))
    ;
  stop_ipu(ipu_vbase);
  clear_end_flag(ipu_vbase);

#ifdef NEED_COPY_IMGBUF
  if (ipu_image_completed)
    copy_image_to_fb ();
#endif

// set Y(mpi->planes[0]), U(mpi->planes[1]), V addr (mpi->planes[2])
  paddr = get_phy_addr ((unsigned int)mpi->planes[0]);
  if (paddr == 0)
  {
    printf ("++ Can not found Y buffer(0x%x) physical addr since addr errors +++\n",
            (unsigned int)mpi->planes[0]);
    exit(1);
    
  }
  REG32(ipu_vbase + REG_Y_ADDR) = paddr;

// set U addr register (mpi->planes[1])
  paddr = get_phy_addr ((unsigned int)mpi->planes[1]);
  if (paddr == 0)
  {
    printf ("++ Can not found U buffer(0x%x) physical addr since addr errors +++\n",
            (unsigned int)mpi->planes[1]);
    exit(1);
  }
  REG32(ipu_vbase + REG_U_ADDR) = paddr;

// set V addr register (mpi->planes[2])
  paddr = get_phy_addr ((unsigned int)mpi->planes[2]);
  if (paddr == 0)
  {
    printf ("++ Can not found V buffer(0x%x) physical addr since addr errors +++\n",
            (unsigned int)mpi->planes[2]);
    exit(1);
  }
  REG32(ipu_vbase + REG_V_ADDR) = paddr;

// set Y(mpi->stride[0]) U(mpi->stride[1]) V(mpi->stride[2]) stride
  REG32(ipu_vbase + REG_Y_STRIDE) = mpi->stride[0];
  REG32(ipu_vbase + REG_UV_STRIDE) = U_STRIDE(mpi->stride[1]) | V_STRIDE(mpi->stride[2]);

  // flush the dcache
  {
  //unsigned int img_area = c->srcW * c->srcH;
  //if (img_area <= 176 * 144) 
    memset (dcache, 0x2, 0x4000);
  }

// start ipu
  run_ipu(ipu_vbase);
  ipu_image_completed = 1;

  return 1;
}

// copy from vf_scale.c

static void scale(struct SwsContext *sws1, struct SwsContext *sws2, uint8_t *src[3], int src_stride[3], int y, int h, 
                  uint8_t *dst[3], int dst_stride[3], int interlaced){
    if(interlaced){
        int i;
        uint8_t *src2[3]={src[0], src[1], src[2]};
        uint8_t *dst2[3]={dst[0], dst[1], dst[2]};
        int src_stride2[3]={2*src_stride[0], 2*src_stride[1], 2*src_stride[2]};
        int dst_stride2[3]={2*dst_stride[0], 2*dst_stride[1], 2*dst_stride[2]};

        sws_scale_ordered(sws1, src2, src_stride2, y>>1, h>>1, dst2, dst_stride2);
        for(i=0; i<3; i++){
            src2[i] += src_stride[i];
            dst2[i] += dst_stride[i];
        }
        sws_scale_ordered(sws2, src2, src_stride2, y>>1, h>>1, dst2, dst_stride2);
    }else{
        sws_scale_ordered(sws1, src, src_stride, y, h, dst, dst_stride);
    }                  
}

int jz47_put_image(struct vf_instance_s* vf, mp_image_t *mpi, double pts)
{
    mp_image_t *dmpi=mpi->priv;
    //printf("jz4740: processing whole frame! dmpi=%p flag=%d\n",
    //	dmpi, (mpi->flags&MP_IMGFLAG_DRAW_CALLBACK));
    
  if(!(mpi->flags&MP_IMGFLAG_DRAW_CALLBACK && dmpi)){

    // hope we'll get DR buffer:
    dmpi=vf_get_image(vf->next,vf->priv->fmt,
	MP_IMGTYPE_TEMP, MP_IMGFLAG_ACCEPT_STRIDE | MP_IMGFLAG_PREFER_ALIGNED_STRIDE,
	vf->priv->w, vf->priv->h);
    
    if (! jz47_put_image_with_ipu (vf, mpi, pts))
      scale(vf->priv->ctx, vf->priv->ctx, mpi->planes,mpi->stride,0,mpi->h,dmpi->planes,dmpi->stride, vf->priv->interlaced);
  }

    if(vf->priv->w==mpi->w && vf->priv->h==mpi->h){
	// just conversion, no scaling -> keep postprocessing data
	// this way we can apply pp filter to non-yv12 source using scaler
        vf_clone_mpi_attributes(dmpi, mpi);
    }

    if(vf->priv->palette) dmpi->planes[1]=vf->priv->palette; // export palette!
    
    return vf_next_put_image(vf,dmpi, pts);
}
#endif


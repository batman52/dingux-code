include ../config.mak

LIBNAME_COMMON = liba52.a

SRCS_COMMON = resample.c \
	      crc.c \
              cpu_accel.c \
              bit_allocate.c \
              bitstream.c \
              downmix.c \
              imdct.c \
              parse.c \
	      cpu_state.c \

OPTFLAGS += -DLIBA52_FIXED
ASFLAGS += -DLIBA52_FIXED

include ../mpcommon.mak

bit_allocate.o:bit_allocate.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as bit_allocate.s > bit_allocate_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ bit_allocate_mxu.s
bitstream.o:bitstream.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as bitstream.s > bitstream_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ bitstream_mxu.s
cpu_accel.o:cpu_accel.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as cpu_accel.s > cpu_accel_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ cpu_accel_mxu.s
cpu_state.o:cpu_state.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as cpu_state.s > cpu_state_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ cpu_state_mxu.s
crc.o:crc.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as crc.s > crc_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ crc_mxu.s
downmix.o:downmix.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as downmix.s > downmix_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ downmix_mxu.s
imdct.o:imdct.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as imdct.s > imdct_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ imdct_mxu.s
parse.o:parse.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as parse.s > parse_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ parse_mxu.s
resample.o:resample.c
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -S  $<
	mxu_as resample.s > resample_mxu.s
	$(CC) $(CFLAGS) $(LIBOBJFLAGS) -c -o $@ resample_mxu.s

test: test.c ../osdep/libosdep.a $(LIBNAME_COMMON)
	$(CC) $(CFLAGS) -o $@ $^ -lm

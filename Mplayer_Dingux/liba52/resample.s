	.file	1 "resample.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.abicalls
	.text
	.align	2
	.ent	a52_resample_MONO_to_5_C
	.type	a52_resample_MONO_to_5_C, @function
a52_resample_MONO_to_5_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L4
	addiu	$3,$4,1024

$L9:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,8($5)
	beq	$3,$4,$L8
	addiu	$5,$5,10

$L4:
	lh	$2,2($4)
	sh	$0,6($5)
	sh	$0,4($5)
	sh	$0,2($5)
	beq	$2,$0,$L9
	sh	$0,0($5)

	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,8($5)
	bne	$3,$4,$L4
	addiu	$5,$5,10

$L8:
	j	$31
	li	$2,1280			# 0x500

	.set	macro
	.set	reorder
	.end	a52_resample_MONO_to_5_C
	.align	2
	.ent	a52_resample_MONO_to_1_C
	.type	a52_resample_MONO_to_1_C, @function
a52_resample_MONO_to_1_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$6,$4,1024
$L13:
	lh	$2,2($4)
	beq	$2,$0,$L12
	li	$3,1			# 0x1

	sll	$3,$2,16
	sra	$3,$3,16
$L12:
	addiu	$4,$4,4
	sh	$3,0($5)
	bne	$6,$4,$L13
	addiu	$5,$5,2

	j	$31
	li	$2,256			# 0x100

	.set	macro
	.set	reorder
	.end	a52_resample_MONO_to_1_C
	.align	2
	.ent	a52_resample_STEREO_to_2_C
	.type	a52_resample_STEREO_to_2_C, @function
a52_resample_STEREO_to_2_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L21
	addiu	$6,$4,1024

$L25:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,2($5)
	beq	$6,$4,$L24
	addiu	$5,$5,4

$L21:
	lh	$2,2($4)
	beq	$2,$0,$L18
	li	$3,1			# 0x1

	sll	$3,$2,16
	sra	$3,$3,16
$L18:
	lh	$2,1026($4)
	beq	$2,$0,$L25
	sh	$3,0($5)

	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,2($5)
	bne	$6,$4,$L21
	addiu	$5,$5,4

$L24:
	j	$31
	li	$2,512			# 0x200

	.set	macro
	.set	reorder
	.end	a52_resample_STEREO_to_2_C
	.align	2
	.ent	a52_resample_3F_to_5_C
	.type	a52_resample_3F_to_5_C, @function
a52_resample_3F_to_5_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L33
	addiu	$6,$4,1024

$L37:
	lh	$2,1026($4)
	li	$3,1			# 0x1
	sh	$3,2($5)
	sh	$0,6($5)
	bne	$2,$0,$L31
	sh	$0,4($5)

$L38:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,8($5)
	beq	$6,$4,$L36
	addiu	$5,$5,10

$L33:
	lh	$2,2($4)
	beq	$2,$0,$L28
	li	$3,1			# 0x1

	sll	$3,$2,16
	sra	$3,$3,16
$L28:
	lh	$2,2050($4)
	beq	$2,$0,$L37
	sh	$3,0($5)

	sll	$3,$2,16
	lh	$2,1026($4)
	sra	$3,$3,16
	sh	$3,2($5)
	sh	$0,6($5)
	beq	$2,$0,$L38
	sh	$0,4($5)

$L31:
	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,8($5)
	bne	$6,$4,$L33
	addiu	$5,$5,10

$L36:
	j	$31
	li	$2,1280			# 0x500

	.set	macro
	.set	reorder
	.end	a52_resample_3F_to_5_C
	.align	2
	.ent	a52_resample_2F_2R_to_4_C
	.type	a52_resample_2F_2R_to_4_C, @function
a52_resample_2F_2R_to_4_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L48
	addiu	$6,$4,1024

$L52:
	lh	$2,1026($4)
	bne	$2,$0,$L42
	sh	$3,0($5)

$L53:
	lh	$2,2050($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L44
	sh	$3,2($5)

$L54:
	lh	$2,3074($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L46
	sh	$3,4($5)

$L55:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,6($5)
	beq	$6,$4,$L51
	addiu	$5,$5,8

$L48:
	lh	$2,2($4)
	beq	$2,$0,$L52
	li	$3,1			# 0x1

	sll	$3,$2,16
	lh	$2,1026($4)
	sra	$3,$3,16
	beq	$2,$0,$L53
	sh	$3,0($5)

$L42:
	sll	$3,$2,16
	lh	$2,2050($4)
	sra	$3,$3,16
	beq	$2,$0,$L54
	sh	$3,2($5)

$L44:
	sll	$3,$2,16
	lh	$2,3074($4)
	sra	$3,$3,16
	beq	$2,$0,$L55
	sh	$3,4($5)

$L46:
	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,6($5)
	bne	$6,$4,$L48
	addiu	$5,$5,8

$L51:
	j	$31
	li	$2,1024			# 0x400

	.set	macro
	.set	reorder
	.end	a52_resample_2F_2R_to_4_C
	.align	2
	.ent	a52_resample_3F_2R_to_5_C
	.type	a52_resample_3F_2R_to_5_C, @function
a52_resample_3F_2R_to_5_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L67
	addiu	$6,$4,1024

$L71:
	lh	$2,2050($4)
	bne	$2,$0,$L59
	sh	$3,0($5)

$L72:
	lh	$2,3074($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L61
	sh	$3,2($5)

$L73:
	lh	$2,4098($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L63
	sh	$3,4($5)

$L74:
	lh	$2,1026($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L65
	sh	$3,6($5)

$L75:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,8($5)
	beq	$6,$4,$L70
	addiu	$5,$5,10

$L67:
	lh	$2,2($4)
	beq	$2,$0,$L71
	li	$3,1			# 0x1

	sll	$3,$2,16
	lh	$2,2050($4)
	sra	$3,$3,16
	beq	$2,$0,$L72
	sh	$3,0($5)

$L59:
	sll	$3,$2,16
	lh	$2,3074($4)
	sra	$3,$3,16
	beq	$2,$0,$L73
	sh	$3,2($5)

$L61:
	sll	$3,$2,16
	lh	$2,4098($4)
	sra	$3,$3,16
	beq	$2,$0,$L74
	sh	$3,4($5)

$L63:
	sll	$3,$2,16
	lh	$2,1026($4)
	sra	$3,$3,16
	beq	$2,$0,$L75
	sh	$3,6($5)

$L65:
	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,8($5)
	bne	$6,$4,$L67
	addiu	$5,$5,10

$L70:
	j	$31
	li	$2,1280			# 0x500

	.set	macro
	.set	reorder
	.end	a52_resample_3F_2R_to_5_C
	.align	2
	.ent	a52_resample_MONO_LFE_to_6_C
	.type	a52_resample_MONO_LFE_to_6_C, @function
a52_resample_MONO_LFE_to_6_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L81
	addiu	$6,$4,1024

$L85:
	lh	$2,2($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L79
	sh	$3,8($5)

$L86:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,10($5)
	beq	$6,$4,$L84
	addiu	$5,$5,12

$L81:
	lh	$2,1026($4)
	sh	$0,6($5)
	sh	$0,4($5)
	sh	$0,2($5)
	beq	$2,$0,$L85
	sh	$0,0($5)

	sll	$3,$2,16
	lh	$2,2($4)
	sra	$3,$3,16
	beq	$2,$0,$L86
	sh	$3,8($5)

$L79:
	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,10($5)
	bne	$6,$4,$L81
	addiu	$5,$5,12

$L84:
	j	$31
	li	$2,1536			# 0x600

	.set	macro
	.set	reorder
	.end	a52_resample_MONO_LFE_to_6_C
	.align	2
	.ent	a52_resample_STEREO_LFE_to_6_C
	.type	a52_resample_STEREO_LFE_to_6_C, @function
a52_resample_STEREO_LFE_to_6_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L94
	addiu	$6,$4,1024

$L98:
	lh	$3,2($4)
	li	$2,1			# 0x1
	sh	$2,2($5)
	sh	$0,8($5)
	sh	$0,6($5)
	bne	$3,$0,$L92
	sh	$0,4($5)

$L99:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,10($5)
	beq	$6,$4,$L97
	addiu	$5,$5,12

$L94:
	lh	$2,1026($4)
	beq	$2,$0,$L89
	li	$3,1			# 0x1

	sll	$3,$2,16
	sra	$3,$3,16
$L89:
	lh	$2,2050($4)
	beq	$2,$0,$L98
	sh	$3,0($5)

	sll	$2,$2,16
	lh	$3,2($4)
	sra	$2,$2,16
	sh	$2,2($5)
	sh	$0,8($5)
	sh	$0,6($5)
	beq	$3,$0,$L99
	sh	$0,4($5)

$L92:
	sll	$2,$3,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,10($5)
	bne	$6,$4,$L94
	addiu	$5,$5,12

$L97:
	j	$31
	li	$2,1536			# 0x600

	.set	macro
	.set	reorder
	.end	a52_resample_STEREO_LFE_to_6_C
	.align	2
	.ent	a52_resample_3F_LFE_to_6_C
	.type	a52_resample_3F_LFE_to_6_C, @function
a52_resample_3F_LFE_to_6_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L109
	addiu	$6,$4,1024

$L113:
	lh	$2,3074($4)
	bne	$2,$0,$L103
	sh	$3,0($5)

$L114:
	lh	$2,2050($4)
	li	$3,1			# 0x1
	sh	$3,2($5)
	sh	$0,6($5)
	bne	$2,$0,$L105
	sh	$0,4($5)

$L115:
	lh	$2,2($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L107
	sh	$3,8($5)

$L116:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,10($5)
	beq	$6,$4,$L112
	addiu	$5,$5,12

$L109:
	lh	$2,1026($4)
	beq	$2,$0,$L113
	li	$3,1			# 0x1

	sll	$3,$2,16
	lh	$2,3074($4)
	sra	$3,$3,16
	beq	$2,$0,$L114
	sh	$3,0($5)

$L103:
	sll	$3,$2,16
	lh	$2,2050($4)
	sra	$3,$3,16
	sh	$3,2($5)
	sh	$0,6($5)
	beq	$2,$0,$L115
	sh	$0,4($5)

$L105:
	sll	$3,$2,16
	lh	$2,2($4)
	sra	$3,$3,16
	beq	$2,$0,$L116
	sh	$3,8($5)

$L107:
	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,10($5)
	bne	$6,$4,$L109
	addiu	$5,$5,12

$L112:
	j	$31
	li	$2,1536			# 0x600

	.set	macro
	.set	reorder
	.end	a52_resample_3F_LFE_to_6_C
	.align	2
	.ent	a52_resample_2F_2R_LFE_to_6_C
	.type	a52_resample_2F_2R_LFE_to_6_C, @function
a52_resample_2F_2R_LFE_to_6_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L128
	addiu	$6,$4,1024

$L132:
	lh	$2,2050($4)
	bne	$2,$0,$L120
	sh	$3,0($5)

$L133:
	lh	$2,3074($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L122
	sh	$3,2($5)

$L134:
	lh	$2,4098($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L124
	sh	$3,4($5)

$L135:
	lh	$2,2($4)
	li	$3,1			# 0x1
	sh	$3,6($5)
	bne	$2,$0,$L126
	sh	$0,8($5)

$L136:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,10($5)
	beq	$6,$4,$L131
	addiu	$5,$5,12

$L128:
	lh	$2,1026($4)
	beq	$2,$0,$L132
	li	$3,1			# 0x1

	sll	$3,$2,16
	lh	$2,2050($4)
	sra	$3,$3,16
	beq	$2,$0,$L133
	sh	$3,0($5)

$L120:
	sll	$3,$2,16
	lh	$2,3074($4)
	sra	$3,$3,16
	beq	$2,$0,$L134
	sh	$3,2($5)

$L122:
	sll	$3,$2,16
	lh	$2,4098($4)
	sra	$3,$3,16
	beq	$2,$0,$L135
	sh	$3,4($5)

$L124:
	sll	$3,$2,16
	lh	$2,2($4)
	sra	$3,$3,16
	sh	$3,6($5)
	beq	$2,$0,$L136
	sh	$0,8($5)

$L126:
	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,10($5)
	bne	$6,$4,$L128
	addiu	$5,$5,12

$L131:
	j	$31
	li	$2,1536			# 0x600

	.set	macro
	.set	reorder
	.end	a52_resample_2F_2R_LFE_to_6_C
	.align	2
	.ent	a52_resample_3F_2R_LFE_to_6_C
	.type	a52_resample_3F_2R_LFE_to_6_C, @function
a52_resample_3F_2R_LFE_to_6_C:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	b	$L150
	addiu	$6,$4,1024

$L154:
	lh	$2,3074($4)
	bne	$2,$0,$L140
	sh	$3,0($5)

$L155:
	lh	$2,4098($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L142
	sh	$3,2($5)

$L156:
	lh	$2,5122($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L144
	sh	$3,4($5)

$L157:
	lh	$2,2050($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L146
	sh	$3,6($5)

$L158:
	lh	$2,2($4)
	li	$3,1			# 0x1
	bne	$2,$0,$L148
	sh	$3,8($5)

$L159:
	li	$2,1			# 0x1
	addiu	$4,$4,4
	sh	$2,10($5)
	beq	$6,$4,$L153
	addiu	$5,$5,12

$L150:
	lh	$2,1026($4)
	beq	$2,$0,$L154
	li	$3,1			# 0x1

	sll	$3,$2,16
	lh	$2,3074($4)
	sra	$3,$3,16
	beq	$2,$0,$L155
	sh	$3,0($5)

$L140:
	sll	$3,$2,16
	lh	$2,4098($4)
	sra	$3,$3,16
	beq	$2,$0,$L156
	sh	$3,2($5)

$L142:
	sll	$3,$2,16
	lh	$2,5122($4)
	sra	$3,$3,16
	beq	$2,$0,$L157
	sh	$3,4($5)

$L144:
	sll	$3,$2,16
	lh	$2,2050($4)
	sra	$3,$3,16
	beq	$2,$0,$L158
	sh	$3,6($5)

$L146:
	sll	$3,$2,16
	lh	$2,2($4)
	sra	$3,$3,16
	beq	$2,$0,$L159
	sh	$3,8($5)

$L148:
	sll	$2,$2,16
	sra	$2,$2,16
	addiu	$4,$4,4
	sh	$2,10($5)
	bne	$6,$4,$L150
	addiu	$5,$5,12

$L153:
	j	$31
	li	$2,1536			# 0x600

	.set	macro
	.set	reorder
	.end	a52_resample_3F_2R_LFE_to_6_C
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"Unimplemented resampler for mode 0x%X -> %d channels con"
	.ascii	"version - Contact MPlayer developers!\012\000"
	.text
	.align	2
	.globl	a52_resample_init
	.ent	a52_resample_init
	.type	a52_resample_init, @function
a52_resample_init:
	.set	nomips16
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
	.cprestore	16
	sltu	$2,$5,27
	move	$8,$5
	bne	$2,$0,$L177
	move	$7,$6

$L161:
	lw	$2,%got(stderr)($28)
$L180:
	lw	$25,%call16(fprintf)($28)
	lw	$4,0($2)
	lui	$5,%hi($LC0)
	addiu	$5,$5,%lo($LC0)
	jalr	$25
	move	$6,$8

	lw	$31,28($sp)
	move	$3,$0
	lw	$28,16($sp)
	move	$2,$3
	j	$31
	addiu	$sp,$sp,32

$L177:
	lui	$3,%hi($L172)
	sll	$2,$5,2
	addiu	$3,$3,%lo($L172)
	addu	$3,$3,$2
	lw	$4,0($3)
	addu	$4,$4,$28
	j	$4
	nop

	.rdata
	.align	2
	.align	2
$L172:
	.gpword	$L162
	.gpword	$L163
	.gpword	$L162
	.gpword	$L164
	.gpword	$L161
	.gpword	$L161
	.gpword	$L165
	.gpword	$L166
	.gpword	$L161
	.gpword	$L161
	.gpword	$L162
	.gpword	$L161
	.gpword	$L161
	.gpword	$L161
	.gpword	$L161
	.gpword	$L161
	.gpword	$L167
	.gpword	$L168
	.gpword	$L167
	.gpword	$L169
	.gpword	$L161
	.gpword	$L161
	.gpword	$L170
	.gpword	$L171
	.gpword	$L161
	.gpword	$L161
	.gpword	$L167
	.text
$L171:
	li	$2,6			# 0x6
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_3F_2R_LFE_to_6_C)
	addiu	$3,$2,%lo(a52_resample_3F_2R_LFE_to_6_C)
	lui	$2,%hi(a52_resample)
	sw	$3,%lo(a52_resample)($2)
$L178:
	lw	$31,28($sp)
	move	$2,$3
	j	$31
	addiu	$sp,$sp,32

$L162:
	li	$2,2			# 0x2
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_STEREO_to_2_C)
	addiu	$3,$2,%lo(a52_resample_STEREO_to_2_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L163:
	li	$2,5			# 0x5
	beq	$6,$2,$L179
	li	$2,1			# 0x1

	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_MONO_to_1_C)
	addiu	$3,$2,%lo(a52_resample_MONO_to_1_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L164:
	li	$2,5			# 0x5
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_3F_to_5_C)
	addiu	$3,$2,%lo(a52_resample_3F_to_5_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L165:
	li	$2,4			# 0x4
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_2F_2R_to_4_C)
	addiu	$3,$2,%lo(a52_resample_2F_2R_to_4_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L166:
	li	$2,5			# 0x5
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_3F_2R_to_5_C)
	addiu	$3,$2,%lo(a52_resample_3F_2R_to_5_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L167:
	li	$2,6			# 0x6
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_STEREO_LFE_to_6_C)
	addiu	$3,$2,%lo(a52_resample_STEREO_LFE_to_6_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L168:
	li	$2,6			# 0x6
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_MONO_LFE_to_6_C)
	addiu	$3,$2,%lo(a52_resample_MONO_LFE_to_6_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L169:
	li	$2,6			# 0x6
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_3F_LFE_to_6_C)
	addiu	$3,$2,%lo(a52_resample_3F_LFE_to_6_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L170:
	li	$2,6			# 0x6
	bne	$6,$2,$L180
	lw	$2,%got(stderr)($28)

	lui	$2,%hi(a52_resample_2F_2R_LFE_to_6_C)
	addiu	$3,$2,%lo(a52_resample_2F_2R_LFE_to_6_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

$L179:
	lui	$2,%hi(a52_resample_MONO_to_5_C)
	addiu	$3,$2,%lo(a52_resample_MONO_to_5_C)
	lui	$2,%hi(a52_resample)
	b	$L178
	sw	$3,%lo(a52_resample)($2)

	.set	macro
	.set	reorder
	.end	a52_resample_init
	.globl	a52_resample
	.section	.bss,"aw",@nobits
	.align	2
	.type	a52_resample, @object
	.size	a52_resample, 4
a52_resample:
	.space	4
	.ident	"GCC: (GNU) 4.3.3"

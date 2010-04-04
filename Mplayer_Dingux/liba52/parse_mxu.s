.file	1 "parse.c"
.section .mdebug.abi32
.previous
.gnu_attribute 4, 3
.abicalls
.text
.align	2
.globl	a52_samples
.ent	a52_samples
.type	a52_samples, @function
a52_samples:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

j	$31
lw	$2,4388($4)

.set	macro
.set	reorder
.end	a52_samples
.align	2
.globl	a52_syncinfo
.ent	a52_syncinfo
.type	a52_syncinfo, @function
a52_syncinfo:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lbu	$3,0($4)
li	$2,11			# 0xb
move	$8,$4
move	$9,$5
beq	$3,$2,$L15
move	$11,$6

$L4:
j	$31
move	$2,$0

$L15:
lbu	$3,1($4)
li	$2,119			# 0x77
bne	$3,$2,$L4
nop

lbu	$10,5($4)
sltu	$2,$10,96
beq	$2,$0,$L4
nop

lbu	$5,6($4)
lui	$2,%hi(lfeon.3101)
srl	$6,$5,5
addiu	$2,$2,%lo(lfeon.3101)
addu	$2,$6,$2
lbu	$4,0($2)
andi	$3,$5,0xf8
xori	$3,$3,0x50
and	$5,$5,$4
li	$2,16			# 0x10
li	$4,10			# 0xa
movn	$4,$6,$3
movz	$2,$0,$5
or	$2,$2,$4
sw	$2,0($9)
lbu	$9,4($8)
lui	$2,%hi(halfrate)
srl	$3,$10,3
andi	$5,$9,0x3f
addiu	$2,$2,%lo(halfrate)
addu	$3,$3,$2
slt	$4,$5,38
beq	$4,$0,$L4
lbu	$6,0($3)

sra	$3,$5,1
lui	$2,%hi(rate.3100)
addiu	$2,$2,%lo(rate.3100)
sll	$3,$3,2
addu	$3,$3,$2
lw	$5,0($3)
sll	$4,$5,2
sll	$2,$5,7
subu	$2,$2,$4
addu	$2,$2,$5
sll	$2,$2,3
sra	$2,$2,$6
sw	$2,0($7)
lbu	$3,4($8)
li	$2,64			# 0x40
andi	$3,$3,0xc0
beq	$3,$2,$L10
li	$2,1869873152			# 0x6f740000

li	$2,128			# 0x80
beq	$3,$2,$L11
nop

bne	$3,$0,$L4
nop

li	$2,48000			# 0xbb80
sra	$2,$2,$6
sw	$2,0($11)
j	$31
move	$2,$4

$L10:
sll	$4,$5,8
sll	$3,$5,6
addu	$3,$3,$4
ori	$2,$2,0xae27
mult	$3,$2
sra	$3,$3,31
mfhi	$2
andi	$4,$9,0x1
sra	$2,$2,6
subu	$2,$2,$3
li	$3,44100			# 0xac44
sra	$3,$3,$6
addu	$2,$2,$4
sw	$3,0($11)
j	$31
sll	$2,$2,1

$L11:
li	$2,32000			# 0x7d00
sra	$2,$2,$6
sll	$4,$5,3
sll	$3,$5,1
sw	$2,0($11)
j	$31
subu	$2,$4,$3

.set	macro
.set	reorder
.end	a52_syncinfo
.align	2
.globl	a52_dynrng
.ent	a52_dynrng
.type	a52_dynrng, @function
a52_dynrng:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

beq	$5,$0,$L19
sw	$0,24($4)

li	$2,1			# 0x1
sw	$6,32($4)
sw	$2,24($4)
sw	$5,36($4)
$L19:
j	$31
nop

.set	macro
.set	reorder
.end	a52_dynrng
.align	2
.globl	a52_free
.ent	a52_free
.type	a52_free, @function
a52_free:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
.mask	0x80010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-32
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,28($sp)
sw	$16,24($sp)
.cprestore	16
lw	$25,%call16(free)($28)
move	$16,$4
jalr	$25
lw	$4,4388($4)

lw	$28,16($sp)
move	$4,$16
lw	$25,%call16(free)($28)
lw	$31,28($sp)
lw	$16,24($sp)
jr	$25
addiu	$sp,$sp,32

.set	macro
.set	reorder
.end	a52_free
.align	2
.ent	bitstream_get
.type	bitstream_get, @function
bitstream_get:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$6,428($4)
lui	$28,%hi(__gnu_local_gp)
sltu	$2,$5,$6
addiu	$28,$28,%lo(__gnu_local_gp)
move	$8,$4
beq	$2,$0,$L23
move	$7,$5

li	$2,32			# 0x20
lw	$4,432($4)
subu	$3,$2,$6
sll	$4,$4,$3
subu	$5,$6,$5
subu	$2,$2,$7
sw	$5,428($8)
j	$31
srl	$2,$4,$2

$L23:
lw	$25,%call16(a52_bitstream_get_bh)($28)
jr	$25
nop

.set	macro
.set	reorder
.end	bitstream_get
.align	2
.globl	a52_crc
.ent	a52_crc
.type	a52_crc, @function
a52_crc:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 4/0, args= 16, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-40
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,36($sp)
sw	$18,32($sp)
sw	$17,28($sp)
sw	$16,24($sp)
.cprestore	16
sra	$2,$5,2
sra	$16,$5,4
addu	$16,$16,$2
lw	$25,%call16(a52_crc16_block)($28)
sll	$16,$16,1
move	$17,$5
move	$18,$4
addiu	$5,$16,-2
jalr	$25
addiu	$4,$4,2

lw	$28,16($sp)
subu	$5,$17,$16
lw	$25,%call16(a52_crc16_block)($28)
addu	$4,$18,$16
jalr	$25
move	$17,$2

beq	$17,$0,$L27
lw	$28,16($sp)

lw	$31,36($sp)
li	$2,1			# 0x1
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

$L27:
lw	$31,36($sp)
sltu	$2,$0,$2
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	a52_crc
.align	2
.globl	a52_accel
.ent	a52_accel
.type	a52_accel, @function
a52_accel:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
.mask	0x80010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-32
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,28($sp)
sw	$16,24($sp)
.cprestore	16
lui	$16,%hi(a52_accels)
lw	$2,%lo(a52_accels)($16)
bne	$2,$0,$L33
lw	$3,%lo(a52_accels)($16)

lw	$25,%call16(a52_detect_accel)($28)
jalr	$25
nop

lw	$28,16($sp)
li	$3,-2147483648			# 0xffffffff80000000
or	$2,$2,$3
lw	$25,%call16(a52_cpu_state_init)($28)
move	$4,$2
jalr	$25
sw	$2,%lo(a52_accels)($16)

lw	$28,16($sp)
lw	$25,%call16(a52_imdct_init)($28)
jalr	$25
lw	$4,%lo(a52_accels)($16)

lw	$28,16($sp)
lw	$3,%lo(a52_accels)($16)
$L33:
li	$2,2147418112			# 0x7fff0000
lw	$31,28($sp)
ori	$2,$2,0xffff
and	$2,$3,$2
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,32

.set	macro
.set	reorder
.end	a52_accel
.align	2
.globl	a52_init
.ent	a52_init
.type	a52_init, @function
a52_init:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 3/0, args= 16, gp= 8
.mask	0x80030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-40
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,36($sp)
sw	$17,32($sp)
sw	$16,28($sp)
.cprestore	16
.option	pic0
jal	a52_accel
.option	pic2
li	$4,-2147483648			# 0xffffffff80000000

lw	$28,16($sp)
lw	$25,%call16(malloc)($28)
jalr	$25
li	$4,4396			# 0x112c

lw	$28,16($sp)
move	$16,$2
beq	$2,$0,$L35
move	$17,$2

lw	$25,%call16(memalign)($28)
li	$4,32			# 0x20
jalr	$25
li	$5,12288			# 0x3000

lw	$28,16($sp)
beq	$2,$0,$L40
sw	$2,4388($16)

move	$4,$2
move	$3,$0
li	$5,12288			# 0x3000
$L37:
addu	$2,$4,$3
addiu	$3,$3,4
bne	$3,$5,$L37
sw	$0,0($2)

li	$2,1			# 0x1
sh	$2,424($17)
sw	$2,4392($17)
$L35:
lw	$31,36($sp)
move	$2,$16
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,40

$L40:
lw	$25,%call16(free)($28)
jalr	$25
move	$4,$16

lw	$28,16($sp)
b	$L35
move	$16,$0

.set	macro
.set	reorder
.end	a52_init
.align	2
.ent	parse_exponents
.type	parse_exponents, @function
parse_exponents:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 10/0, args= 16, gp= 8
.mask	0xc0ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-64
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,60($sp)
sw	$fp,56($sp)
sw	$23,52($sp)
sw	$22,48($sp)
sw	$21,44($sp)
sw	$20,40($sp)
sw	$19,36($sp)
sw	$18,32($sp)
sw	$17,28($sp)
sw	$16,24($sp)
.cprestore	16
move	$19,$6
lui	$2,%hi(exp_1)
move	$21,$4
move	$18,$5
andi	$17,$7,0x00ff
addiu	$fp,$2,%lo(exp_1)
lw	$16,80($sp)
li	$20,2			# 0x2
li	$22,3			# 0x3
beq	$19,$0,$L61
li	$23,1			# 0x1

$L58:
lw	$4,428($21)
sltu	$2,$4,8
bne	$2,$0,$L43
li	$5,32			# 0x20

lw	$2,432($21)
subu	$3,$5,$4
sll	$2,$2,$3
addiu	$4,$4,-7
sw	$4,428($21)
srl	$4,$2,25
$L44:
addu	$2,$fp,$4
lbu	$3,0($2)
addu	$3,$17,$3
andi	$7,$3,0x00ff
sltu	$2,$7,25
beq	$2,$0,$L64
lw	$31,60($sp)

beq	$18,$20,$L48
nop

beq	$18,$22,$L49
nop

beq	$18,$23,$L47
lui	$3,%hi(exp_2)

addiu	$3,$3,%lo(exp_2)
addu	$2,$3,$4
lbu	$3,0($2)
addu	$3,$7,$3
andi	$7,$3,0x00ff
sltu	$2,$7,25
beq	$2,$0,$L65
li	$2,1			# 0x1

$L63:
beq	$18,$20,$L52
nop

beq	$18,$22,$L53
nop

beq	$18,$23,$L51
nop

$L50:
lui	$5,%hi(exp_3)
addiu	$5,$5,%lo(exp_3)
addu	$2,$5,$4
lbu	$3,0($2)
addu	$3,$7,$3
andi	$17,$3,0x00ff
sltu	$2,$17,25
beq	$2,$0,$L45
nop

beq	$18,$20,$L56
nop

beq	$18,$22,$L57
nop

beq	$18,$23,$L55
nop

addiu	$19,$19,-1
$L62:
bne	$19,$0,$L58
nop

$L61:
lw	$31,60($sp)
move	$2,$0
lw	$fp,56($sp)
lw	$23,52($sp)
lw	$22,48($sp)
lw	$21,44($sp)
lw	$20,40($sp)
lw	$19,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,64

$L57:
sb	$17,0($16)
sb	$17,1($16)
addiu	$16,$16,2
$L56:
sb	$17,0($16)
addiu	$16,$16,1
$L55:
sb	$17,0($16)
addiu	$19,$19,-1
b	$L62
addiu	$16,$16,1

$L49:
sb	$7,0($16)
sb	$7,1($16)
addiu	$16,$16,2
$L48:
sb	$7,0($16)
addiu	$16,$16,1
$L47:
lui	$3,%hi(exp_2)
addiu	$3,$3,%lo(exp_2)
addu	$2,$3,$4
lbu	$3,0($2)
sb	$7,0($16)
addu	$3,$7,$3
andi	$7,$3,0x00ff
sltu	$2,$7,25
bne	$2,$0,$L63
addiu	$16,$16,1

$L45:
lw	$31,60($sp)
$L64:
li	$2,1			# 0x1
$L65:
lw	$fp,56($sp)
lw	$23,52($sp)
lw	$22,48($sp)
lw	$21,44($sp)
lw	$20,40($sp)
lw	$19,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,64

$L53:
sb	$7,0($16)
sb	$7,1($16)
addiu	$16,$16,2
$L52:
sb	$7,0($16)
addiu	$16,$16,1
$L51:
sb	$7,0($16)
b	$L50
addiu	$16,$16,1

$L43:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$21
jalr	$25
li	$5,7			# 0x7

lw	$28,16($sp)
b	$L44
move	$4,$2

.set	macro
.set	reorder
.end	parse_exponents
.align	2
.ent	coeff_get
.type	coeff_get, @function
coeff_get:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 10/0, args= 16, gp= 8
.mask	0xc0ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-64
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,60($sp)
sw	$fp,56($sp)
sw	$23,52($sp)
sw	$22,48($sp)
sw	$21,44($sp)
sw	$20,40($sp)
sw	$19,36($sp)
sw	$18,32($sp)
sw	$17,28($sp)
sw	$16,24($sp)
.cprestore	16
lw	$fp,88($sp)
move	$21,$4
move	$22,$7
blez	$fp,$L105
lw	$23,80($sp)

move	$18,$6
move	$17,$5
sra	$20,$23,16
b	$L104
move	$19,$0

$L68:
lw	$5,428($21)
sltu	$2,$16,$5
beq	$2,$0,$L101
li	$3,32			# 0x20

lw	$4,432($21)
subu	$2,$3,$5
sll	$4,$4,$2
subu	$2,$5,$16
subu	$3,$3,$16
sw	$2,428($21)
li	$2,16			# 0x10
sra	$4,$4,$3
subu	$2,$2,$16
sll	$2,$4,$2
sll	$2,$2,16
sra	$2,$2,16
andi	$3,$23,0xffff
mul	$3,$2,$3
mul	$6,$20,$2
lbu	$4,0($18)
sra	$3,$3,16
addiu	$4,$4,-5
bltz	$4,$L103
addu	$5,$6,$3

$L119:
sra	$2,$5,$4
sw	$2,0($17)
$L79:
addiu	$19,$19,1
slt	$2,$19,$fp
addiu	$18,$18,1
beq	$2,$0,$L105
addiu	$17,$17,4

$L104:
lb	$16,256($18)
addiu	$2,$16,3
andi	$2,$2,0x00ff
sltu	$3,$2,8
beq	$3,$0,$L68
lui	$3,%hi($L75)

addiu	$3,$3,%lo($L75)
sll	$2,$2,2
addu	$2,$3,$2
lw	$3,0($2)
addu	$3,$3,$28
j	$3
nop

.rdata
.align	2
.align	2
$L75:
.gpword	$L69
.gpword	$L70
.gpword	$L71
.gpword	$L72
.gpword	$L68
.gpword	$L68
.gpword	$L73
.gpword	$L74
.text
$L74:
lw	$4,428($21)
sltu	$2,$4,5
bne	$2,$0,$L98
lw	$25,%call16(a52_bitstream_get_bh)($28)

lw	$2,432($21)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($21)
srl	$2,$2,28
$L99:
lui	$5,%hi(q_5)
sll	$2,$2,1
addiu	$5,$5,%lo(q_5)
$L117:
addu	$2,$2,$5
lh	$4,0($2)
andi	$3,$23,0xffff
mul	$3,$4,$3
mul	$5,$20,$4
lbu	$2,0($18)
sra	$3,$3,16
addiu	$2,$2,-5
bltz	$2,$L100
addu	$3,$5,$3

$L112:
sra	$2,$3,$2
sw	$2,0($17)
$L120:
addiu	$19,$19,1
slt	$2,$19,$fp
addiu	$18,$18,1
bne	$2,$0,$L104
addiu	$17,$17,4

$L105:
lw	$31,60($sp)
lw	$fp,56($sp)
lw	$23,52($sp)
lw	$22,48($sp)
lw	$21,44($sp)
lw	$20,40($sp)
lw	$19,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,64

$L93:
lw	$4,428($21)
sltu	$2,$4,8
bne	$2,$0,$L95
lw	$25,%call16(a52_bitstream_get_bh)($28)

lw	$2,432($21)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-7
sw	$4,428($21)
srl	$2,$2,25
$L96:
lui	$4,%hi(q_4_0)
sll	$2,$2,1
addiu	$4,$4,%lo(q_4_0)
lui	$6,%hi(q_4_1)
addu	$3,$2,$4
addiu	$6,$6,%lo(q_4_1)
lh	$5,0($3)
addu	$2,$2,$6
lhu	$4,0($2)
andi	$3,$23,0xffff
mul	$3,$5,$3
sh	$4,8($22)
sw	$0,20($22)
mul	$4,$20,$5
lbu	$2,0($18)
sra	$3,$3,16
addiu	$2,$2,-5
bgez	$2,$L112
addu	$3,$4,$3

$L100:
subu	$2,$0,$2
sll	$2,$3,$2
b	$L79
sw	$2,0($17)

$L73:
lw	$4,428($21)
sltu	$2,$4,4
bne	$2,$0,$L90
lw	$25,%call16(a52_bitstream_get_bh)($28)

lw	$2,432($21)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-3
sw	$4,428($21)
srl	$2,$2,29
$L91:
lui	$5,%hi(q_3)
sll	$2,$2,1
b	$L117
addiu	$5,$5,%lo(q_3)

$L72:
lw	$4,84($sp)
beq	$4,$0,$L76
lui	$2,%hi(dither_lut)

lhu	$5,424($21)
srl	$3,$5,8
addiu	$2,$2,%lo(dither_lut)
sll	$3,$3,1
addu	$3,$3,$2
lhu	$4,0($3)
sll	$5,$5,8
xor	$4,$4,$5
sll	$4,$4,16
sra	$4,$4,16
andi	$2,$23,0xffff
mul	$2,$2,$4
sh	$4,424($21)
mul	$5,$20,$4
lbu	$3,0($18)
sra	$2,$2,16
addiu	$3,$3,-5
bltz	$3,$L77
addu	$4,$5,$2

sra	$2,$4,$3
sw	$2,0($17)
$L78:
andi	$3,$2,0xffff
li	$4,11585			# 0x2d41
mul	$6,$3,$4
sra	$2,$2,16
li	$3,15564			# 0x3ccc
mul	$5,$2,$3
mul	$4,$2,$4
addu	$2,$5,$6
sll	$4,$4,2
sra	$2,$2,14
addu	$2,$2,$4
b	$L79
sw	$2,0($17)

$L69:
lw	$2,20($22)
bne	$2,$0,$L93
andi	$3,$23,0xffff

lh	$5,8($22)
mul	$3,$3,$5
li	$2,-1			# 0xffffffffffffffff
sw	$2,20($22)
$L114:
mul	$6,$20,$5
lbu	$4,0($18)
sra	$3,$3,16
addiu	$2,$4,-5
bltz	$2,$L94
addu	$4,$6,$3

$L118:
sra	$2,$4,$2
b	$L79
sw	$2,0($17)

$L71:
lw	$4,12($22)
bltz	$4,$L80
sll	$2,$4,1

addu	$2,$22,$2
lh	$5,0($2)
andi	$3,$23,0xffff
addiu	$2,$4,-1
mul	$3,$3,$5
sw	$2,12($22)
mul	$6,$20,$5
lbu	$4,0($18)
sra	$3,$3,16
addiu	$2,$4,-5
bgez	$2,$L118
addu	$4,$6,$3

$L94:
subu	$2,$0,$2
sll	$2,$4,$2
b	$L79
sw	$2,0($17)

$L70:
lw	$4,16($22)
bltz	$4,$L85
sll	$2,$4,1

addu	$2,$22,$2
lh	$5,4($2)
andi	$3,$23,0xffff
addiu	$2,$4,-1
mul	$3,$3,$5
b	$L114
sw	$2,16($22)

$L76:
b	$L79
sw	$0,0($17)

$L98:
move	$4,$21
jalr	$25
li	$5,4			# 0x4

b	$L99
lw	$28,16($sp)

$L90:
move	$4,$21
jalr	$25
li	$5,3			# 0x3

b	$L91
lw	$28,16($sp)

$L101:
lw	$25,%call16(a52_bitstream_get_bh_2)($28)
move	$4,$21
jalr	$25
move	$5,$16

move	$4,$2
li	$2,16			# 0x10
subu	$2,$2,$16
sll	$2,$4,$2
sll	$2,$2,16
sra	$2,$2,16
andi	$3,$23,0xffff
mul	$3,$2,$3
mul	$6,$20,$2
lbu	$4,0($18)
sra	$3,$3,16
addiu	$4,$4,-5
lw	$28,16($sp)
bgez	$4,$L119
addu	$5,$6,$3

$L103:
subu	$2,$0,$4
sll	$2,$5,$2
b	$L79
sw	$2,0($17)

$L85:
lw	$4,428($21)
sltu	$2,$4,8
bne	$2,$0,$L87
lw	$25,%call16(a52_bitstream_get_bh)($28)

lw	$2,432($21)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-7
sw	$4,428($21)
srl	$2,$2,25
$L88:
lui	$4,%hi(q_2_0)
sll	$2,$2,1
addiu	$4,$4,%lo(q_2_0)
lui	$5,%hi(q_2_2)
lui	$6,%hi(q_2_1)
addu	$3,$2,$4
addiu	$5,$5,%lo(q_2_2)
addiu	$6,$6,%lo(q_2_1)
lh	$7,0($3)
addu	$4,$2,$5
addu	$2,$2,$6
lhu	$5,0($4)
lhu	$6,0($2)
andi	$3,$23,0xffff
li	$2,1			# 0x1
mul	$3,$7,$3
sw	$2,16($22)
sh	$5,4($22)
sh	$6,6($22)
mul	$4,$20,$7
lbu	$2,0($18)
sra	$3,$3,16
addiu	$2,$2,-5
bltz	$2,$L100
addu	$3,$4,$3

sra	$2,$3,$2
b	$L120
sw	$2,0($17)

$L80:
lw	$4,428($21)
sltu	$2,$4,6
bne	$2,$0,$L82
lw	$25,%call16(a52_bitstream_get_bh)($28)

lw	$2,432($21)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-5
sw	$4,428($21)
srl	$2,$2,27
$L83:
lui	$4,%hi(q_1_0)
sll	$3,$2,1
lui	$5,%hi(q_1_2)
addiu	$2,$4,%lo(q_1_0)
lui	$6,%hi(q_1_1)
addu	$2,$3,$2
addiu	$5,$5,%lo(q_1_2)
addiu	$6,$6,%lo(q_1_1)
lh	$7,0($2)
addu	$4,$3,$5
addu	$3,$3,$6
lhu	$5,0($4)
lhu	$6,0($3)
andi	$4,$23,0xffff
li	$2,1			# 0x1
mul	$4,$7,$4
sh	$5,0($22)
sw	$2,12($22)
sh	$6,2($22)
mul	$5,$20,$7
lbu	$2,0($18)
sra	$4,$4,16
addiu	$2,$2,-5
bltz	$2,$L100
addu	$3,$5,$4

sra	$2,$3,$2
b	$L120
sw	$2,0($17)

$L77:
subu	$2,$0,$3
sll	$2,$4,$2
b	$L78
sw	$2,0($17)

$L95:
move	$4,$21
jalr	$25
li	$5,7			# 0x7

b	$L96
lw	$28,16($sp)

$L82:
move	$4,$21
jalr	$25
li	$5,5			# 0x5

b	$L83
lw	$28,16($sp)

$L87:
move	$4,$21
jalr	$25
li	$5,7			# 0x7

b	$L88
lw	$28,16($sp)

.set	macro
.set	reorder
.end	coeff_get
.align	2
.ent	parse_deltba
.type	parse_deltba, @function
parse_deltba:
.set	nomips16
.frame	$sp,56,$31		# vars= 0, regs= 8/0, args= 16, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-56
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,52($sp)
sw	$22,48($sp)
sw	$21,44($sp)
sw	$20,40($sp)
sw	$19,36($sp)
sw	$18,32($sp)
sw	$17,28($sp)
sw	$16,24($sp)
.cprestore	16
lw	$25,%call16(memset)($28)
move	$22,$5
move	$17,$4
move	$5,$0
move	$4,$22
jalr	$25
li	$6,50			# 0x32

lw	$4,428($17)
sltu	$2,$4,4
bne	$2,$0,$L122
lw	$28,16($sp)

lw	$2,432($17)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-3
sw	$4,428($17)
srl	$2,$2,29
$L123:
lw	$4,428($17)
move	$19,$2
sltu	$2,$4,6
move	$18,$0
bne	$2,$0,$L124
li	$21,32			# 0x20

$L144:
subu	$3,$21,$4
lw	$2,432($17)
addiu	$4,$4,-5
sw	$4,428($17)
sll	$2,$2,$3
lw	$4,428($17)
srl	$2,$2,27
addu	$18,$2,$18
sltu	$2,$4,5
bne	$2,$0,$L126
move	$20,$18

$L145:
subu	$3,$21,$4
addiu	$4,$4,-4
lw	$2,432($17)
sw	$4,428($17)
lw	$4,428($17)
sll	$2,$2,$3
srl	$16,$2,28
sltu	$2,$4,4
bne	$2,$0,$L147
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L146:
lw	$2,432($17)
subu	$3,$21,$4
sll	$2,$2,$3
addiu	$4,$4,-3
sw	$4,428($17)
srl	$5,$2,29
$L129:
slt	$3,$5,4
li	$4,4			# 0x4
li	$2,3			# 0x3
beq	$16,$0,$L132
movz	$4,$2,$3

addu	$18,$18,$16
slt	$2,$18,50
beq	$2,$0,$L142
subu	$2,$5,$4

sll	$2,$2,24
sra	$2,$2,24
addu	$5,$22,$20
move	$4,$0
$L135:
addiu	$4,$4,1
sb	$2,0($5)
bne	$4,$16,$L135
addiu	$5,$5,1

$L132:
beq	$19,$0,$L143
lw	$31,52($sp)

lw	$4,428($17)
sltu	$2,$4,6
beq	$2,$0,$L144
addiu	$19,$19,-1

$L124:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$17
jalr	$25
li	$5,5			# 0x5

lw	$4,428($17)
addu	$18,$2,$18
sltu	$2,$4,5
lw	$28,16($sp)
beq	$2,$0,$L145
move	$20,$18

$L126:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$17
jalr	$25
li	$5,4			# 0x4

lw	$4,428($17)
move	$16,$2
sltu	$2,$4,4
beq	$2,$0,$L146
lw	$28,16($sp)

lw	$25,%call16(a52_bitstream_get_bh)($28)
$L147:
li	$5,3			# 0x3
jalr	$25
move	$4,$17

lw	$28,16($sp)
b	$L129
move	$5,$2

$L143:
move	$2,$0
lw	$22,48($sp)
lw	$21,44($sp)
lw	$20,40($sp)
lw	$19,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,56

$L122:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$17
jalr	$25
li	$5,3			# 0x3

b	$L123
lw	$28,16($sp)

$L142:
lw	$31,52($sp)
li	$2,1			# 0x1
lw	$22,48($sp)
lw	$21,44($sp)
lw	$20,40($sp)
lw	$19,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,56

.set	macro
.set	reorder
.end	parse_deltba
.align	2
.globl	a52_frame
.ent	a52_frame
.type	a52_frame, @function
a52_frame:
.set	nomips16
.frame	$sp,56,$31		# vars= 0, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-56
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,52($sp)
sw	$19,48($sp)
sw	$18,44($sp)
sw	$17,40($sp)
sw	$16,36($sp)
.cprestore	24
lbu	$2,4($5)
lw	$25,%call16(a52_bitstream_set_ptr)($28)
srl	$2,$2,6
sb	$2,0($4)
lbu	$3,5($5)
lui	$2,%hi(halfrate)
addiu	$2,$2,%lo(halfrate)
srl	$3,$3,3
addu	$3,$3,$2
lbu	$8,0($3)
move	$16,$4
sb	$8,1($4)
lbu	$2,6($5)
addiu	$5,$5,6
srl	$17,$2,5
sb	$17,2($4)
move	$19,$6
jalr	$25
move	$18,$7

lw	$3,428($16)
sltu	$2,$3,4
bne	$2,$0,$L149
lw	$28,24($sp)

addiu	$2,$3,-3
sw	$2,428($16)
$L150:
li	$2,2			# 0x2
beq	$17,$2,$L201
andi	$2,$17,0x1

sw	$0,8($16)
beq	$2,$0,$L155
sw	$0,4($16)

li	$2,1			# 0x1
bne	$17,$2,$L202
nop

$L156:
lw	$4,428($16)
sltu	$2,$4,2
bne	$2,$0,$L223
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L215:
lw	$2,432($16)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($16)
srl	$2,$2,31
$L162:
sb	$2,3($16)
lw	$2,0($18)
lw	$25,%call16(a52_downmix_init)($28)
sll	$2,$2,26
sw	$2,0($18)
lw	$2,8($16)
lw	$5,0($19)
lw	$7,4($16)
move	$4,$17
sw	$2,16($sp)
jalr	$25
move	$6,$18

lw	$28,24($sp)
move	$3,$2
bltz	$2,$L163
sw	$2,12($16)

lbu	$2,3($16)
bne	$2,$0,$L203
nop

$L164:
lw	$3,12($16)
li	$4,2
sw	$3,0($19)
lw	$2,0($18)
sw	$0,36($16)
andi	$3,$2,0xffff
sra	$2,$2,16
sll	$3,$3,1
sll	$2,$2,17
addu	$2,$2,$3
sw	$2,28($16)
lw	$3,72($sp)
sw	$2,16($16)
sw	$3,20($16)
li	$3,1			# 0x1
sw	$3,24($16)
lw	$3,428($16)
sltu	$18,$17,1
sltu	$2,$3,6
sb	$4,490($16)
sb	$4,438($16)
sb	$4,698($16)
sb	$4,646($16)
sb	$4,594($16)
sb	$4,542($16)
bne	$2,$0,$L165
li	$17,32			# 0x20

$L207:
addiu	$2,$3,-5
sw	$2,428($16)
lw	$4,428($16)
sltu	$2,$4,2
bne	$2,$0,$L224
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L208:
lw	$2,432($16)
subu	$3,$17,$4
sll	$2,$2,$3
addiu	$4,$4,-1
srl	$2,$2,31
bne	$2,$0,$L204
sw	$4,428($16)

$L169:
lw	$4,428($16)
sltu	$2,$4,2
bne	$2,$0,$L225
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L209:
lw	$2,432($16)
subu	$3,$17,$4
sll	$2,$2,$3
addiu	$4,$4,-1
srl	$2,$2,31
bne	$2,$0,$L205
sw	$4,428($16)

$L173:
lw	$4,428($16)
sltu	$2,$4,2
bne	$2,$0,$L226
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L210:
lw	$2,432($16)
subu	$3,$17,$4
sll	$2,$2,$3
addiu	$4,$4,-1
srl	$2,$2,31
bne	$2,$0,$L206
sw	$4,428($16)

$L177:
beq	$18,$0,$L179
nop

$L211:
lw	$3,428($16)
sltu	$2,$3,6
beq	$2,$0,$L207
move	$18,$0

$L165:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,5			# 0x5

lw	$4,428($16)
sltu	$2,$4,2
beq	$2,$0,$L208
lw	$28,24($sp)

lw	$25,%call16(a52_bitstream_get_bh)($28)
$L224:
move	$4,$16
jalr	$25
li	$5,1			# 0x1

beq	$2,$0,$L169
lw	$28,24($sp)

$L204:
lw	$3,428($16)
sltu	$2,$3,9
bne	$2,$0,$L170
addiu	$2,$3,-8

sw	$2,428($16)
lw	$4,428($16)
sltu	$2,$4,2
beq	$2,$0,$L209
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L225:
move	$4,$16
jalr	$25
li	$5,1			# 0x1

beq	$2,$0,$L173
lw	$28,24($sp)

$L205:
lw	$3,428($16)
sltu	$2,$3,9
bne	$2,$0,$L174
addiu	$2,$3,-8

sw	$2,428($16)
lw	$4,428($16)
sltu	$2,$4,2
beq	$2,$0,$L210
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L226:
move	$4,$16
jalr	$25
li	$5,1			# 0x1

beq	$2,$0,$L177
lw	$28,24($sp)

$L206:
lw	$3,428($16)
sltu	$2,$3,8
bne	$2,$0,$L178
addiu	$2,$3,-7

bne	$18,$0,$L211
sw	$2,428($16)

$L179:
lw	$3,428($16)
sltu	$2,$3,3
bne	$2,$0,$L181
addiu	$2,$3,-2

sw	$2,428($16)
lw	$4,428($16)
sltu	$2,$4,2
bne	$2,$0,$L227
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L217:
lw	$2,432($16)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-1
srl	$2,$2,31
bne	$2,$0,$L212
sw	$4,428($16)

$L185:
lw	$4,428($16)
sltu	$2,$4,2
bne	$2,$0,$L228
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L218:
lw	$2,432($16)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-1
srl	$2,$2,31
bne	$2,$0,$L213
sw	$4,428($16)

$L189:
lw	$4,428($16)
sltu	$2,$4,2
bne	$2,$0,$L229
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L219:
lw	$2,432($16)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-1
srl	$2,$2,31
bne	$2,$0,$L214
sw	$4,428($16)

$L193:
lw	$31,52($sp)
$L231:
move	$2,$0
lw	$19,48($sp)
lw	$18,44($sp)
lw	$17,40($sp)
lw	$16,36($sp)
j	$31
addiu	$sp,$sp,56

$L201:
lw	$4,428($16)
sltu	$2,$4,3
bne	$2,$0,$L152
subu	$3,$0,$4

lw	$2,432($16)
sll	$2,$2,$3
addiu	$4,$4,-2
sw	$4,428($16)
srl	$2,$2,30
$L153:
xori	$3,$2,0x2
li	$2,10			# 0xa
movz	$17,$2,$3
sw	$0,8($16)
sw	$0,4($16)
$L155:
andi	$2,$17,0x4
beq	$2,$0,$L156
nop

lw	$4,428($16)
$L222:
sltu	$2,$4,3
bne	$2,$0,$L159
subu	$3,$0,$4

lw	$2,432($16)
sll	$2,$2,$3
addiu	$4,$4,-2
sw	$4,428($16)
srl	$2,$2,30
$L160:
lui	$3,%hi(slev.3175)
sll	$2,$2,2
addiu	$3,$3,%lo(slev.3175)
addu	$2,$2,$3
lw	$4,0($2)
sw	$4,8($16)
lw	$4,428($16)
sltu	$2,$4,2
beq	$2,$0,$L215
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L223:
move	$4,$16
jalr	$25
li	$5,1			# 0x1

b	$L162
lw	$28,24($sp)

$L170:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,8			# 0x8

b	$L169
lw	$28,24($sp)

$L178:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,7			# 0x7

b	$L177
lw	$28,24($sp)

$L174:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,8			# 0x8

b	$L173
lw	$28,24($sp)

$L203:
lw	$2,0($19)
andi	$2,$2,0x10
beq	$2,$0,$L164
ori	$2,$3,0x10

b	$L164
sw	$2,12($16)

$L214:
lw	$4,428($16)
$L221:
sltu	$2,$4,7
bne	$2,$0,$L194
subu	$3,$0,$4

lw	$2,432($16)
sll	$2,$2,$3
addiu	$4,$4,-6
sw	$4,428($16)
srl	$2,$2,26
$L195:
move	$17,$2
lw	$2,428($16)
addiu	$3,$2,-8
sltu	$2,$2,9
bne	$2,$0,$L230
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L216:
sw	$3,428($16)
$L197:
beq	$17,$0,$L231
lw	$31,52($sp)

lw	$2,428($16)
addiu	$3,$2,-8
sltu	$2,$2,9
beq	$2,$0,$L216
addiu	$17,$17,-1

lw	$25,%call16(a52_bitstream_get_bh)($28)
$L230:
move	$4,$16
jalr	$25
li	$5,8			# 0x8

b	$L197
lw	$28,24($sp)

$L181:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,2			# 0x2

lw	$4,428($16)
sltu	$2,$4,2
beq	$2,$0,$L217
lw	$28,24($sp)

lw	$25,%call16(a52_bitstream_get_bh)($28)
$L227:
move	$4,$16
jalr	$25
li	$5,1			# 0x1

beq	$2,$0,$L185
lw	$28,24($sp)

$L212:
lw	$3,428($16)
sltu	$2,$3,15
bne	$2,$0,$L186
addiu	$2,$3,-14

sw	$2,428($16)
lw	$4,428($16)
sltu	$2,$4,2
beq	$2,$0,$L218
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L228:
move	$4,$16
jalr	$25
li	$5,1			# 0x1

beq	$2,$0,$L189
lw	$28,24($sp)

$L213:
lw	$3,428($16)
sltu	$2,$3,15
bne	$2,$0,$L190
addiu	$2,$3,-14

sw	$2,428($16)
lw	$4,428($16)
sltu	$2,$4,2
beq	$2,$0,$L219
lw	$25,%call16(a52_bitstream_get_bh)($28)

$L229:
move	$4,$16
jalr	$25
li	$5,1			# 0x1

beq	$2,$0,$L193
lw	$28,24($sp)

b	$L221
lw	$4,428($16)

$L202:
lw	$4,428($16)
sltu	$2,$4,3
bne	$2,$0,$L157
subu	$3,$0,$4

lw	$2,432($16)
sll	$2,$2,$3
addiu	$4,$4,-2
sw	$4,428($16)
srl	$2,$2,30
$L158:
lui	$3,%hi(clev.3174)
sll	$2,$2,2
addiu	$3,$3,%lo(clev.3174)
addu	$2,$2,$3
lw	$4,0($2)
andi	$2,$17,0x4
beq	$2,$0,$L156
sw	$4,4($16)

b	$L222
lw	$4,428($16)

$L149:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,3			# 0x3

b	$L150
lw	$28,24($sp)

$L163:
lw	$31,52($sp)
li	$2,1			# 0x1
lw	$19,48($sp)
lw	$18,44($sp)
lw	$17,40($sp)
lw	$16,36($sp)
j	$31
addiu	$sp,$sp,56

$L194:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,6			# 0x6

b	$L195
lw	$28,24($sp)

$L157:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,2			# 0x2

b	$L158
lw	$28,24($sp)

$L186:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,14			# 0xe

b	$L185
lw	$28,24($sp)

$L190:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,14			# 0xe

b	$L189
lw	$28,24($sp)

$L159:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,2			# 0x2

b	$L160
lw	$28,24($sp)

$L152:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$16
jalr	$25
li	$5,2			# 0x2

b	$L153
lw	$28,24($sp)

.set	macro
.set	reorder
.end	a52_frame
.align	2
.globl	a52_block
.ent	a52_block
.type	a52_block, @function
a52_block:
.set	nomips16
.frame	$sp,216,$31		# vars= 136, regs= 10/0, args= 32, gp= 8
.mask	0xc0ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-216
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,212($sp)
sw	$fp,208($sp)
sw	$23,204($sp)
sw	$22,200($sp)
sw	$21,196($sp)
sw	$20,192($sp)
sw	$19,188($sp)
sw	$18,184($sp)
sw	$17,180($sp)
sw	$16,176($sp)
.cprestore	32
move	$19,$4
lui	$2,%hi(nfchans_tbl.3715)
lbu	$4,2($4)
addiu	$2,$2,%lo(nfchans_tbl.3715)
addu	$3,$2,$4
lbu	$20,0($3)
beq	$20,$0,$L233
addiu	$16,$sp,48

li	$18,32			# 0x20
addu	$17,$16,$20
$L236:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L234
subu	$3,$18,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L235:
sb	$2,0($16)
addiu	$16,$16,1
bne	$16,$17,$L236
nop

addiu	$16,$sp,56
li	$18,32			# 0x20
addu	$17,$16,$20
$L239:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L237
subu	$3,$18,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L238:
sb	$2,0($16)
addiu	$16,$16,1
bne	$16,$17,$L239
nop

lbu	$4,2($19)
$L233:
sltu	$16,$4,1
li	$17,32			# 0x20
lw	$4,428($19)
$L524:
sltu	$2,$4,2
bne	$2,$0,$L240
subu	$3,$17,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L241:
beq	$2,$0,$L242
nop

lw	$4,428($19)
sltu	$2,$4,9
bne	$2,$0,$L243
subu	$3,$17,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-8
sw	$4,428($19)
sra	$4,$2,24
$L244:
lw	$2,24($19)
beq	$2,$0,$L242
sra	$3,$4,5

andi	$2,$4,0x1f
lw	$25,36($19)
ori	$2,$2,0x20
addiu	$3,$3,21
beq	$25,$0,$L245
sll	$6,$2,$3

lw	$5,32($19)
jalr	$25
move	$4,$6

lw	$28,32($sp)
move	$6,$2
$L245:
lw	$3,16($19)
sra	$4,$6,16
andi	$2,$3,0xffff
mul	$7,$4,$2
sra	$3,$3,16
andi	$2,$6,0xffff
mul	$5,$2,$3
mul	$4,$4,$3
addu	$2,$5,$7
sll	$4,$4,6
sra	$2,$2,10
addu	$2,$2,$4
sw	$2,28($19)
$L242:
beq	$16,$0,$L246
move	$16,$0

b	$L524
lw	$4,428($19)

$L243:
lw	$25,%call16(a52_bitstream_get_bh_2)($28)
move	$4,$19
jalr	$25
li	$5,8			# 0x8

lw	$28,32($sp)
b	$L244
move	$4,$2

$L234:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L235
lw	$28,32($sp)

$L237:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L238
lw	$28,32($sp)

$L240:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L241
lw	$28,32($sp)

$L246:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L248
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L249:
bne	$2,$0,$L499
nop

$L250:
lbu	$2,40($19)
$L518:
beq	$2,$0,$L268
nop

beq	$20,$0,$L269
move	$17,$0

move	$16,$0
li	$23,32			# 0x20
li	$fp,15			# 0xf
$L284:
sra	$2,$2,$17
andi	$2,$2,0x1
bne	$2,$0,$L500
nop

$L270:
addiu	$17,$17,1
slt	$2,$17,$20
beq	$2,$0,$L283
nop

b	$L284
lbu	$2,40($19)

$L248:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L249
lw	$28,32($sp)

$L269:
move	$16,$0
$L283:
lbu	$3,2($19)
li	$2,2			# 0x2
beq	$3,$2,$L501
nop

$L285:
lbu	$2,40($19)
bne	$2,$0,$L298
move	$18,$0

$L299:
beq	$20,$0,$L302
nop

addiu	$16,$sp,40
li	$21,32			# 0x20
addu	$17,$16,$20
$L305:
lw	$4,428($19)
sltu	$2,$4,3
bne	$2,$0,$L303
subu	$3,$21,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-2
sw	$4,428($19)
srl	$2,$2,30
$L304:
sb	$2,0($16)
addiu	$16,$16,1
bne	$16,$17,$L305
nop

$L302:
lbu	$2,3($19)
bne	$2,$0,$L306
move	$fp,$0

$L307:
beq	$20,$0,$L310
addiu	$6,$sp,40

move	$17,$19
move	$16,$0
sw	$6,156($sp)
b	$L315
li	$21,32			# 0x20

$L502:
lbu	$2,42($19)
sb	$2,411($17)
$L311:
addiu	$16,$16,1
slt	$2,$16,$20
beq	$2,$0,$L310
addiu	$17,$17,1

$L315:
lw	$9,156($sp)
addu	$2,$9,$16
lbu	$3,0($2)
beq	$3,$0,$L311
nop

lbu	$2,40($19)
sra	$2,$2,$16
andi	$2,$2,0x1
bne	$2,$0,$L502
nop

lw	$4,428($19)
sltu	$2,$4,7
bne	$2,$0,$L313
lw	$25,%call16(a52_bitstream_get_bh)($28)

lw	$2,432($19)
subu	$3,$21,$4
sll	$2,$2,$3
addiu	$4,$4,-6
sw	$4,428($19)
srl	$3,$2,26
$L314:
slt	$2,$3,61
beq	$2,$0,$L258
sll	$2,$3,1

addu	$2,$2,$3
addiu	$2,$2,73
b	$L311
sb	$2,411($17)

$L500:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L271
subu	$3,$23,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L272:
beq	$2,$0,$L270
nop

lw	$4,428($19)
sltu	$2,$4,3
bne	$2,$0,$L273
subu	$3,$23,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-2
sw	$4,428($19)
srl	$4,$2,30
$L274:
lbu	$3,409($19)
sll	$2,$4,1
beq	$3,$0,$L275
addu	$22,$2,$4

sll	$2,$17,3
sll	$3,$17,6
addu	$2,$2,$3
addiu	$2,$2,48
addu	$18,$19,$2
move	$21,$0
$L282:
lw	$4,428($19)
sltu	$2,$4,5
bne	$2,$0,$L276
subu	$3,$23,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($19)
srl	$16,$2,28
$L277:
lw	$4,428($19)
sltu	$2,$4,5
bne	$2,$0,$L278
subu	$3,$23,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($19)
srl	$2,$2,28
$L279:
beq	$16,$fp,$L281
sll	$3,$2,14

ori	$2,$2,0x10
sll	$3,$2,13
$L281:
lbu	$2,409($19)
sll	$3,$3,11
addu	$4,$16,$22
addiu	$21,$21,1
sra	$3,$3,$4
slt	$2,$21,$2
sw	$3,0($18)
bne	$2,$0,$L282
addiu	$18,$18,4

$L275:
b	$L270
li	$16,1			# 0x1

$L271:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L272
lw	$28,32($sp)

$L278:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,4			# 0x4

b	$L279
lw	$28,32($sp)

$L276:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,4			# 0x4

lw	$28,32($sp)
b	$L277
move	$16,$2

$L273:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,2			# 0x2

lw	$28,32($sp)
b	$L274
move	$4,$2

$L501:
lbu	$2,41($19)
beq	$2,$0,$L286
nop

beq	$16,$0,$L286
nop

lbu	$5,409($19)
beq	$5,$0,$L286
nop

move	$16,$19
move	$17,$0
li	$18,32			# 0x20
$L290:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L287
subu	$3,$18,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L288:
beq	$2,$0,$L289
nop

lw	$2,120($16)
subu	$2,$0,$2
sw	$2,120($16)
$L289:
addiu	$17,$17,1
slt	$2,$17,$5
bne	$2,$0,$L290
addiu	$16,$16,4

$L268:
lbu	$3,2($19)
li	$2,2			# 0x2
bne	$3,$2,$L285
nop

$L286:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L291
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L292:
beq	$2,$0,$L285
nop

lbu	$2,40($19)
bne	$2,$0,$L293
sb	$0,410($19)

li	$21,253			# 0xfd
$L294:
lui	$2,%hi(rematrix_band.3716)
addiu	$16,$2,%lo(rematrix_band.3716)
move	$17,$0
li	$22,32			# 0x20
$L297:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L295
lbu	$18,410($19)

lw	$2,432($19)
subu	$3,$22,$4
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L296:
lw	$3,0($16)
sll	$2,$2,$17
or	$2,$18,$2
slt	$3,$3,$21
sb	$2,410($19)
beq	$3,$0,$L285
addiu	$16,$16,4

b	$L297
addiu	$17,$17,1

$L499:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L251
sb	$0,40($19)

lw	$2,432($19)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L252:
beq	$2,$0,$L250
nop

beq	$20,$0,$L253
nop

move	$16,$0
li	$18,32			# 0x20
$L256:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L254
lbu	$17,40($19)

lw	$2,432($19)
subu	$3,$18,$4
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L255:
sll	$2,$2,$16
addiu	$16,$16,1
or	$2,$17,$2
slt	$3,$16,$20
bne	$3,$0,$L256
sb	$2,40($19)

$L253:
lbu	$3,2($19)
sltu	$2,$3,2
bne	$2,$0,$L454
li	$2,1			# 0x1

li	$2,2			# 0x2
bne	$3,$2,$L257
move	$4,$19

.option	pic0
jal	bitstream_get
.option	pic2
li	$5,1			# 0x1

lw	$28,32($sp)
sb	$2,41($19)
$L257:
lw	$4,428($19)
sltu	$2,$4,5
bne	$2,$0,$L260
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($19)
srl	$16,$2,28
$L261:
lw	$4,428($19)
sltu	$2,$4,5
bne	$2,$0,$L262
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($19)
srl	$6,$2,28
$L263:
subu	$2,$6,$16
addiu	$17,$2,3
bltz	$17,$L258
lui	$2,%hi(bndtab.3745)

addiu	$2,$2,%lo(bndtab.3745)
addu	$2,$2,$16
sll	$4,$6,4
sll	$5,$16,2
sll	$3,$16,4
sll	$6,$6,2
subu	$3,$3,$5
subu	$4,$4,$6
lbu	$5,0($2)
addiu	$3,$3,37
addiu	$4,$4,73
slt	$2,$17,2
sb	$5,408($19)
sb	$3,42($19)
sb	$4,43($19)
sb	$17,409($19)
bne	$2,$0,$L250
sw	$0,44($19)

li	$16,1			# 0x1
li	$21,32			# 0x20
$L267:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L264
addiu	$18,$16,-1

lw	$2,432($19)
subu	$3,$21,$4
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L265:
beq	$2,$0,$L266
li	$3,1			# 0x1

lw	$2,44($19)
lbu	$4,409($19)
sll	$3,$3,$18
or	$2,$2,$3
addiu	$4,$4,-1
sw	$2,44($19)
sb	$4,409($19)
$L266:
addiu	$16,$16,1
bne	$16,$17,$L267
nop

b	$L518
lbu	$2,40($19)

$L254:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L255
lw	$28,32($sp)

$L295:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L296
lw	$28,32($sp)

$L293:
b	$L294
lbu	$21,42($19)

$L291:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L292
lw	$28,32($sp)

$L507:
.option	pic0
jal	parse_deltba
.option	pic2
addiu	$5,$19,439

beq	$2,$0,$L356
lw	$28,32($sp)

$L258:
li	$2,1			# 0x1
$L454:
lw	$31,212($sp)
lw	$fp,208($sp)
lw	$23,204($sp)
lw	$22,200($sp)
lw	$21,196($sp)
lw	$20,192($sp)
lw	$19,188($sp)
lw	$18,184($sp)
lw	$17,180($sp)
lw	$16,176($sp)
j	$31
addiu	$sp,$sp,216

$L264:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L265
lw	$28,32($sp)

$L251:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L252
lw	$28,32($sp)

$L262:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,4			# 0x4

lw	$28,32($sp)
b	$L263
move	$6,$2

$L260:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,4			# 0x4

lw	$28,32($sp)
b	$L261
move	$16,$2

$L303:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,2			# 0x2

b	$L304
lw	$28,32($sp)

$L310:
bne	$18,$0,$L316
move	$22,$0

$L317:
beq	$20,$0,$L320
addiu	$2,$sp,40

move	$21,$19
move	$17,$0
b	$L325
sw	$2,156($sp)

$L321:
addiu	$17,$17,1
slt	$2,$17,$20
beq	$2,$0,$L320
addiu	$21,$21,512

$L325:
lw	$3,156($sp)
addu	$2,$3,$17
lbu	$18,0($2)
beq	$18,$0,$L321
li	$4,1			# 0x1

lw	$8,428($19)
sll	$2,$4,$17
or	$2,$2,$22
addiu	$3,$18,-1
addu	$4,$19,$17
li	$6,3			# 0x3
sltu	$5,$8,5
andi	$22,$2,0x00ff
sll	$16,$6,$3
bne	$5,$0,$L322
lbu	$23,411($4)

lw	$2,432($19)
li	$9,32			# 0x20
subu	$3,$9,$8
sll	$2,$2,$3
addiu	$4,$8,-4
sw	$4,428($19)
srl	$7,$2,28
$L323:
addiu	$6,$23,-4
addu	$6,$6,$16
div	$0,$6,$16
teq	$16,$0,7
sll	$2,$17,9
andi	$7,$7,0x00ff
addu	$2,$19,$2
sb	$7,1315($21)
addiu	$2,$2,1316
move	$5,$18
move	$4,$19
sw	$2,16($sp)
.option	pic0
jal	parse_exponents
.option	pic2
mflo	$6

bne	$2,$0,$L258
lw	$28,32($sp)

lw	$3,428($19)
sltu	$2,$3,3
bne	$2,$0,$L324
addiu	$2,$3,-2

b	$L321
sw	$2,428($19)

$L306:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L308
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L309:
b	$L307
andi	$fp,$2,0x00ff

$L298:
lw	$4,428($19)
sltu	$2,$4,3
bne	$2,$0,$L300
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-2
sw	$4,428($19)
srl	$2,$2,30
$L301:
b	$L299
andi	$18,$2,0x00ff

$L287:
lw	$25,%call16(a52_bitstream_get_bh)($28)
li	$5,1			# 0x1
jalr	$25
move	$4,$19

lw	$28,32($sp)
b	$L288
lbu	$5,409($19)

$L308:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L309
lw	$28,32($sp)

$L300:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,2			# 0x2

b	$L301
lw	$28,32($sp)

$L313:
move	$4,$19
jalr	$25
li	$5,6			# 0x6

lw	$28,32($sp)
b	$L314
move	$3,$2

$L324:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,2			# 0x2

b	$L321
lw	$28,32($sp)

$L322:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,4			# 0x4

b	$L323
move	$7,$2

$L320:
beq	$fp,$0,$L326
move	$17,$22

lw	$4,428($19)
sltu	$2,$4,5
bne	$2,$0,$L327
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($19)
srl	$2,$2,28
andi	$7,$2,0x00ff
$L521:
sb	$7,3875($19)
addiu	$2,$19,3876
move	$5,$fp
move	$4,$19
li	$6,2			# 0x2
.option	pic0
jal	parse_exponents
.option	pic2
sw	$2,16($sp)

bne	$2,$0,$L258
lw	$28,32($sp)

ori	$17,$22,0x20
$L326:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L329
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L330:
bne	$2,$0,$L504
nop

$L331:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L334
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L335:
bne	$2,$0,$L505
nop

$L336:
lbu	$2,40($19)
bne	$2,$0,$L506
nop

$L345:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L348
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L349:
beq	$2,$0,$L350
nop

lbu	$2,40($19)
beq	$2,$0,$L351
move	$4,$19

.option	pic0
jal	bitstream_get
.option	pic2
li	$5,2			# 0x2

lw	$28,32($sp)
sb	$2,438($19)
$L351:
beq	$20,$0,$L352
sll	$9,$20,2

sll	$2,$20,4
subu	$2,$2,$9
addu	$2,$2,$20
sll	$2,$2,2
addu	$18,$19,$2
move	$16,$19
li	$17,32			# 0x20
$L355:
lw	$4,428($19)
sltu	$2,$4,3
bne	$2,$0,$L353
subu	$3,$17,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-2
sw	$4,428($19)
srl	$2,$2,30
$L354:
sb	$2,490($16)
addiu	$16,$16,52
bne	$16,$18,$L355
nop

$L352:
lbu	$2,40($19)
beq	$2,$0,$L356
li	$2,1			# 0x1

lbu	$3,438($19)
beq	$3,$2,$L507
move	$4,$19

$L356:
beq	$20,$0,$L360
li	$17,127			# 0x7f

move	$17,$19
move	$16,$0
li	$18,1			# 0x1
$L359:
lbu	$2,490($17)
beq	$2,$18,$L508
sll	$2,$16,2

$L358:
addiu	$16,$16,1
slt	$2,$16,$20
bne	$2,$0,$L359
addiu	$17,$17,52

b	$L360
li	$17,127			# 0x7f

$L350:
beq	$17,$0,$L361
nop

$L360:
lbu	$2,436($19)
bne	$2,$0,$L362
nop

lbu	$5,40($19)
beq	$5,$0,$L363
nop

lbu	$2,437($19)
srl	$2,$2,3
bne	$2,$0,$L522
andi	$2,$17,0x40

$L363:
lbu	$2,3($19)
beq	$2,$0,$L365
nop

lbu	$2,749($19)
srl	$2,$2,3
bne	$2,$0,$L366
nop

$L365:
beq	$20,$0,$L367
lw	$25,%call16(memset)($28)

lbu	$2,489($19)
srl	$2,$2,3
bne	$2,$0,$L366
move	$4,$19

move	$3,$0
$L368:
addiu	$3,$3,1
slt	$2,$3,$20
beq	$2,$0,$L509
lw	$25,%call16(memset)($28)

lbu	$2,541($4)
srl	$2,$2,3
beq	$2,$0,$L368
addiu	$4,$4,52

b	$L366
nop

$L362:
lbu	$5,40($19)
$L366:
beq	$5,$0,$L371
andi	$2,$17,0x40

$L522:
beq	$2,$0,$L371
lw	$25,%call16(a52_bit_allocate)($28)

lbu	$2,801($19)
lbu	$3,802($19)
lbu	$4,43($19)
lbu	$6,408($19)
lbu	$7,42($19)
sll	$2,$2,8
sll	$3,$3,8
addiu	$5,$19,803
sw	$4,16($sp)
sw	$5,28($sp)
sw	$2,20($sp)
sw	$3,24($sp)
move	$4,$19
jalr	$25
addiu	$5,$19,437

lw	$28,32($sp)
$L371:
beq	$20,$0,$L373
nop

move	$16,$0
sra	$2,$17,$16
$L523:
andi	$2,$2,0x1
beq	$2,$0,$L374
sll	$2,$16,2

sll	$5,$16,4
subu	$5,$5,$2
addu	$3,$19,$16
addu	$5,$5,$16
sll	$2,$16,9
lbu	$4,411($3)
sll	$5,$5,2
addu	$2,$19,$2
lw	$25,%call16(a52_bit_allocate)($28)
addiu	$2,$2,1315
addu	$5,$19,$5
sw	$4,16($sp)
sw	$2,28($sp)
sw	$0,20($sp)
sw	$0,24($sp)
addiu	$5,$5,489
move	$4,$19
move	$6,$0
jalr	$25
move	$7,$0

lw	$28,32($sp)
$L374:
addiu	$16,$16,1
slt	$2,$16,$20
bne	$2,$0,$L523
sra	$2,$17,$16

$L373:
lbu	$2,3($19)
beq	$2,$0,$L361
andi	$2,$17,0x20

beq	$2,$0,$L361
lw	$25,%call16(a52_bit_allocate)($28)

addiu	$4,$19,3875
li	$2,2
li	$3,7			# 0x7
sb	$2,750($19)
addiu	$5,$19,749
sw	$4,28($sp)
sw	$3,16($sp)
sw	$0,20($sp)
sw	$0,24($sp)
move	$4,$19
move	$6,$0
jalr	$25
move	$7,$0

lw	$28,32($sp)
$L361:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L376
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L377:
bne	$2,$0,$L510
nop

$L378:
lw	$4,8($19)
addiu	$6,$sp,64
lw	$22,4388($19)
lw	$3,12($19)
lbu	$5,2($19)
lw	$2,4($19)
sw	$6,164($sp)
lw	$7,28($19)
lw	$25,%call16(a52_downmix_coeff)($28)
sw	$4,20($sp)
lw	$4,164($sp)
sw	$2,16($sp)
move	$6,$3
addiu	$2,$22,1024
andi	$3,$3,0x10
jalr	$25
movn	$22,$2,$3

li	$3,-1			# 0xffffffffffffffff
lw	$28,32($sp)
sw	$3,116($sp)
sw	$2,152($sp)
sw	$3,124($sp)
beq	$20,$0,$L385
sw	$3,120($sp)

lw	$9,164($sp)
addiu	$13,$sp,56
addiu	$2,$sp,104
sw	$9,140($sp)
sw	$19,136($sp)
sw	$22,128($sp)
sw	$0,132($sp)
move	$16,$0
sw	$13,160($sp)
sw	$2,168($sp)
$L430:
lw	$3,160($sp)
lw	$4,132($sp)
lw	$5,140($sp)
addu	$2,$3,$4
lbu	$3,0($2)
lw	$4,0($5)
lw	$9,132($sp)
lw	$13,136($sp)
sw	$3,20($sp)
sw	$4,16($sp)
sll	$6,$9,9
lbu	$2,411($13)
addu	$6,$19,$6
lw	$5,128($sp)
lw	$7,168($sp)
addiu	$6,$6,1315
move	$4,$19
.option	pic0
jal	coeff_get
.option	pic2
sw	$2,24($sp)

lbu	$2,40($19)
lw	$3,132($sp)
sra	$2,$2,$3
andi	$2,$2,0x1
beq	$2,$0,$L386
lw	$28,32($sp)

beq	$16,$0,$L387
nop

lbu	$3,43($19)
$L388:
lw	$5,132($sp)
sll	$2,$5,8
addu	$2,$3,$2
sll	$2,$2,2
addu	$4,$22,$2
$L429:
addiu	$3,$3,1
slt	$2,$3,256
sw	$0,0($4)
bne	$2,$0,$L429
addiu	$4,$4,4

lw	$6,132($sp)
lw	$9,140($sp)
lw	$13,136($sp)
lw	$3,128($sp)
addiu	$6,$6,1
addiu	$9,$9,4
addiu	$13,$13,1
addiu	$3,$3,1024
slt	$2,$6,$20
sw	$6,132($sp)
sw	$9,140($sp)
sw	$13,136($sp)
bne	$2,$0,$L430
sw	$3,128($sp)

$L385:
lbu	$3,2($19)
li	$2,2			# 0x2
beq	$3,$2,$L511
lui	$3,%hi(rematrix_band.3716)

$L431:
lbu	$2,3($19)
beq	$2,$0,$L437
nop

lw	$2,12($19)
andi	$2,$2,0x10
beq	$2,$0,$L438
li	$2,7			# 0x7

lw	$3,28($19)
addiu	$16,$22,-1024
move	$4,$19
move	$5,$16
addiu	$6,$19,3875
addiu	$7,$sp,104
sw	$3,16($sp)
sw	$2,24($sp)
.option	pic0
jal	coeff_get
.option	pic2
sw	$0,20($sp)

lw	$28,32($sp)
move	$3,$0
li	$4,996			# 0x3e4
$L439:
addu	$2,$22,$3
addiu	$3,$3,4
bne	$3,$4,$L439
sw	$0,-996($2)

lw	$25,%call16(a52_imdct_512)($28)
lw	$6,20($19)
move	$4,$16
jalr	$25
addiu	$5,$22,5120

lw	$28,32($sp)
$L437:
lw	$6,12($19)
lui	$4,%hi(nfchans_tbl.3715)
andi	$2,$6,0xf
addiu	$4,$4,%lo(nfchans_tbl.3715)
addu	$2,$4,$2
lbu	$18,0($2)
slt	$3,$18,$20
beq	$3,$0,$L440
li	$2,1			# 0x1

beq	$20,$2,$L441
lbu	$2,48($sp)

lbu	$16,49($sp)
bne	$2,$16,$L442
li	$4,1			# 0x1

b	$L443
addiu	$5,$sp,48

$L444:
lbu	$3,0($2)
bne	$3,$16,$L442
nop

$L443:
addiu	$4,$4,1
slt	$2,$4,$20
bne	$2,$0,$L444
addu	$2,$5,$4

$L445:
lw	$2,4($19)
lw	$3,8($19)
lbu	$5,2($19)
lw	$25,%call16(a52_downmix)($28)
sw	$2,16($sp)
sw	$3,20($sp)
move	$4,$22
jalr	$25
move	$7,$0

lw	$2,4392($19)
bne	$2,$0,$L455
lw	$28,32($sp)

lw	$4,8($19)
lw	$3,4($19)
lbu	$5,2($19)
lw	$6,12($19)
lw	$25,%call16(a52_downmix)($28)
li	$2,1			# 0x1
sw	$2,4392($19)
move	$7,$0
sw	$4,20($sp)
sw	$3,16($sp)
jalr	$25
addiu	$4,$22,6144

lw	$28,32($sp)
$L455:
bne	$16,$0,$L456
nop

beq	$18,$0,$L458
move	$16,$22

move	$17,$0
$L460:
lw	$25,%call16(a52_imdct_512)($28)
lw	$6,20($19)
move	$4,$16
addiu	$5,$16,6144
jalr	$25
addiu	$17,$17,1

slt	$2,$17,$18
lw	$28,32($sp)
bne	$2,$0,$L460
addiu	$16,$16,1024

$L458:
b	$L454
move	$2,$0

$L386:
lw	$4,136($sp)
b	$L388
lbu	$3,411($4)

$L440:
beq	$20,$0,$L445
lbu	$16,48($sp)

$L442:
lw	$2,4392($19)
bne	$2,$0,$L495
lw	$25,%call16(a52_upmix)($28)

addiu	$16,$22,6144
$L446:
move	$18,$16
lw	$21,164($sp)
move	$16,$22
move	$17,$0
li	$23,256			# 0x100
b	$L453
addiu	$fp,$sp,48

$L513:
move	$6,$0
$L448:
lw	$2,0($21)
beq	$2,$0,$L449
move	$3,$16

addu	$2,$fp,$17
lbu	$3,0($2)
beq	$3,$0,$L498
lw	$25,%call16(a52_imdct_512)($28)

lw	$25,%call16(a52_imdct_256)($28)
$L498:
move	$4,$16
jalr	$25
move	$5,$18

lw	$28,32($sp)
addiu	$17,$17,1
$L519:
slt	$2,$17,$20
addiu	$16,$16,1024
addiu	$18,$18,1024
beq	$2,$0,$L512
addiu	$21,$21,4

$L453:
lw	$5,152($sp)
sra	$2,$5,$17
andi	$2,$2,0x1
bne	$2,$0,$L513
nop

b	$L448
lw	$6,20($19)

$L449:
move	$2,$0
$L452:
addiu	$2,$2,1
sw	$6,0($3)
bne	$2,$23,$L452
addiu	$3,$3,4

b	$L519
addiu	$17,$17,1

$L495:
addiu	$16,$22,6144
lbu	$5,2($19)
sw	$0,4392($19)
jalr	$25
move	$4,$16

b	$L446
lw	$28,32($sp)

$L512:
lw	$2,4($19)
lw	$3,8($19)
lbu	$5,2($19)
lw	$6,12($19)
lw	$7,20($19)
lw	$25,%call16(a52_downmix)($28)
sw	$2,16($sp)
sw	$3,20($sp)
jalr	$25
move	$4,$22

lw	$28,32($sp)
b	$L454
move	$2,$0

$L510:
lw	$4,428($19)
sltu	$2,$4,10
bne	$2,$0,$L379
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-9
sw	$4,428($19)
srl	$2,$2,23
$L380:
move	$16,$2
li	$17,-1			# 0xffffffffffffffff
$L494:
addiu	$16,$16,-1
beq	$16,$17,$L378
nop

lw	$3,428($19)
sltu	$2,$3,9
bne	$2,$0,$L382
addiu	$2,$3,-8

b	$L494
sw	$2,428($19)

$L376:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L377
lw	$28,32($sp)

$L382:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,8			# 0x8

b	$L494
lw	$28,32($sp)

$L379:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,9			# 0x9

b	$L380
lw	$28,32($sp)

$L441:
b	$L445
lbu	$16,48($sp)

$L456:
beq	$18,$0,$L458
move	$16,$22

move	$17,$0
$L459:
lw	$25,%call16(a52_imdct_256)($28)
lw	$6,20($19)
move	$4,$16
addiu	$5,$16,6144
jalr	$25
addiu	$17,$17,1

slt	$2,$17,$18
lw	$28,32($sp)
bne	$2,$0,$L459
addiu	$16,$16,1024

b	$L454
move	$2,$0

$L387:
lw	$4,44($19)
sw	$4,144($sp)
lbu	$10,43($19)
lbu	$6,42($19)
move	$3,$10
slt	$2,$6,$10
beq	$2,$0,$L514
sw	$0,148($sp)

$L428:
lw	$5,144($sp)
andi	$2,$5,0x1
beq	$2,$0,$L390
addiu	$23,$6,12

$L464:
lw	$9,144($sp)
addiu	$23,$23,12
sra	$9,$9,1
andi	$2,$9,0x1
bne	$2,$0,$L464
sw	$9,144($sp)

$L390:
lw	$13,148($sp)
move	$7,$0
addiu	$2,$13,12
sll	$2,$2,2
addu	$8,$19,$2
sll	$9,$20,2
addiu	$fp,$sp,84
$L392:
lw	$2,164($sp)
lw	$4,0($8)
addu	$3,$2,$7
lw	$2,0($3)
andi	$3,$4,0xffff
sra	$5,$2,16
sra	$4,$4,16
andi	$2,$2,0xffff
mul	$11,$5,$3
mul	$3,$2,$4
mul	$5,$4,$5
addu	$2,$3,$11
sll	$5,$5,6
sra	$2,$2,10
addu	$3,$fp,$7
addu	$2,$2,$5
addiu	$7,$7,4
sw	$2,0($3)
bne	$7,$9,$L392
addiu	$8,$8,72

slt	$2,$6,$23
beq	$2,$0,$L393
addu	$2,$19,$6

addiu	$17,$2,803
addiu	$18,$6,1
$L427:
lb	$16,256($17)
addiu	$2,$16,3
andi	$2,$2,0x00ff
sltu	$3,$2,8
bne	$3,$0,$L515
addiu	$21,$18,-1

$L394:
lw	$5,428($19)
sltu	$2,$16,$5
beq	$2,$0,$L422
li	$3,32			# 0x20

lw	$4,432($19)
subu	$2,$3,$5
sll	$4,$4,$2
subu	$3,$3,$16
subu	$2,$5,$16
sra	$4,$4,$3
sw	$2,428($19)
$L423:
li	$2,16			# 0x10
subu	$2,$2,$16
sll	$2,$4,$2
sll	$5,$2,16
sra	$5,$5,16
$L409:
sll	$2,$21,2
addu	$8,$22,$2
move	$7,$fp
move	$6,$0
$L426:
lbu	$2,40($19)
sra	$2,$2,$6
andi	$2,$2,0x1
beq	$2,$0,$L424
nop

lw	$2,0($7)
lbu	$4,0($17)
andi	$3,$2,0xffff
mul	$3,$5,$3
sra	$2,$2,16
mul	$9,$5,$2
sra	$3,$3,16
addiu	$4,$4,-5
bltz	$4,$L425
addu	$3,$9,$3

sra	$2,$3,$4
sw	$2,0($8)
$L424:
addiu	$6,$6,1
slt	$2,$6,$20
addiu	$8,$8,1024
bne	$2,$0,$L426
addiu	$7,$7,4

slt	$2,$18,$23
move	$6,$18
addiu	$17,$17,1
bne	$2,$0,$L427
addiu	$18,$18,1

lbu	$10,43($19)
$L393:
lw	$2,148($sp)
lw	$13,144($sp)
addiu	$2,$2,1
sra	$13,$13,1
sw	$2,148($sp)
slt	$2,$6,$10
sw	$13,144($sp)
bne	$2,$0,$L428
move	$3,$10

$L514:
b	$L388
li	$16,1			# 0x1

$L425:
subu	$2,$0,$4
sll	$2,$3,$2
b	$L424
sw	$2,0($8)

$L515:
lui	$4,%hi($L401)
sll	$2,$2,2
addiu	$4,$4,%lo($L401)
addu	$2,$4,$2
lw	$3,0($2)
addu	$3,$3,$28
j	$3
nop

.rdata
.align	2
.align	2
$L401:
.gpword	$L395
.gpword	$L396
.gpword	$L397
.gpword	$L398
.gpword	$L394
.gpword	$L394
.gpword	$L399
.gpword	$L400
.text
$L400:
lw	$4,428($19)
sltu	$2,$4,5
bne	$2,$0,$L420
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($19)
srl	$2,$2,28
$L421:
lui	$6,%hi(q_5)
sll	$2,$2,1
addiu	$6,$6,%lo(q_5)
addu	$2,$2,$6
b	$L409
lh	$5,0($2)

$L399:
lw	$4,428($19)
sltu	$2,$4,4
bne	$2,$0,$L415
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-3
sw	$4,428($19)
srl	$2,$2,29
$L416:
lui	$3,%hi(q_3)
sll	$2,$2,1
addiu	$3,$3,%lo(q_3)
addu	$2,$2,$3
b	$L409
lh	$5,0($2)

$L398:
sll	$10,$21,2
addu	$7,$22,$10
move	$9,$fp
move	$8,$22
move	$6,$0
li	$12,15564			# 0x3ccc
li	$11,11585			# 0x2d41
$L406:
lbu	$2,40($19)
sra	$2,$2,$6
andi	$2,$2,0x1
beq	$2,$0,$L402
lw	$5,160($sp)

addu	$2,$5,$6
lbu	$3,0($2)
beq	$3,$0,$L403
lui	$13,%hi(dither_lut)

lhu	$4,424($19)
srl	$2,$4,8
addiu	$13,$13,%lo(dither_lut)
sll	$2,$2,1
addu	$2,$2,$13
lhu	$3,0($2)
sll	$4,$4,8
lw	$5,0($9)
xor	$3,$3,$4
sll	$3,$3,16
sra	$3,$3,16
andi	$2,$5,0xffff
mul	$2,$3,$2
sra	$5,$5,16
mul	$13,$3,$5
lbu	$4,0($17)
sra	$2,$2,16
addiu	$4,$4,-5
addu	$5,$13,$2
bltz	$4,$L404
sh	$3,424($19)

sra	$2,$5,$4
sw	$2,0($7)
$L405:
addu	$4,$8,$10
lw	$2,0($4)
andi	$3,$2,0xffff
sra	$2,$2,16
mul	$13,$3,$11
mul	$5,$2,$12
mul	$3,$2,$11
addu	$2,$5,$13
sll	$3,$3,2
sra	$2,$2,14
addu	$2,$2,$3
sw	$2,0($4)
$L402:
addiu	$6,$6,1
slt	$2,$6,$20
addiu	$8,$8,1024
addiu	$7,$7,1024
bne	$2,$0,$L406
addiu	$9,$9,4

slt	$2,$18,$23
move	$6,$18
addiu	$17,$17,1
bne	$2,$0,$L427
addiu	$18,$18,1

b	$L393
lbu	$10,43($19)

$L397:
lw	$3,116($sp)
bltz	$3,$L408
sll	$2,$3,1

addu	$4,$sp,$2
addiu	$3,$3,-1
sw	$3,116($sp)
b	$L409
lh	$5,104($4)

$L396:
lw	$3,120($sp)
bltz	$3,$L412
sll	$2,$3,1

addu	$4,$sp,$2
addiu	$3,$3,-1
sw	$3,120($sp)
b	$L409
lh	$5,108($4)

$L395:
lw	$2,124($sp)
bne	$2,$0,$L417
li	$2,-1			# 0xffffffffffffffff

sw	$2,124($sp)
b	$L409
lh	$5,112($sp)

$L403:
b	$L402
sw	$0,0($7)

$L404:
subu	$2,$0,$4
sll	$2,$5,$2
b	$L405
sw	$2,0($7)

$L420:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,4			# 0x4

b	$L421
lw	$28,32($sp)

$L415:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,3			# 0x3

b	$L416
lw	$28,32($sp)

$L422:
lw	$25,%call16(a52_bitstream_get_bh_2)($28)
move	$4,$19
jalr	$25
move	$5,$16

lw	$28,32($sp)
b	$L423
move	$4,$2

$L417:
lw	$4,428($19)
sltu	$2,$4,8
bne	$2,$0,$L418
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-7
sw	$4,428($19)
srl	$2,$2,25
$L419:
lui	$4,%hi(q_4_1)
sll	$2,$2,1
addiu	$4,$4,%lo(q_4_1)
addu	$3,$2,$4
lui	$5,%hi(q_4_0)
addiu	$5,$5,%lo(q_4_0)
lhu	$4,0($3)
addu	$2,$2,$5
sh	$4,112($sp)
sw	$0,124($sp)
b	$L409
lh	$5,0($2)

$L412:
lw	$4,428($19)
sltu	$2,$4,8
bne	$2,$0,$L413
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-7
sw	$4,428($19)
srl	$2,$2,25
$L414:
lui	$9,%hi(q_2_2)
sll	$3,$2,1
addiu	$9,$9,%lo(q_2_2)
lui	$13,%hi(q_2_1)
addu	$2,$3,$9
addiu	$13,$13,%lo(q_2_1)
lhu	$5,0($2)
addu	$4,$3,$13
lui	$2,%hi(q_2_0)
addiu	$2,$2,%lo(q_2_0)
lhu	$6,0($4)
addu	$3,$3,$2
li	$2,1			# 0x1
sh	$5,108($sp)
sw	$2,120($sp)
sh	$6,110($sp)
b	$L409
lh	$5,0($3)

$L408:
lw	$4,428($19)
sltu	$2,$4,6
bne	$2,$0,$L410
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-5
sw	$4,428($19)
srl	$2,$2,27
$L411:
lui	$6,%hi(q_1_2)
sll	$4,$2,1
addiu	$6,$6,%lo(q_1_2)
lui	$3,%hi(q_1_1)
addu	$2,$4,$6
addiu	$3,$3,%lo(q_1_1)
addu	$3,$4,$3
lhu	$5,0($2)
lui	$2,%hi(q_1_0)
lhu	$6,0($3)
addiu	$2,$2,%lo(q_1_0)
addu	$4,$4,$2
li	$3,1			# 0x1
sh	$5,104($sp)
sw	$3,116($sp)
sh	$6,106($sp)
b	$L409
lh	$5,0($4)

$L418:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,7			# 0x7

b	$L419
lw	$28,32($sp)

$L413:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,7			# 0x7

b	$L414
lw	$28,32($sp)

$L410:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,5			# 0x5

b	$L411
lw	$28,32($sp)

$L511:
lbu	$11,411($19)
lbu	$2,412($19)
sltu	$4,$2,$11
lbu	$10,410($19)
movn	$11,$2,$4
addiu	$9,$3,%lo(rematrix_band.3716)
b	$L436
li	$6,13			# 0xd

$L517:
lw	$6,0($9)
sra	$10,$10,1
$L434:
slt	$2,$6,$11
beq	$2,$0,$L431
addiu	$9,$9,4

$L436:
andi	$2,$10,0x1
beq	$2,$0,$L517
addiu	$2,$6,256

lw	$5,0($9)
sll	$2,$2,2
slt	$3,$5,$11
sll	$4,$6,2
move	$12,$5
movz	$12,$11,$3
addu	$8,$22,$4
addu	$7,$22,$2
$L435:
lw	$3,0($8)
lw	$2,0($7)
addiu	$6,$6,1
subu	$4,$3,$2
slt	$5,$6,$12
addu	$2,$2,$3
sw	$2,0($8)
sw	$4,0($7)
addiu	$8,$8,4
bne	$5,$0,$L435
addiu	$7,$7,4

b	$L434
sra	$10,$10,1

$L438:
move	$4,$19
addiu	$5,$22,5120
addiu	$6,$19,3875
addiu	$7,$sp,104
sw	$2,24($sp)
sw	$0,16($sp)
.option	pic0
jal	coeff_get
.option	pic2
sw	$0,20($sp)

b	$L437
lw	$28,32($sp)

$L509:
addiu	$4,$19,1059
move	$5,$0
jalr	$25
li	$6,256			# 0x100

lw	$28,32($sp)
move	$16,$0
$L372:
sll	$4,$16,9
lw	$25,%call16(memset)($28)
addu	$4,$19,$4
addiu	$4,$4,1571
addiu	$16,$16,1
move	$5,$0
jalr	$25
li	$6,256			# 0x100

slt	$2,$16,$20
bne	$2,$0,$L372
lw	$28,32($sp)

b	$L520
lw	$25,%call16(memset)($28)

$L367:
addiu	$4,$19,1059
move	$5,$0
jalr	$25
li	$6,256			# 0x100

lw	$28,32($sp)
lw	$25,%call16(memset)($28)
$L520:
addiu	$4,$19,4131
move	$5,$0
jalr	$25
li	$6,256			# 0x100

b	$L361
lw	$28,32($sp)

$L353:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,2			# 0x2

b	$L354
lw	$28,32($sp)

$L508:
sll	$5,$16,4
subu	$5,$5,$2
addu	$5,$5,$16
sll	$5,$5,2
addu	$5,$19,$5
addiu	$5,$5,491
.option	pic0
jal	parse_deltba
.option	pic2
move	$4,$19

beq	$2,$0,$L358
lw	$28,32($sp)

b	$L454
li	$2,1			# 0x1

$L348:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L349
lw	$28,32($sp)

$L506:
lw	$4,428($19)
sltu	$2,$4,2
bne	$2,$0,$L346
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-1
sw	$4,428($19)
srl	$2,$2,31
$L347:
beq	$2,$0,$L345
ori	$2,$17,0x40

move	$4,$19
li	$5,3			# 0x3
li	$16,9			# 0x9
.option	pic0
jal	bitstream_get
.option	pic2
andi	$17,$2,0x00ff

subu	$2,$16,$2
sb	$2,801($19)
move	$4,$19
.option	pic0
jal	bitstream_get
.option	pic2
li	$5,3			# 0x3

subu	$16,$16,$2
lw	$28,32($sp)
b	$L345
sb	$16,802($19)

$L505:
lw	$4,428($19)
sltu	$2,$4,7
bne	$2,$0,$L337
lw	$25,%call16(a52_bitstream_get_bh)($28)

lw	$2,432($19)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-6
sw	$4,428($19)
srl	$3,$2,26
$L338:
lbu	$2,40($19)
beq	$2,$0,$L339
sb	$3,436($19)

move	$4,$19
.option	pic0
jal	bitstream_get
.option	pic2
li	$5,7			# 0x7

lw	$28,32($sp)
sb	$2,437($19)
$L339:
beq	$20,$0,$L340
sll	$9,$20,2

sll	$2,$20,4
subu	$2,$2,$9
addu	$2,$2,$20
sll	$2,$2,2
addu	$18,$19,$2
move	$16,$19
li	$17,32			# 0x20
$L343:
lw	$4,428($19)
sltu	$2,$4,8
bne	$2,$0,$L341
subu	$3,$17,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-7
sw	$4,428($19)
srl	$2,$2,25
$L342:
sb	$2,489($16)
addiu	$16,$16,52
bne	$16,$18,$L343
nop

$L340:
lbu	$2,3($19)
beq	$2,$0,$L496
move	$4,$19

.option	pic0
jal	bitstream_get
.option	pic2
li	$5,7			# 0x7

lw	$28,32($sp)
sb	$2,749($19)
$L496:
b	$L336
li	$17,127			# 0x7f

$L337:
move	$4,$19
jalr	$25
li	$5,6			# 0x6

lw	$28,32($sp)
b	$L338
move	$3,$2

$L334:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L335
lw	$28,32($sp)

$L504:
lw	$4,428($19)
sltu	$2,$4,12
bne	$2,$0,$L332
subu	$3,$0,$4

lw	$2,432($19)
sll	$2,$2,$3
addiu	$4,$4,-11
sw	$4,428($19)
srl	$2,$2,21
$L333:
sh	$2,416($19)
b	$L331
li	$17,127			# 0x7f

$L329:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L330
lw	$28,32($sp)

$L332:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,11			# 0xb

b	$L333
lw	$28,32($sp)

$L316:
lw	$4,428($19)
lbu	$5,42($19)
sltu	$2,$4,5
lbu	$17,43($19)
bne	$2,$0,$L318
move	$16,$5

lw	$2,432($19)
subu	$3,$0,$4
sll	$2,$2,$3
addiu	$4,$4,-4
sw	$4,428($19)
srl	$7,$2,28
$L319:
addiu	$3,$18,-1
li	$2,3			# 0x3
sll	$2,$2,$3
subu	$6,$17,$16
div	$0,$6,$2
teq	$2,$0,7
sll	$7,$7,1
addu	$2,$19,$5
addiu	$2,$2,803
move	$5,$18
andi	$7,$7,0xfe
move	$4,$19
sw	$2,16($sp)
.option	pic0
jal	parse_exponents
.option	pic2
mflo	$6

bne	$2,$0,$L258
lw	$28,32($sp)

b	$L317
li	$22,64			# 0x40

$L327:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,4			# 0x4

b	$L521
andi	$7,$2,0x00ff

$L318:
lw	$25,%call16(a52_bitstream_get_bh)($28)
li	$5,4			# 0x4
jalr	$25
move	$4,$19

lbu	$5,42($19)
b	$L319
move	$7,$2

$L346:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,1			# 0x1

b	$L347
lw	$28,32($sp)

$L341:
lw	$25,%call16(a52_bitstream_get_bh)($28)
move	$4,$19
jalr	$25
li	$5,7			# 0x7

b	$L342
lw	$28,32($sp)

.set	macro
.set	reorder
.end	a52_block
.rdata
.align	2
.type	bndtab.3745, @object
.size	bndtab.3745, 16
bndtab.3745:
.byte	31
.byte	35
.byte	37
.byte	39
.byte	41
.byte	42
.byte	43
.byte	44
.byte	45
.byte	45
.byte	46
.byte	46
.byte	47
.byte	47
.byte	48
.byte	48
.align	2
.type	rematrix_band.3716, @object
.size	rematrix_band.3716, 16
rematrix_band.3716:
.word	25
.word	37
.word	61
.word	253
.align	2
.type	nfchans_tbl.3715, @object
.size	nfchans_tbl.3715, 11
nfchans_tbl.3715:
.byte	2
.byte	1
.byte	2
.byte	3
.byte	3
.byte	4
.byte	4
.byte	5
.byte	1
.byte	1
.byte	2
.align	2
.type	exp_1, @object
.size	exp_1, 128
exp_1:
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	25
.byte	25
.byte	25
.align	2
.type	exp_2, @object
.size	exp_2, 128
exp_2:
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-2
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	-1
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	25
.byte	25
.byte	25
.align	2
.type	exp_3, @object
.size	exp_3, 128
exp_3:
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	-2
.byte	-1
.byte	0
.byte	1
.byte	2
.byte	25
.byte	25
.byte	25
.align	2
.type	q_1_2, @object
.size	q_1_2, 64
q_1_2:
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	-21845
.half	0
.half	21845
.half	0
.half	0
.half	0
.half	0
.half	0
.align	2
.type	q_1_1, @object
.size	q_1_1, 64
q_1_1:
.half	-21845
.half	-21845
.half	-21845
.half	0
.half	0
.half	0
.half	21845
.half	21845
.half	21845
.half	-21845
.half	-21845
.half	-21845
.half	0
.half	0
.half	0
.half	21845
.half	21845
.half	21845
.half	-21845
.half	-21845
.half	-21845
.half	0
.half	0
.half	0
.half	21845
.half	21845
.half	21845
.half	0
.half	0
.half	0
.half	0
.half	0
.align	2
.type	q_1_0, @object
.size	q_1_0, 64
q_1_0:
.half	-21845
.half	-21845
.half	-21845
.half	-21845
.half	-21845
.half	-21845
.half	-21845
.half	-21845
.half	-21845
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	21845
.half	21845
.half	21845
.half	21845
.half	21845
.half	21845
.half	21845
.half	21845
.half	21845
.half	0
.half	0
.half	0
.half	0
.half	0
.align	2
.type	q_2_2, @object
.size	q_2_2, 256
q_2_2:
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	-26214
.half	-13107
.half	0
.half	13107
.half	26214
.half	0
.half	0
.half	0
.align	2
.type	q_2_1, @object
.size	q_2_1, 256
q_2_1:
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	0
.half	0
.half	0
.half	0
.half	0
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	0
.half	0
.half	0
.half	0
.half	0
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	0
.half	0
.half	0
.half	0
.half	0
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	0
.half	0
.half	0
.half	0
.half	0
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	0
.half	0
.half	0
.half	0
.half	0
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	0
.half	0
.half	0
.align	2
.type	q_2_0, @object
.size	q_2_0, 256
q_2_0:
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-26214
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	-13107
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	13107
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	26214
.half	0
.half	0
.half	0
.align	2
.type	q_3, @object
.size	q_3, 16
q_3:
.half	-28087
.half	-18725
.half	-9362
.half	0
.half	9362
.half	18725
.half	28087
.half	0
.align	2
.type	q_4_1, @object
.size	q_4_1, 256
q_4_1:
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	-29789
.half	-23831
.half	-17873
.half	-11916
.half	-5958
.half	0
.half	5958
.half	11916
.half	17873
.half	23831
.half	29789
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.align	2
.type	q_4_0, @object
.size	q_4_0, 256
q_4_0:
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-29789
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-23831
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-17873
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-11916
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	-5958
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	5958
.half	5958
.half	5958
.half	5958
.half	5958
.half	5958
.half	5958
.half	5958
.half	5958
.half	5958
.half	5958
.half	11916
.half	11916
.half	11916
.half	11916
.half	11916
.half	11916
.half	11916
.half	11916
.half	11916
.half	11916
.half	11916
.half	17873
.half	17873
.half	17873
.half	17873
.half	17873
.half	17873
.half	17873
.half	17873
.half	17873
.half	17873
.half	17873
.half	23831
.half	23831
.half	23831
.half	23831
.half	23831
.half	23831
.half	23831
.half	23831
.half	23831
.half	23831
.half	23831
.half	29789
.half	29789
.half	29789
.half	29789
.half	29789
.half	29789
.half	29789
.half	29789
.half	29789
.half	29789
.half	29789
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.half	0
.align	2
.type	q_5, @object
.size	q_5, 32
q_5:
.half	-30583
.half	-26214
.half	-21845
.half	-17476
.half	-13107
.half	-8738
.half	-4369
.half	0
.half	4369
.half	8738
.half	13107
.half	17476
.half	21845
.half	26214
.half	30583
.half	0
.align	2
.type	dither_lut, @object
.size	dither_lut, 512
dither_lut:
.half	0
.half	-24559
.half	-8141
.half	16418
.half	24695
.half	-16282
.half	-32700
.half	8277
.half	-16146
.half	24831
.half	8413
.half	-32564
.half	-24423
.half	136
.half	16554
.half	-8005
.half	8653
.half	-32292
.half	-15874
.half	25071
.half	16826
.half	-7765
.half	-24183
.half	408
.half	-7901
.half	16690
.half	272
.half	-24319
.half	-32428
.half	8517
.half	24935
.half	-16010
.half	17306
.half	-7285
.half	-23639
.half	952
.half	9197
.half	-31748
.half	-15394
.half	25551
.half	-31884
.half	9061
.half	25415
.half	-15530
.half	-7421
.half	17170
.half	816
.half	-23775
.half	25175
.half	-15802
.half	-32156
.half	8821
.half	544
.half	-24015
.half	-7661
.half	16898
.half	-23879
.half	680
.half	17034
.half	-7525
.half	-15666
.half	25311
.half	8957
.half	-32020
.half	-30924
.half	10021
.half	26375
.half	-14570
.half	-6333
.half	18258
.half	1904
.half	-22687
.half	18394
.half	-6197
.half	-22551
.half	2040
.half	10157
.half	-30788
.half	-14434
.half	26511
.half	-22791
.half	1768
.half	18122
.half	-6437
.half	-14706
.half	26271
.half	9917
.half	-31060
.half	26135
.half	-14842
.half	-31196
.half	9781
.half	1632
.half	-22927
.half	-6573
.half	17986
.half	-15186
.half	25791
.half	9373
.half	-31604
.half	-23335
.half	1224
.half	17642
.half	-6917
.half	1088
.half	-23471
.half	-7053
.half	17506
.half	25655
.half	-15322
.half	-31740
.half	9237
.half	-6813
.half	17778
.half	1360
.half	-23231
.half	-31468
.half	9477
.half	25895
.half	-15050
.half	9613
.half	-31332
.half	-14914
.half	26031
.half	17914
.half	-6677
.half	-23095
.half	1496
.half	-20871
.half	3688
.half	20042
.half	-4517
.half	-12786
.half	28191
.half	11837
.half	-29140
.half	28311
.half	-12666
.half	-29020
.half	11957
.half	3808
.half	-20751
.half	-4397
.half	20162
.half	-28748
.half	12197
.half	28551
.half	-12394
.half	-4157
.half	20434
.half	4080
.half	-20511
.half	20314
.half	-4277
.half	-20631
.half	3960
.half	12077
.half	-28868
.half	-12514
.half	28431
.half	-4637
.half	19954
.half	3536
.half	-21055
.half	-29292
.half	11653
.half	28071
.half	-12874
.half	11533
.half	-29412
.half	-12994
.half	27951
.half	19834
.half	-4757
.half	-21175
.half	3416
.half	-13266
.half	27711
.half	11293
.half	-29684
.half	-21415
.half	3144
.half	19562
.half	-4997
.half	3264
.half	-21295
.half	-4877
.half	19682
.half	27831
.half	-13146
.half	-29564
.half	11413
.half	10573
.half	-30372
.half	-13954
.half	26991
.half	18746
.half	-5845
.half	-22263
.half	2328
.half	-5725
.half	18866
.half	2448
.half	-22143
.half	-30252
.half	10693
.half	27111
.half	-13834
.half	2176
.half	-22383
.half	-5965
.half	18594
.half	26871
.half	-14106
.half	-30524
.half	10453
.half	-14226
.half	26751
.half	10333
.half	-30644
.half	-22503
.half	2056
.half	18474
.half	-6085
.half	27351
.half	-13626
.half	-29980
.half	10997
.half	2720
.half	-21839
.half	-5485
.half	19074
.half	-21959
.half	2600
.half	18954
.half	-5605
.half	-13746
.half	27231
.half	10877
.half	-30100
.half	19226
.half	-5365
.half	-21719
.half	2872
.half	11117
.half	-29828
.half	-13474
.half	27471
.half	-29708
.half	11237
.half	27591
.half	-13354
.half	-5245
.half	19346
.half	2992
.half	-21599
.align	2
.type	halfrate, @object
.size	halfrate, 12
halfrate:
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	0
.byte	1
.byte	2
.byte	3
.align	2
.type	slev.3175, @object
.size	slev.3175, 16
slev.3175:
.word	47453132
.word	33554432
.word	0
.word	33554432
.align	2
.type	clev.3174, @object
.size	clev.3174, 16
clev.3174:
.word	47453132
.word	39903169
.word	33554432
.word	39903169
.align	2
.type	lfeon.3101, @object
.size	lfeon.3101, 8
lfeon.3101:
.byte	16
.byte	16
.byte	4
.byte	4
.byte	4
.byte	1
.byte	4
.byte	1
.align	2
.type	rate.3100, @object
.size	rate.3100, 76
rate.3100:
.word	32
.word	40
.word	48
.word	56
.word	64
.word	80
.word	96
.word	112
.word	128
.word	160
.word	192
.word	224
.word	256
.word	320
.word	384
.word	448
.word	512
.word	576
.word	640
.local	a52_accels
.comm	a52_accels,4,4
.ident	"GCC: (GNU) 4.3.3"

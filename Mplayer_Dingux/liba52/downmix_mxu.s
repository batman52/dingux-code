.file	1 "downmix.c"
.section .mdebug.abi32
.previous
.gnu_attribute 4, 3
.abicalls
.globl	__divdi3
.text
.align	2
.globl	a52_downmix_init
.ent	a52_downmix_init
.type	a52_downmix_init, @function
a52_downmix_init:
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
andi	$3,$5,0xf
slt	$2,$3,11
move	$17,$5
beq	$2,$0,$L30
move	$18,$6

sll	$2,$3,3
andi	$5,$4,0x7
lui	$3,%hi(table.3007)
addiu	$3,$3,%lo(table.3007)
addu	$2,$2,$5
addu	$2,$2,$3
lbu	$16,0($2)
li	$3,2			# 0x2
beq	$16,$3,$L31
li	$2,10			# 0xa

$L4:
andi	$2,$17,0x20
$L34:
bne	$2,$0,$L32
sll	$2,$16,3

$L6:
andi	$2,$17,0x40
or	$16,$16,$2
$L3:
lw	$31,36($sp)
$L33:
move	$2,$16
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

$L32:
addu	$2,$2,$5
addiu	$2,$2,-10
sltu	$3,$2,78
beq	$3,$0,$L33
lw	$31,36($sp)

lui	$3,%hi($L23)
sll	$2,$2,2
addiu	$3,$3,%lo($L23)
addu	$3,$3,$2
lw	$4,0($3)
addu	$4,$4,$28
j	$4
nop

.rdata
.align	2
.align	2
$L23:
.gpword	$L7
.gpword	$L8
.gpword	$L9
.gpword	$L10
.gpword	$L11
.gpword	$L12
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L13
.gpword	$L14
.gpword	$L15
.gpword	$L16
.gpword	$L17
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L14
.gpword	$L3
.gpword	$L16
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L13
.gpword	$L7
.gpword	$L18
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L7
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L13
.gpword	$L3
.gpword	$L13
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L3
.gpword	$L19
.gpword	$L3
.gpword	$L20
.gpword	$L20
.gpword	$L21
.gpword	$L21
.gpword	$L22
.text
$L30:
lw	$31,36($sp)
li	$16,-1			# 0xffffffffffffffff
move	$2,$16
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

$L31:
beq	$4,$2,$L5
li	$2,3			# 0x3

bne	$4,$2,$L34
andi	$2,$17,0x20

li	$2,47448064			# 0x2d40000
ori	$2,$2,0x13cc
bne	$7,$2,$L34
andi	$2,$17,0x20

$L5:
b	$L4
li	$16,10			# 0xa

$L18:
li	$2,27787264			# 0x1a80000
ori	$2,$2,0x2799
slt	$2,$7,$2
bne	$2,$0,$L7
nop

$L13:
li	$6,67108864			# 0x4000000
addu	$6,$7,$6
lw	$25,%call16(__divdi3)($28)
sra	$7,$6,31
move	$4,$0
li	$5,1048576			# 0x100000
$L26:
jalr	$25
nop

lw	$28,16($sp)
andi	$5,$2,0xffff
sra	$4,$2,16
$L24:
lw	$2,0($18)
andi	$3,$2,0xffff
sra	$2,$2,16
mul	$6,$4,$3
mul	$3,$4,$2
mul	$4,$5,$2
sll	$3,$3,6
addu	$2,$4,$6
sra	$2,$2,10
addu	$2,$2,$3
b	$L6
sw	$2,0($18)

$L7:
li	$4,724			# 0x2d4
b	$L24
li	$5,5068			# 0x13cc

$L12:
li	$6,67108864			# 0x4000000
lw	$4,56($sp)
addu	$6,$7,$6
addu	$6,$6,$4
$L27:
li	$5,720896			# 0xb0000
sra	$7,$6,31
lw	$25,%call16(__divdi3)($28)
li	$4,805306368			# 0x30000000
b	$L26
ori	$5,$5,0x504f

$L11:
lw	$2,56($sp)
li	$6,67108864			# 0x4000000
b	$L27
addu	$6,$2,$6

$L14:
lw	$3,56($sp)
li	$6,724			# 0x2d4
andi	$2,$3,0xffff
mul	$5,$2,$6
sra	$3,$3,16
li	$2,5068			# 0x13cc
mul	$6,$3,$6
mul	$4,$3,$2
sll	$6,$6,6
addu	$3,$4,$5
li	$2,67108864			# 0x4000000
addu	$6,$6,$2
sra	$3,$3,10
$L28:
addu	$6,$3,$6
sra	$7,$6,31
lw	$25,%call16(__divdi3)($28)
move	$4,$0
b	$L26
li	$5,1048576			# 0x100000

$L8:
li	$6,67108864			# 0x4000000
b	$L27
addu	$6,$7,$6

$L10:
lw	$5,56($sp)
li	$6,67108864			# 0x4000000
andi	$3,$5,0xffff
addu	$6,$7,$6
srl	$3,$3,1
sra	$2,$5,16
addu	$6,$6,$3
sll	$2,$2,15
b	$L27
addu	$6,$6,$2

$L9:
lw	$2,56($sp)
li	$6,134217728			# 0x8000000
addu	$6,$2,$6
li	$5,1441792			# 0x160000
sra	$7,$6,31
lw	$25,%call16(__divdi3)($28)
li	$4,1677721600			# 0x64000000
b	$L26
ori	$5,$5,0xa09e

$L22:
li	$4,328			# 0x148
b	$L24
li	$5,4344			# 0x10f8

$L21:
li	$4,424			# 0x1a8
b	$L24
li	$5,10137			# 0x2799

$L20:
li	$4,599			# 0x257
b	$L24
li	$5,55398			# 0xd866

$L19:
li	$4,1448			# 0x5a8
b	$L24
li	$5,10137			# 0x2799

$L17:
lw	$5,56($sp)
li	$6,67108864			# 0x4000000
addu	$6,$7,$6
addu	$6,$6,$5
sra	$7,$6,31
lw	$25,%call16(__divdi3)($28)
move	$4,$0
b	$L26
li	$5,1048576			# 0x100000

$L16:
li	$6,67108864			# 0x4000000
b	$L28
lw	$3,56($sp)

$L15:
lw	$3,56($sp)
lw	$25,%call16(__divdi3)($28)
andi	$2,$3,0xffff
li	$3,724			# 0x2d4
mul	$6,$2,$3
lw	$2,56($sp)
sra	$4,$2,16
li	$2,5068			# 0x13cc
mul	$5,$4,$2
mul	$3,$4,$3
addu	$4,$5,$6
li	$6,67108864			# 0x4000000
addu	$6,$7,$6
sll	$3,$3,6
sra	$4,$4,10
addu	$6,$6,$3
addu	$6,$6,$4
sra	$7,$6,31
move	$4,$0
b	$L26
li	$5,1048576			# 0x100000

.set	macro
.set	reorder
.end	a52_downmix_init
.align	2
.globl	a52_downmix_coeff
.ent	a52_downmix_coeff
.type	a52_downmix_coeff, @function
a52_downmix_coeff:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

li	$3,724			# 0x2d4
andi	$8,$7,0xffff
sra	$9,$7,16
li	$2,5068			# 0x13cc
mul	$11,$8,$3
move	$10,$7
mul	$7,$9,$2
mul	$3,$9,$3
andi	$6,$6,0xf
sll	$6,$6,3
addu	$2,$7,$11
addu	$6,$6,$5
lui	$28,%hi(__gnu_local_gp)
sra	$2,$2,10
sll	$3,$3,6
sltu	$5,$6,88
addiu	$28,$28,%lo(__gnu_local_gp)
addu	$7,$2,$3
bne	$5,$0,$L70
move	$11,$4

$L36:
j	$31
li	$2,-1			# 0xffffffffffffffff

$L70:
lui	$3,%hi($L66)
sll	$2,$6,2
addiu	$3,$3,%lo($L66)
addu	$3,$3,$2
lw	$4,0($3)
addu	$4,$4,$28
j	$4
nop

.rdata
.align	2
.align	2
$L66:
.gpword	$L37
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L38
.gpword	$L37
.gpword	$L39
.gpword	$L40
.gpword	$L41
.gpword	$L42
.gpword	$L43
.gpword	$L44
.gpword	$L36
.gpword	$L36
.gpword	$L37
.gpword	$L45
.gpword	$L46
.gpword	$L47
.gpword	$L48
.gpword	$L49
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L37
.gpword	$L36
.gpword	$L50
.gpword	$L36
.gpword	$L51
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L37
.gpword	$L45
.gpword	$L52
.gpword	$L53
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L37
.gpword	$L36
.gpword	$L54
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L55
.gpword	$L56
.gpword	$L37
.gpword	$L45
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L57
.gpword	$L36
.gpword	$L37
.gpword	$L58
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L59
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L36
.gpword	$L60
.gpword	$L37
.gpword	$L61
.gpword	$L62
.gpword	$L63
.gpword	$L64
.gpword	$L65
.text
$L65:
sw	$7,4($11)
sw	$10,0($11)
sw	$10,8($11)
sw	$7,16($11)
sw	$7,12($11)
j	$31
li	$2,31			# 0x1f

$L64:
sw	$7,8($11)
sw	$10,0($11)
sw	$10,4($11)
sw	$7,12($11)
j	$31
li	$2,15			# 0xf

$L63:
sw	$7,4($11)
sw	$10,0($11)
sw	$10,8($11)
sw	$7,12($11)
j	$31
li	$2,15			# 0xf

$L62:
sw	$7,8($11)
sw	$10,0($11)
sw	$10,4($11)
j	$31
li	$2,7			# 0x7

$L61:
sw	$7,4($11)
$L69:
sw	$10,0($11)
sw	$10,16($11)
sw	$10,12($11)
sw	$10,8($11)
j	$31
li	$2,7			# 0x7

$L60:
sw	$7,0($11)
j	$31
move	$2,$0

$L59:
sw	$10,4($11)
sw	$0,0($11)
j	$31
move	$2,$0

$L58:
sw	$10,0($11)
sw	$0,4($11)
j	$31
move	$2,$0

$L57:
sw	$7,12($11)
sw	$10,0($11)
sw	$10,8($11)
sw	$10,4($11)
j	$31
move	$2,$0

$L56:
lw	$5,16($sp)
lw	$4,16($sp)
sra	$2,$5,16
andi	$3,$4,0xffff
mul	$5,$2,$8
mul	$4,$3,$9
mul	$2,$2,$9
addu	$3,$4,$5
sll	$2,$2,6
sra	$3,$3,10
addu	$3,$3,$2
sw	$7,12($11)
sw	$10,0($11)
sw	$3,4($11)
sw	$10,8($11)
j	$31
li	$2,7			# 0x7

$L55:
sw	$7,8($11)
sw	$10,0($11)
sw	$10,4($11)
j	$31
move	$2,$0

$L54:
sw	$7,12($11)
sw	$10,0($11)
sw	$10,8($11)
sw	$10,4($11)
sw	$7,16($11)
j	$31
li	$2,24			# 0x18

$L53:
lw	$5,16($sp)
lw	$4,16($sp)
sra	$2,$5,16
andi	$3,$4,0xffff
mul	$5,$2,$8
mul	$4,$3,$9
mul	$2,$2,$9
addu	$3,$4,$5
sll	$2,$2,6
sra	$3,$3,10
addu	$3,$3,$2
sw	$7,12($11)
sw	$10,0($11)
sw	$3,4($11)
sw	$10,8($11)
sw	$7,16($11)
j	$31
li	$2,31			# 0x1f

$L52:
sw	$7,8($11)
sw	$10,0($11)
sw	$10,4($11)
sw	$7,12($11)
j	$31
li	$2,12			# 0xc

$L51:
lw	$6,20($sp)
sw	$10,0($11)
sra	$2,$6,16
andi	$3,$6,0xffff
mul	$5,$2,$8
mul	$4,$3,$9
mul	$2,$2,$9
addu	$3,$4,$5
sll	$2,$2,6
sra	$3,$3,10
addu	$3,$3,$2
sw	$3,12($11)
sw	$10,8($11)
sw	$10,4($11)
sw	$3,16($11)
j	$31
li	$2,29			# 0x1d

$L50:
lw	$8,20($sp)
andi	$3,$7,0xffff
sra	$4,$8,16
mul	$6,$3,$4
sra	$2,$7,16
andi	$3,$8,0xffff
mul	$5,$2,$3
mul	$4,$2,$4
addu	$2,$5,$6
sll	$4,$4,6
sra	$2,$2,10
addu	$2,$2,$4
sw	$2,12($11)
sw	$10,0($11)
sw	$10,8($11)
sw	$10,4($11)
j	$31
li	$2,13			# 0xd

$L49:
lw	$6,16($sp)
lw	$7,20($sp)
sra	$5,$6,16
andi	$3,$6,0xffff
lw	$6,20($sp)
sra	$4,$7,16
mul	$7,$4,$8
andi	$2,$6,0xffff
mul	$8,$5,$8
mul	$6,$3,$9
mul	$4,$4,$9
addu	$3,$6,$8
mul	$6,$2,$9
mul	$5,$5,$9
addu	$2,$6,$7
sll	$5,$5,6
sra	$3,$3,10
sra	$2,$2,10
sll	$4,$4,6
addu	$2,$2,$4
addu	$3,$3,$5
sw	$2,12($11)
sw	$2,16($11)
sw	$10,0($11)
sw	$3,4($11)
sw	$10,8($11)
j	$31
li	$2,31			# 0x1f

$L48:
lw	$3,20($sp)
sw	$10,0($11)
sra	$2,$3,16
andi	$3,$3,0xffff
mul	$5,$2,$8
mul	$4,$3,$9
mul	$2,$2,$9
addu	$3,$4,$5
sll	$2,$2,6
sra	$3,$3,10
addu	$3,$3,$2
sw	$3,8($11)
sw	$10,4($11)
sw	$3,12($11)
j	$31
li	$2,15			# 0xf

$L47:
lw	$6,16($sp)
lw	$2,20($sp)
andi	$3,$7,0xffff
sra	$4,$6,16
sra	$5,$2,16
sra	$2,$7,16
lw	$7,20($sp)
mul	$12,$4,$8
mul	$8,$3,$5
andi	$3,$6,0xffff
andi	$6,$7,0xffff
mul	$7,$3,$9
mul	$5,$2,$5
addu	$3,$7,$12
mul	$7,$2,$6
mul	$4,$4,$9
addu	$2,$7,$8
sll	$4,$4,6
sra	$3,$3,10
sra	$2,$2,10
sll	$5,$5,6
addu	$2,$2,$5
addu	$3,$3,$4
sw	$2,12($11)
sw	$10,0($11)
sw	$3,4($11)
sw	$10,8($11)
j	$31
li	$2,15			# 0xf

$L46:
lw	$5,20($sp)
andi	$3,$7,0xffff
sra	$4,$5,16
mul	$6,$3,$4
sra	$2,$7,16
andi	$3,$5,0xffff
mul	$5,$2,$3
mul	$4,$2,$4
addu	$2,$5,$6
sll	$4,$4,6
sra	$2,$2,10
addu	$2,$2,$4
sw	$2,8($11)
sw	$10,0($11)
sw	$10,4($11)
j	$31
li	$2,7			# 0x7

$L45:
lw	$5,16($sp)
lw	$4,16($sp)
sra	$2,$5,16
andi	$3,$4,0xffff
mul	$5,$2,$8
mul	$4,$3,$9
mul	$2,$2,$9
addu	$3,$4,$5
sll	$2,$2,6
sra	$3,$3,10
addu	$3,$3,$2
b	$L69
sw	$3,4($11)

$L44:
lw	$6,16($sp)
lw	$2,20($sp)
lw	$8,16($sp)
sra	$3,$7,16
andi	$5,$7,0xffff
sra	$4,$6,16
sra	$6,$2,16
andi	$2,$8,0xffff
mul	$9,$5,$4
mul	$8,$5,$6
mul	$5,$3,$2
mul	$4,$3,$4
addu	$2,$5,$9
lw	$9,20($sp)
sll	$4,$4,6
sra	$2,$2,10
andi	$5,$9,0xffff
addu	$2,$2,$4
mul	$4,$3,$5
mul	$6,$3,$6
addu	$3,$4,$8
andi	$4,$2,0xffff
sra	$2,$2,16
sll	$2,$2,17
sll	$4,$4,1
sra	$3,$3,10
sll	$6,$6,6
addu	$3,$3,$6
addu	$2,$2,$4
sw	$2,4($11)
sw	$3,12($11)
sw	$7,8($11)
sw	$7,0($11)
sw	$3,16($11)
j	$31
li	$2,31			# 0x1f

$L43:
lw	$6,20($sp)
lw	$5,20($sp)
andi	$3,$7,0xffff
sra	$4,$6,16
mul	$6,$3,$4
sra	$2,$7,16
andi	$3,$5,0xffff
mul	$5,$2,$3
mul	$4,$2,$4
addu	$2,$5,$6
sll	$4,$4,6
sra	$2,$2,10
addu	$2,$2,$4
sw	$2,8($11)
sw	$2,12($11)
sw	$7,4($11)
sw	$7,0($11)
j	$31
li	$2,15			# 0xf

$L42:
lw	$6,16($sp)
lw	$2,20($sp)
lw	$8,16($sp)
sra	$3,$7,16
andi	$5,$7,0xffff
sra	$4,$6,16
sra	$6,$2,16
andi	$2,$8,0xffff
mul	$9,$5,$4
mul	$8,$5,$6
mul	$5,$3,$2
mul	$4,$3,$4
addu	$2,$5,$9
lw	$9,20($sp)
sll	$4,$4,6
sra	$2,$2,10
andi	$5,$9,0xffff
addu	$2,$2,$4
mul	$4,$3,$5
mul	$6,$3,$6
addu	$3,$4,$8
andi	$4,$2,0xffff
sra	$2,$2,16
sll	$2,$2,17
sll	$4,$4,1
sra	$3,$3,10
sll	$6,$6,6
addu	$2,$2,$4
addu	$3,$3,$6
sw	$2,4($11)
sw	$3,12($11)
sw	$7,8($11)
sw	$7,0($11)
j	$31
li	$2,15			# 0xf

$L41:
lw	$6,20($sp)
lw	$5,20($sp)
andi	$3,$7,0xffff
sra	$4,$6,16
mul	$6,$3,$4
sra	$2,$7,16
andi	$3,$5,0xffff
mul	$5,$2,$3
mul	$4,$2,$4
addu	$2,$5,$6
sll	$4,$4,6
sra	$2,$2,10
addu	$2,$2,$4
sw	$2,8($11)
sw	$7,4($11)
sw	$7,0($11)
j	$31
li	$2,7			# 0x7

$L40:
lw	$8,16($sp)
andi	$3,$7,0xffff
sra	$4,$8,16
mul	$6,$3,$4
sra	$2,$7,16
andi	$3,$8,0xffff
mul	$5,$2,$3
mul	$4,$2,$4
addu	$2,$5,$6
sll	$4,$4,6
sra	$2,$2,10
addu	$2,$2,$4
andi	$3,$2,0xffff
sra	$2,$2,16
sll	$2,$2,17
sll	$3,$3,1
addu	$2,$2,$3
sw	$2,4($11)
sw	$7,8($11)
sw	$7,0($11)
j	$31
li	$2,7			# 0x7

$L39:
sw	$7,0($11)
sw	$7,4($11)
j	$31
li	$2,3			# 0x3

$L38:
sll	$2,$9,15
srl	$3,$8,1
addu	$2,$2,$3
sw	$2,0($11)
sw	$2,4($11)
j	$31
li	$2,3			# 0x3

$L37:
sw	$10,0($11)
sw	$10,16($11)
sw	$10,12($11)
sw	$10,8($11)
sw	$10,4($11)
j	$31
move	$2,$0

.set	macro
.set	reorder
.end	a52_downmix_coeff
.align	2
.ent	mix3to2
.type	mix3to2, @function
mix3to2:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$5,$4
move	$6,$0
li	$7,256			# 0x100
$L72:
lw	$2,1024($5)
lw	$3,0($5)
lw	$4,2048($5)
addu	$3,$3,$2
addu	$4,$4,$2
addiu	$6,$6,1
sw	$3,0($5)
sw	$4,1024($5)
bne	$6,$7,$L72
addiu	$5,$5,4

j	$31
nop

.set	macro
.set	reorder
.end	mix3to2
.align	2
.globl	a52_upmix
.ent	a52_upmix
.type	a52_upmix, @function
a52_upmix:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

andi	$6,$6,0xf
sll	$6,$6,3
addu	$6,$6,$5
addiu	$6,$6,-8
lui	$28,%hi(__gnu_local_gp)
sltu	$2,$6,80
addiu	$28,$28,%lo(__gnu_local_gp)
beq	$2,$0,$L111
move	$9,$4

lui	$3,%hi($L93)
sll	$2,$6,2
addiu	$3,$3,%lo($L93)
addu	$3,$3,$2
lw	$4,0($3)
addu	$4,$4,$28
j	$4
nop

.rdata
.align	2
.align	2
$L93:
.gpword	$L112
.gpword	$L111
.gpword	$L112
.gpword	$L113
.gpword	$L113
.gpword	$L114
.gpword	$L114
.gpword	$L80
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L115
.gpword	$L116
.gpword	$L117
.gpword	$L84
.gpword	$L85
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L118
.gpword	$L111
.gpword	$L87
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L119
.gpword	$L118
.gpword	$L89
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L90
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L91
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L92
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L111
.gpword	$L115
.gpword	$L116
.gpword	$L117
.gpword	$L84
.gpword	$L85
.text
$L111:
j	$31
nop

$L92:
addiu	$8,$9,1024
move	$7,$9
move	$6,$8
$L94:
lw	$2,0($7)
lw	$3,4($7)
lw	$4,8($7)
lw	$5,12($7)
swl	$2,3($6)
swr	$2,0($6)
swl	$3,7($6)
swr	$3,4($6)
swl	$4,11($6)
swr	$4,8($6)
swl	$5,15($6)
addiu	$7,$7,16
swr	$5,12($6)
bne	$7,$8,$L94
addiu	$6,$6,16

j	$31
nop

$L80:
move	$2,$9
addiu	$6,$9,1024
$L95:
sw	$0,4096($2)
addiu	$2,$2,4
bne	$6,$2,$L95
nop

$L79:
move	$2,$9
$L96:
sw	$0,3072($2)
addiu	$2,$2,4
bne	$6,$2,$L96
nop

$L78:
move	$2,$9
$L97:
sw	$0,2048($2)
addiu	$2,$2,4
bne	$6,$2,$L97
nop

$L77:
move	$4,$9
$L98:
sw	$0,1024($4)
addiu	$4,$4,4
bne	$6,$4,$L98
nop

j	$31
nop

$L84:
move	$2,$9
addiu	$6,$9,1024
$L103:
sw	$0,3072($2)
addiu	$2,$2,4
bne	$6,$2,$L103
nop

$L82:
move	$4,$9
$L104:
sw	$0,2048($4)
addiu	$4,$4,4
bne	$6,$4,$L104
nop

j	$31
nop

$L85:
move	$2,$9
addiu	$6,$9,1024
$L99:
sw	$0,4096($2)
addiu	$2,$2,4
bne	$6,$2,$L99
nop

$L83:
move	$2,$9
$L100:
sw	$0,3072($2)
addiu	$2,$2,4
bne	$6,$2,$L100
addiu	$10,$9,2048

$L81:
move	$7,$10
$L137:
move	$8,$6
addiu	$10,$9,2048
$L101:
lwl	$2,3($8)
lwl	$3,7($8)
lwl	$4,11($8)
lwl	$5,15($8)
lwr	$2,0($8)
lwr	$3,4($8)
lwr	$4,8($8)
lwr	$5,12($8)
swl	$2,3($7)
swr	$2,0($7)
swl	$3,7($7)
swr	$3,4($7)
swl	$4,11($7)
swr	$4,8($7)
addiu	$8,$8,16
swl	$5,15($7)
swr	$5,12($7)
bne	$8,$10,$L101
addiu	$7,$7,16

move	$4,$9
$L102:
sw	$0,1024($4)
addiu	$4,$4,4
bne	$6,$4,$L102
nop

j	$31
nop

$L87:
move	$2,$9
addiu	$6,$9,1024
$L105:
sw	$0,4096($2)
addiu	$2,$2,4
bne	$6,$2,$L105
nop

$L86:
move	$4,$9
$L106:
sw	$0,3072($4)
addiu	$4,$4,4
bne	$6,$4,$L106
nop

j	$31
nop

$L89:
move	$2,$9
addiu	$6,$9,1024
$L108:
sw	$0,4096($2)
addiu	$2,$2,4
bne	$6,$2,$L108
addiu	$8,$9,3072

$L88:
addiu	$10,$9,2048
move	$7,$8
addiu	$11,$9,3072
move	$8,$10
$L109:
lwl	$2,3($8)
lwl	$3,7($8)
lwl	$4,11($8)
lwl	$5,15($8)
lwr	$2,0($8)
lwr	$3,4($8)
lwr	$4,8($8)
lwr	$5,12($8)
swl	$2,3($7)
swr	$2,0($7)
swl	$3,7($7)
swr	$3,4($7)
swl	$4,11($7)
swr	$4,8($7)
addiu	$8,$8,16
swl	$5,15($7)
swr	$5,12($7)
bne	$8,$11,$L109
addiu	$7,$7,16

b	$L137
move	$7,$10

$L90:
move	$4,$9
addiu	$6,$9,1024
$L107:
sw	$0,4096($4)
addiu	$4,$4,4
bne	$6,$4,$L107
nop

j	$31
nop

$L91:
addiu	$10,$9,4096
addiu	$8,$9,3072
move	$7,$8
move	$6,$10
$L110:
lwl	$2,3($7)
lwl	$3,7($7)
lwl	$4,11($7)
lwl	$5,15($7)
lwr	$2,0($7)
lwr	$3,4($7)
lwr	$4,8($7)
lwr	$5,12($7)
swl	$2,3($6)
swr	$2,0($6)
swl	$3,7($6)
swr	$3,4($6)
swl	$4,11($6)
swr	$4,8($6)
addiu	$7,$7,16
swl	$5,15($6)
swr	$5,12($6)
bne	$7,$10,$L110
addiu	$6,$6,16

b	$L88
addiu	$6,$9,1024

$L119:
addiu	$6,$9,1024
b	$L88
addiu	$8,$9,3072

$L117:
b	$L83
addiu	$6,$9,1024

$L115:
addiu	$6,$9,1024
b	$L81
addiu	$10,$9,2048

$L118:
b	$L86
addiu	$6,$9,1024

$L116:
b	$L82
addiu	$6,$9,1024

$L114:
b	$L79
addiu	$6,$9,1024

$L113:
b	$L78
addiu	$6,$9,1024

$L112:
b	$L77
addiu	$6,$9,1024

.set	macro
.set	reorder
.end	a52_upmix
.globl	__floatsidf
.globl	__muldf3
.globl	__adddf3
.globl	__fixdfsi
.align	2
.globl	a52_downmix
.ent	a52_downmix
.type	a52_downmix, @function
a52_downmix:
.set	nomips16
.frame	$sp,136,$31		# vars= 72, regs= 10/0, args= 16, gp= 8
.mask	0xc0ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-136
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,132($sp)
sw	$fp,128($sp)
sw	$23,124($sp)
sw	$22,120($sp)
sw	$21,116($sp)
sw	$20,112($sp)
sw	$19,108($sp)
sw	$18,104($sp)
sw	$17,100($sp)
sw	$16,96($sp)
.cprestore	16
andi	$2,$6,0xf
sll	$2,$2,3
addu	$2,$2,$5
addiu	$2,$2,-8
sltu	$3,$2,80
move	$18,$4
move	$5,$7
beq	$3,$0,$L202
lw	$8,156($sp)

lui	$3,%hi($L168)
sll	$2,$2,2
addiu	$3,$3,%lo($L168)
addu	$3,$3,$2
lw	$4,0($3)
addu	$4,$4,$28
j	$4
nop

.rdata
.align	2
.align	2
$L168:
.gpword	$L141
.gpword	$L202
.gpword	$L141
.gpword	$L142
.gpword	$L143
.gpword	$L144
.gpword	$L145
.gpword	$L146
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L147
.gpword	$L148
.gpword	$L149
.gpword	$L150
.gpword	$L151
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L152
.gpword	$L202
.gpword	$L153
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L154
.gpword	$L155
.gpword	$L156
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L157
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L158
.gpword	$L159
.gpword	$L202
.gpword	$L160
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L161
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L162
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L202
.gpword	$L163
.gpword	$L202
.gpword	$L147
.gpword	$L164
.gpword	$L165
.gpword	$L166
.gpword	$L167
.text
$L161:
addiu	$8,$18,4096
addiu	$6,$18,3072
move	$7,$8
$L201:
lwl	$2,3($6)
lwl	$3,7($6)
lwl	$4,11($6)
lwl	$5,15($6)
lwr	$2,0($6)
lwr	$3,4($6)
lwr	$4,8($6)
lwr	$5,12($6)
swl	$2,3($7)
swr	$2,0($7)
swl	$3,7($7)
swr	$3,4($7)
swl	$4,11($7)
swr	$4,8($7)
addiu	$6,$6,16
swl	$5,15($7)
swr	$5,12($7)
bne	$6,$8,$L201
addiu	$7,$7,16

$L202:
lw	$31,132($sp)
$L232:
lw	$fp,128($sp)
$L236:
lw	$23,124($sp)
lw	$22,120($sp)
lw	$21,116($sp)
lw	$20,112($sp)
lw	$19,108($sp)
lw	$18,104($sp)
lw	$17,100($sp)
lw	$16,96($sp)
j	$31
addiu	$sp,$sp,136

$L144:
bne	$8,$0,$L233
move	$6,$18

$L142:
move	$5,$18
$L234:
move	$6,$0
li	$7,256			# 0x100
$L171:
lw	$2,0($5)
lw	$3,1024($5)
lw	$4,2048($5)
addu	$3,$3,$2
addu	$3,$3,$4
addiu	$6,$6,1
sw	$3,0($5)
bne	$6,$7,$L171
addiu	$5,$5,4

b	$L232
lw	$31,132($sp)

$L143:
bne	$8,$0,$L234
move	$5,$18

$L141:
move	$4,$18
$L235:
move	$5,$0
li	$6,256			# 0x100
$L170:
lw	$2,0($4)
lw	$3,1024($4)
addiu	$5,$5,1
addu	$2,$2,$3
sw	$2,0($4)
bne	$5,$6,$L170
addiu	$4,$4,4

b	$L232
lw	$31,132($sp)

$L147:
move	$4,$18
lw	$31,132($sp)
lw	$fp,128($sp)
lw	$23,124($sp)
lw	$22,120($sp)
lw	$21,116($sp)
lw	$20,112($sp)
lw	$19,108($sp)
lw	$18,104($sp)
lw	$17,100($sp)
lw	$16,96($sp)
.option	pic0
j	mix3to2
.option	pic2
addiu	$sp,$sp,136

$L145:
beq	$8,$0,$L235
move	$4,$18

move	$6,$18
$L233:
move	$7,$0
li	$8,256			# 0x100
$L173:
lw	$4,0($6)
lw	$2,1024($6)
lw	$5,2048($6)
lw	$3,3072($6)
addu	$2,$2,$4
addu	$2,$2,$5
addu	$2,$2,$3
addiu	$7,$7,1
sw	$2,0($6)
bne	$7,$8,$L173
addiu	$6,$6,4

b	$L232
lw	$31,132($sp)

$L150:
beq	$8,$0,$L202
move	$5,$18

move	$4,$18
move	$6,$0
li	$7,256			# 0x100
$L181:
lw	$2,0($4)
lw	$3,2048($4)
addiu	$6,$6,1
addu	$2,$2,$3
sw	$2,0($4)
bne	$6,$7,$L181
addiu	$4,$4,4

addiu	$4,$18,1024
$L182:
lw	$2,1024($5)
lw	$3,3072($5)
addu	$2,$2,$3
sw	$2,1024($5)
addiu	$5,$5,4
bne	$4,$5,$L182
lw	$31,132($sp)

b	$L236
lw	$fp,128($sp)

$L149:
beq	$8,$0,$L147
move	$6,$18

move	$7,$0
li	$8,256			# 0x100
$L179:
lw	$5,1024($6)
lw	$2,3072($6)
lw	$3,0($6)
lw	$4,2048($6)
addu	$2,$2,$5
addu	$4,$2,$4
addu	$3,$3,$2
addiu	$7,$7,1
sw	$3,0($6)
sw	$4,1024($6)
bne	$7,$8,$L179
addiu	$6,$6,4

b	$L232
lw	$31,132($sp)

$L166:
andi	$2,$6,0x40
beq	$2,$0,$L183
move	$6,$18

lui	$6,%hi($LC0)
lui	$2,%hi($LC1)
lw	$3,%lo($LC0+4)($6)
lw	$4,%lo($LC1+4)($2)
lw	$6,%lo($LC0)($6)
lw	$2,%lo($LC1)($2)
sw	$3,32($sp)
sw	$4,40($sp)
sw	$6,28($sp)
sw	$2,36($sp)
move	$23,$18
move	$fp,$0
sw	$2,44($sp)
sw	$4,48($sp)
sw	$6,52($sp)
sw	$3,56($sp)
$L184:
lw	$25,%call16(__floatsidf)($28)
lw	$4,2048($23)
jalr	$25
lw	$22,1024($23)

lw	$28,16($sp)
lw	$4,3072($23)
lw	$25,%call16(__floatsidf)($28)
move	$20,$2
jalr	$25
move	$21,$3

lw	$28,16($sp)
lw	$6,28($sp)
lw	$25,%call16(__muldf3)($28)
lw	$7,32($sp)
move	$4,$2
move	$5,$3
move	$18,$2
jalr	$25
move	$19,$3

lw	$28,16($sp)
lw	$6,36($sp)
lw	$25,%call16(__muldf3)($28)
lw	$7,40($sp)
move	$4,$20
move	$5,$21
move	$16,$2
jalr	$25
move	$17,$3

lw	$28,16($sp)
move	$6,$2
lw	$25,%call16(__adddf3)($28)
move	$7,$3
move	$4,$16
jalr	$25
move	$5,$17

lw	$28,16($sp)
move	$5,$3
lw	$25,%call16(__fixdfsi)($28)
jalr	$25
move	$4,$2

lw	$3,0($23)
lw	$28,16($sp)
lw	$6,44($sp)
lw	$25,%call16(__muldf3)($28)
addu	$3,$3,$2
lw	$7,48($sp)
sw	$3,0($23)
move	$4,$18
jalr	$25
move	$5,$19

lw	$28,16($sp)
lw	$6,52($sp)
lw	$25,%call16(__muldf3)($28)
lw	$7,56($sp)
move	$4,$20
move	$5,$21
move	$16,$2
jalr	$25
move	$17,$3

lw	$28,16($sp)
move	$4,$16
lw	$25,%call16(__adddf3)($28)
move	$5,$17
move	$6,$2
jalr	$25
move	$7,$3

lw	$28,16($sp)
move	$5,$3
lw	$25,%call16(__fixdfsi)($28)
jalr	$25
move	$4,$2

addu	$2,$2,$22
addiu	$fp,$fp,1
li	$5,256			# 0x100
sw	$2,1024($23)
lw	$28,16($sp)
bne	$fp,$5,$L184
addiu	$23,$23,4

b	$L232
lw	$31,132($sp)

$L165:
move	$7,$18
move	$8,$0
li	$9,256			# 0x100
$L180:
lw	$2,1024($7)
lw	$6,3072($7)
lw	$4,0($7)
lw	$5,2048($7)
addu	$3,$6,$2
addu	$2,$2,$4
addu	$3,$3,$5
subu	$2,$2,$6
addiu	$8,$8,1
sw	$2,0($7)
sw	$3,1024($7)
bne	$8,$9,$L180
addiu	$7,$7,4

b	$L232
lw	$31,132($sp)

$L163:
addiu	$8,$18,1024
move	$7,$18
move	$6,$8
$L176:
lw	$2,0($7)
lw	$3,4($7)
lw	$4,8($7)
lw	$5,12($7)
swl	$2,3($6)
swr	$2,0($6)
swl	$3,7($6)
swr	$3,4($6)
swl	$4,11($6)
swr	$4,8($6)
swl	$5,15($6)
addiu	$7,$7,16
swr	$5,12($6)
bne	$7,$8,$L176
addiu	$6,$6,16

b	$L232
lw	$31,132($sp)

$L162:
move	$7,$18
addiu	$6,$18,1024
addiu	$8,$18,2048
$L169:
lwl	$2,3($6)
lwl	$3,7($6)
lwl	$4,11($6)
lwl	$5,15($6)
lwr	$2,0($6)
lwr	$3,4($6)
lwr	$4,8($6)
lwr	$5,12($6)
addiu	$6,$6,16
sw	$2,0($7)
sw	$3,4($7)
sw	$4,8($7)
sw	$5,12($7)
bne	$6,$8,$L169
addiu	$7,$7,16

b	$L232
lw	$31,132($sp)

$L164:
move	$5,$18
move	$6,$0
li	$7,256			# 0x100
$L178:
lw	$2,2048($5)
lw	$3,0($5)
lw	$4,1024($5)
subu	$3,$3,$2
addu	$4,$4,$2
addiu	$6,$6,1
sw	$3,0($5)
sw	$4,1024($5)
bne	$6,$7,$L178
addiu	$5,$5,4

b	$L232
lw	$31,132($sp)

$L160:
.option	pic0
jal	mix3to2
.option	pic2
move	$4,$18

addiu	$9,$18,3072
lw	$28,16($sp)
move	$7,$9
addiu	$6,$18,2048
addiu	$8,$18,4096
$L199:
lwl	$2,3($7)
lwl	$3,7($7)
lwl	$4,11($7)
lwl	$5,15($7)
lwr	$2,0($7)
lwr	$3,4($7)
lwr	$4,8($7)
lwr	$5,12($7)
swl	$2,3($6)
swr	$2,0($6)
swl	$3,7($6)
swr	$3,4($6)
swl	$4,11($6)
swr	$4,8($6)
addiu	$7,$7,16
swl	$5,15($6)
swr	$5,12($6)
bne	$7,$8,$L199
addiu	$6,$6,16

move	$8,$7
addiu	$6,$18,5120
move	$7,$9
$L200:
lwl	$2,3($8)
lwl	$3,7($8)
lwl	$4,11($8)
lwl	$5,15($8)
lwr	$2,0($8)
lwr	$3,4($8)
lwr	$4,8($8)
lwr	$5,12($8)
swl	$2,3($7)
swr	$2,0($7)
swl	$3,7($7)
swr	$3,4($7)
swl	$4,11($7)
swr	$4,8($7)
addiu	$8,$8,16
swl	$5,15($7)
swr	$5,12($7)
bne	$8,$6,$L200
addiu	$7,$7,16

b	$L232
lw	$31,132($sp)

$L159:
.option	pic0
jal	mix3to2
.option	pic2
move	$4,$18

lw	$28,16($sp)
addiu	$8,$18,4096
addiu	$7,$18,3072
addiu	$6,$18,2048
$L198:
lwl	$2,3($7)
lwl	$3,7($7)
lwl	$4,11($7)
lwl	$5,15($7)
lwr	$2,0($7)
lwr	$3,4($7)
lwr	$4,8($7)
lwr	$5,12($7)
swl	$2,3($6)
swr	$2,0($6)
swl	$3,7($6)
swr	$3,4($6)
swl	$4,11($6)
swr	$4,8($6)
addiu	$7,$7,16
swl	$5,15($6)
swr	$5,12($6)
bne	$7,$8,$L198
addiu	$6,$6,16

b	$L232
lw	$31,132($sp)

$L158:
addiu	$8,$18,3072
addiu	$6,$18,2048
move	$7,$8
$L197:
lwl	$2,3($6)
lwl	$3,7($6)
lwl	$4,11($6)
lwl	$5,15($6)
lwr	$2,0($6)
lwr	$3,4($6)
lwr	$4,8($6)
lwr	$5,12($6)
swl	$2,3($7)
swr	$2,0($7)
swl	$3,7($7)
swr	$3,4($7)
swl	$4,11($7)
swr	$4,8($7)
addiu	$6,$6,16
swl	$5,15($7)
swr	$5,12($7)
bne	$6,$8,$L197
addiu	$7,$7,16

b	$L232
lw	$31,132($sp)

$L157:
move	$4,$18
addiu	$6,$18,1024
$L196:
lw	$2,3072($4)
lw	$3,4096($4)
addu	$2,$2,$3
sw	$2,3072($4)
addiu	$4,$4,4
bne	$6,$4,$L196
lw	$31,132($sp)

b	$L236
lw	$fp,128($sp)

$L156:
.option	pic0
jal	mix3to2
.option	pic2
move	$4,$18

lw	$28,16($sp)
move	$4,$18
addiu	$6,$18,1024
$L195:
lw	$2,4096($4)
lw	$3,3072($4)
addu	$2,$2,$3
sw	$2,2048($4)
addiu	$4,$4,4
bne	$6,$4,$L195
lw	$31,132($sp)

b	$L236
lw	$fp,128($sp)

$L155:
move	$4,$18
addiu	$6,$18,1024
$L194:
lw	$2,2048($4)
lw	$3,3072($4)
addu	$2,$2,$3
sw	$2,2048($4)
addiu	$4,$4,4
bne	$6,$4,$L194
lw	$31,132($sp)

b	$L236
lw	$fp,128($sp)

$L154:
.option	pic0
jal	mix3to2
.option	pic2
move	$4,$18

lw	$28,16($sp)
addiu	$8,$18,4096
addiu	$7,$18,3072
addiu	$6,$18,2048
$L193:
lwl	$2,3($7)
lwl	$3,7($7)
lwl	$4,11($7)
lwl	$5,15($7)
lwr	$2,0($7)
lwr	$3,4($7)
lwr	$4,8($7)
lwr	$5,12($7)
swl	$2,3($6)
swr	$2,0($6)
swl	$3,7($6)
swr	$3,4($6)
swl	$4,11($6)
swr	$4,8($6)
addiu	$7,$7,16
swl	$5,15($6)
swr	$5,12($6)
bne	$7,$8,$L193
addiu	$6,$6,16

b	$L232
lw	$31,132($sp)

$L153:
beq	$8,$0,$L202
move	$5,$18

move	$4,$18
move	$6,$0
li	$7,256			# 0x100
$L191:
lw	$2,0($4)
lw	$3,3072($4)
addiu	$6,$6,1
addu	$2,$2,$3
sw	$2,0($4)
bne	$6,$7,$L191
addiu	$4,$4,4

addiu	$6,$18,1024
$L192:
lw	$2,2048($5)
lw	$3,4096($5)
addu	$2,$2,$3
sw	$2,2048($5)
addiu	$5,$5,4
bne	$6,$5,$L192
lw	$31,132($sp)

b	$L236
lw	$fp,128($sp)

$L167:
andi	$2,$6,0x40
beq	$2,$0,$L187
li	$8,256			# 0x100

lui	$6,%hi($LC0)
lui	$2,%hi($LC1)
lw	$3,%lo($LC0+4)($6)
lw	$4,%lo($LC1+4)($2)
lw	$6,%lo($LC0)($6)
lw	$2,%lo($LC1)($2)
sw	$3,64($sp)
sw	$4,72($sp)
sw	$6,60($sp)
sw	$2,68($sp)
move	$fp,$18
sw	$0,24($sp)
sw	$2,76($sp)
sw	$4,80($sp)
sw	$6,84($sp)
sw	$3,88($sp)
$L188:
lw	$5,24($sp)
lw	$25,%call16(__floatsidf)($28)
lw	$4,1024($fp)
addiu	$5,$5,1
jalr	$25
sw	$5,24($sp)

lw	$28,16($sp)
move	$4,$2
lui	$2,%hi($LC2)
addiu	$2,$2,%lo($LC2)
lw	$6,0($2)
lw	$7,4($2)
lw	$25,%call16(__muldf3)($28)
jalr	$25
move	$5,$3

lw	$28,16($sp)
move	$5,$3
lw	$25,%call16(__fixdfsi)($28)
jalr	$25
move	$4,$2

lw	$28,16($sp)
lw	$4,3072($fp)
lw	$25,%call16(__floatsidf)($28)
jalr	$25
move	$19,$2

lw	$28,16($sp)
lw	$4,4096($fp)
lw	$25,%call16(__floatsidf)($28)
move	$22,$2
jalr	$25
move	$23,$3

lw	$28,16($sp)
lw	$6,60($sp)
lw	$25,%call16(__muldf3)($28)
lw	$7,64($sp)
move	$4,$2
move	$5,$3
lw	$18,0($fp)
move	$20,$2
jalr	$25
move	$21,$3

lw	$28,16($sp)
lw	$6,68($sp)
lw	$25,%call16(__muldf3)($28)
lw	$7,72($sp)
move	$4,$22
move	$5,$23
move	$16,$2
jalr	$25
move	$17,$3

lw	$28,16($sp)
move	$6,$2
lw	$25,%call16(__adddf3)($28)
move	$7,$3
move	$4,$16
jalr	$25
move	$5,$17

lw	$28,16($sp)
move	$5,$3
lw	$25,%call16(__fixdfsi)($28)
jalr	$25
move	$4,$2

lw	$28,16($sp)
addu	$18,$19,$18
lw	$25,%call16(__muldf3)($28)
lw	$6,76($sp)
addu	$18,$18,$2
lw	$7,80($sp)
sw	$18,0($fp)
move	$4,$20
jalr	$25
move	$5,$21

lw	$28,16($sp)
lw	$6,84($sp)
lw	$25,%call16(__muldf3)($28)
lw	$7,88($sp)
move	$4,$22
move	$5,$23
move	$16,$2
jalr	$25
move	$17,$3

lw	$28,16($sp)
move	$4,$16
lw	$25,%call16(__adddf3)($28)
move	$5,$17
move	$6,$2
jalr	$25
move	$7,$3

lw	$28,16($sp)
lw	$6,2048($fp)
lw	$25,%call16(__fixdfsi)($28)
move	$4,$2
move	$5,$3
jalr	$25
addu	$19,$19,$6

lw	$3,24($sp)
addu	$19,$19,$2
li	$4,256			# 0x100
sw	$19,1024($fp)
lw	$28,16($sp)
bne	$3,$4,$L188
addiu	$fp,$fp,4

b	$L232
lw	$31,132($sp)

$L148:
beq	$8,$0,$L202
move	$5,$18

move	$6,$0
li	$7,256			# 0x100
$L177:
lw	$2,2048($5)
lw	$3,0($5)
lw	$4,1024($5)
addu	$3,$3,$2
addu	$4,$4,$2
addiu	$6,$6,1
sw	$3,0($5)
sw	$4,1024($5)
bne	$6,$7,$L177
addiu	$5,$5,4

b	$L232
lw	$31,132($sp)

$L151:
beq	$8,$0,$L147
move	$7,$18

move	$8,$0
li	$9,256			# 0x100
$L186:
lw	$2,1024($7)
lw	$6,0($7)
lw	$3,2048($7)
lw	$4,3072($7)
lw	$5,4096($7)
addu	$3,$2,$3
addu	$2,$2,$6
addu	$2,$2,$4
addu	$3,$3,$5
addiu	$8,$8,1
sw	$2,0($7)
sw	$3,1024($7)
bne	$8,$9,$L186
addiu	$7,$7,4

b	$L232
lw	$31,132($sp)

$L146:
beq	$8,$0,$L234
move	$5,$18

move	$6,$18
move	$7,$0
li	$8,256			# 0x100
$L175:
lw	$3,0($6)
lw	$2,1024($6)
lw	$4,2048($6)
addu	$2,$2,$3
lw	$5,3072($6)
lw	$3,4096($6)
addu	$2,$2,$4
addu	$2,$2,$5
addu	$2,$2,$3
addiu	$7,$7,1
sw	$2,0($6)
bne	$7,$8,$L175
addiu	$6,$6,4

b	$L232
lw	$31,132($sp)

$L152:
beq	$8,$0,$L202
move	$5,$0

move	$6,$18
li	$7,256			# 0x100
$L190:
lw	$2,3072($6)
lw	$3,0($6)
lw	$4,2048($6)
addu	$3,$3,$2
addu	$4,$4,$2
addiu	$5,$5,1
sw	$3,0($6)
sw	$4,2048($6)
bne	$5,$7,$L190
addiu	$6,$6,4

b	$L232
lw	$31,132($sp)

$L187:
move	$7,$0
$L189:
lw	$4,1024($18)
lw	$6,0($18)
lw	$3,4096($18)
lw	$5,3072($18)
lw	$2,2048($18)
addu	$3,$3,$5
addu	$2,$4,$2
addu	$4,$4,$6
addu	$2,$2,$3
subu	$4,$4,$3
addiu	$7,$7,1
sw	$4,0($18)
sw	$2,1024($18)
bne	$7,$8,$L189
addiu	$18,$18,4

b	$L232
lw	$31,132($sp)

$L183:
move	$7,$0
li	$8,256			# 0x100
$L185:
lw	$2,3072($6)
lw	$5,2048($6)
lw	$3,0($6)
lw	$4,1024($6)
addu	$2,$2,$5
addu	$4,$4,$2
subu	$3,$3,$2
addiu	$7,$7,1
sw	$3,0($6)
sw	$4,1024($6)
bne	$7,$8,$L185
addiu	$6,$6,4

b	$L232
lw	$31,132($sp)

.set	macro
.set	reorder
.end	a52_downmix
.rdata
.align	2
.type	table.3007, @object
.size	table.3007, 88
table.3007:
.byte	0
.byte	10
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	0
.byte	10
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	2
.byte	0
.byte	10
.byte	2
.byte	3
.byte	2
.byte	3
.byte	2
.byte	3
.byte	0
.byte	10
.byte	2
.byte	2
.byte	4
.byte	4
.byte	4
.byte	4
.byte	0
.byte	10
.byte	2
.byte	2
.byte	4
.byte	5
.byte	4
.byte	5
.byte	0
.byte	10
.byte	2
.byte	3
.byte	6
.byte	6
.byte	6
.byte	6
.byte	0
.byte	10
.byte	2
.byte	3
.byte	6
.byte	7
.byte	6
.byte	7
.byte	8
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	9
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	1
.byte	0
.byte	10
.byte	2
.byte	10
.byte	10
.byte	10
.byte	10
.byte	10
.section	.rodata.cst8,"aM",@progbits,8
.align	3
$LC0:
.word	0
.word	-1075838976
.align	3
$LC1:
.word	-396866390
.word	1072412282
.align	3
$LC2:
.word	1719614413
.word	1072079006
.ident	"GCC: (GNU) 4.3.3"

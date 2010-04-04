.file	1 "dsputil.c"
.section .mdebug.abi32
.previous
.gnu_attribute 4, 3
.abicalls
.text
.align	2
.ent	pix_sum_c
.type	pix_sum_c, @function
pix_sum_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$10,$4
move	$12,$5
move	$8,$0
move	$9,$0
li	$11,16			# 0x10
$L2:
move	$6,$10
move	$7,$0
$L3:
lbu	$3,0($6)
lbu	$2,1($6)
lbu	$4,2($6)
lbu	$5,3($6)
addu	$2,$2,$3
addu	$2,$2,$4
lbu	$3,4($6)
addu	$2,$2,$5
lbu	$4,5($6)
addu	$2,$2,$3
lbu	$5,6($6)
lbu	$3,7($6)
addu	$2,$2,$4
addu	$2,$2,$5
addu	$2,$2,$3
addiu	$7,$7,8
addu	$8,$8,$2
bne	$7,$11,$L3
addiu	$6,$6,8

addiu	$9,$9,1
bne	$9,$11,$L2
addu	$10,$10,$12

j	$31
move	$2,$8

.set	macro
.set	reorder
.end	pix_sum_c
.align	2
.ent	pix_norm1_c
.type	pix_norm1_c, @function
pix_norm1_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
.mask	0x00010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lui	$2,%hi(ff_squareTbl+1024)
sw	$16,4($sp)
move	$24,$4
addiu	$11,$2,%lo(ff_squareTbl+1024)
move	$16,$5
move	$14,$0
move	$15,$0
li	$25,16			# 0x10
$L9:
move	$12,$24
move	$13,$0
$L10:
lw	$7,0($12)
lw	$8,4($12)
srl	$3,$7,24
andi	$4,$7,0xff
andi	$5,$8,0xff
sll	$3,$3,2
sll	$4,$4,2
addu	$3,$11,$3
addu	$4,$11,$4
srl	$6,$8,24
sll	$5,$5,2
lw	$9,0($4)
lw	$2,0($3)
addu	$5,$11,$5
srl	$3,$7,6
sll	$6,$6,2
lw	$10,0($5)
addu	$6,$11,$6
andi	$3,$3,0x3fc
srl	$7,$7,14
lw	$5,0($6)
addu	$2,$2,$9
addu	$3,$11,$3
srl	$4,$8,6
andi	$7,$7,0x3fc
lw	$9,0($3)
addu	$2,$2,$10
addu	$7,$11,$7
andi	$4,$4,0x3fc
srl	$8,$8,14
addu	$2,$2,$5
lw	$6,0($7)
addu	$4,$11,$4
andi	$8,$8,0x3fc
addu	$2,$2,$9
lw	$5,0($4)
addu	$8,$11,$8
addu	$2,$2,$6
lw	$3,0($8)
addu	$2,$2,$5
addu	$2,$2,$3
addiu	$13,$13,8
addu	$14,$2,$14
bne	$13,$25,$L10
addiu	$12,$12,8

addiu	$15,$15,1
bne	$15,$25,$L9
addu	$24,$24,$16

move	$2,$14
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	pix_norm1_c
.align	2
.ent	bswap_buf
.type	bswap_buf, @function
bswap_buf:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

slt	$2,$6,8
bne	$2,$0,$L23
move	$13,$4

addiu	$2,$6,-8
srl	$2,$2,3
addiu	$2,$2,1
li	$3,16711680			# 0xff0000
li	$4,-16777216			# 0xffffffffff000000
ori	$10,$3,0xff
ori	$9,$4,0xff00
sll	$12,$2,3
move	$8,$5
move	$7,$13
move	$11,$0
$L17:
lw	$3,0($8)
addiu	$11,$11,8
sll	$2,$3,8
srl	$3,$3,8
and	$2,$2,$9
and	$3,$3,$10
or	$3,$3,$2
sll	$4,$3,16
srl	$3,$3,16
or	$3,$3,$4
sw	$3,0($7)
lw	$2,4($8)
sll	$3,$2,8
srl	$2,$2,8
and	$3,$3,$9
and	$2,$2,$10
or	$2,$2,$3
sll	$4,$2,16
srl	$2,$2,16
or	$2,$2,$4
sw	$2,4($7)
lw	$3,8($8)
sll	$2,$3,8
srl	$3,$3,8
and	$2,$2,$9
and	$3,$3,$10
or	$3,$3,$2
sll	$4,$3,16
srl	$3,$3,16
or	$3,$3,$4
sw	$3,8($7)
lw	$2,12($8)
sll	$3,$2,8
srl	$2,$2,8
and	$3,$3,$9
and	$2,$2,$10
or	$2,$2,$3
sll	$4,$2,16
srl	$2,$2,16
or	$2,$2,$4
sw	$2,12($7)
lw	$3,16($8)
sll	$2,$3,8
srl	$3,$3,8
and	$2,$2,$9
and	$3,$3,$10
or	$3,$3,$2
sll	$4,$3,16
srl	$3,$3,16
or	$3,$3,$4
sw	$3,16($7)
lw	$2,20($8)
sll	$3,$2,8
srl	$2,$2,8
and	$3,$3,$9
and	$2,$2,$10
or	$2,$2,$3
sll	$4,$2,16
srl	$2,$2,16
or	$2,$2,$4
sw	$2,20($7)
lw	$3,24($8)
sll	$2,$3,8
srl	$3,$3,8
and	$2,$2,$9
and	$3,$3,$10
or	$3,$3,$2
sll	$4,$3,16
srl	$3,$3,16
or	$3,$3,$4
sw	$3,24($7)
lw	$2,28($8)
addiu	$8,$8,32
sll	$3,$2,8
srl	$2,$2,8
and	$2,$2,$10
and	$3,$3,$9
or	$2,$2,$3
sll	$4,$2,16
srl	$2,$2,16
or	$2,$2,$4
sw	$2,28($7)
bne	$11,$12,$L17
addiu	$7,$7,32

move	$8,$11
$L16:
slt	$2,$8,$6
beq	$2,$0,$L24
sll	$2,$8,2

addu	$7,$13,$2
addu	$5,$5,$2
li	$3,16711680			# 0xff0000
li	$2,-16777216			# 0xffffffffff000000
ori	$10,$3,0xff
ori	$9,$2,0xff00
$L19:
lw	$2,0($5)
addiu	$8,$8,1
sll	$3,$2,8
srl	$2,$2,8
and	$3,$3,$9
and	$2,$2,$10
or	$2,$2,$3
sll	$4,$2,16
srl	$2,$2,16
or	$2,$2,$4
slt	$3,$8,$6
sw	$2,0($7)
addiu	$5,$5,4
bne	$3,$0,$L19
addiu	$7,$7,4

$L24:
j	$31
nop

$L23:
b	$L16
move	$8,$0

.set	macro
.set	reorder
.end	bswap_buf
.align	2
.ent	sse4_c
.type	sse4_c, @function
sse4_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,16($sp)
move	$9,$5
move	$8,$6
blez	$14,$L31
move	$13,$7

lui	$2,%hi(ff_squareTbl+1024)
addiu	$11,$2,%lo(ff_squareTbl+1024)
move	$12,$0
move	$10,$0
$L28:
lbu	$4,1($8)
lbu	$2,0($8)
lbu	$5,1($9)
lbu	$3,0($9)
lbu	$7,2($8)
lbu	$6,2($9)
subu	$5,$5,$4
subu	$3,$3,$2
lbu	$4,3($9)
lbu	$2,3($8)
subu	$6,$6,$7
sll	$5,$5,2
sll	$3,$3,2
subu	$4,$4,$2
addu	$5,$11,$5
addu	$3,$11,$3
sll	$6,$6,2
lw	$2,0($5)
lw	$7,0($3)
addu	$6,$11,$6
sll	$4,$4,2
addu	$4,$11,$4
lw	$5,0($6)
lw	$3,0($4)
addu	$2,$2,$7
addu	$2,$2,$5
addiu	$10,$10,1
addu	$2,$2,$3
slt	$4,$10,$14
addu	$12,$2,$12
addu	$9,$9,$13
bne	$4,$0,$L28
addu	$8,$8,$13

$L27:
j	$31
move	$2,$12

$L31:
b	$L27
move	$12,$0

.set	macro
.set	reorder
.end	sse4_c
.align	2
.ent	sse8_c
.type	sse8_c, @function
sse8_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
sw	$17,4($sp)
lw	$17,24($sp)
sw	$16,0($sp)
move	$14,$5
move	$13,$6
blez	$17,$L38
move	$16,$7

lui	$2,%hi(ff_squareTbl+1024)
addiu	$15,$2,%lo(ff_squareTbl+1024)
move	$25,$0
move	$24,$0
$L35:
lbu	$6,1($13)
lbu	$2,0($13)
lbu	$4,1($14)
lbu	$3,0($14)
lbu	$8,2($13)
lbu	$5,2($14)
subu	$4,$4,$6
subu	$3,$3,$2
lbu	$7,3($14)
lbu	$2,3($13)
lbu	$9,4($13)
subu	$5,$5,$8
sll	$4,$4,2
lbu	$8,4($14)
sll	$3,$3,2
lbu	$10,5($13)
subu	$7,$7,$2
addu	$4,$15,$4
addu	$3,$15,$3
lbu	$6,5($14)
sll	$5,$5,2
subu	$8,$8,$9
lw	$2,0($4)
lbu	$9,6($13)
lw	$12,0($3)
addu	$5,$15,$5
lbu	$4,6($14)
sll	$7,$7,2
subu	$6,$6,$10
lw	$11,0($5)
addu	$7,$15,$7
lbu	$5,7($13)
lbu	$3,7($14)
sll	$8,$8,2
subu	$4,$4,$9
lw	$10,0($7)
addu	$2,$2,$12
addu	$8,$15,$8
sll	$6,$6,2
subu	$3,$3,$5
addu	$2,$2,$11
lw	$9,0($8)
addu	$6,$15,$6
sll	$4,$4,2
addu	$4,$15,$4
addu	$2,$2,$10
lw	$7,0($6)
sll	$3,$3,2
lw	$5,0($4)
addu	$3,$15,$3
addu	$2,$2,$9
lw	$4,0($3)
addu	$2,$2,$7
addu	$2,$2,$5
addiu	$24,$24,1
addu	$2,$2,$4
slt	$3,$24,$17
addu	$25,$2,$25
addu	$14,$14,$16
bne	$3,$0,$L35
addu	$13,$13,$16

$L34:
move	$2,$25
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

$L38:
b	$L34
move	$25,$0

.set	macro
.set	reorder
.end	sse8_c
.align	2
.ent	sse16_c
.type	sse16_c, @function
sse16_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
sw	$17,4($sp)
lw	$17,24($sp)
sw	$16,0($sp)
move	$14,$5
move	$13,$6
blez	$17,$L45
move	$16,$7

lui	$2,%hi(ff_squareTbl+1024)
addiu	$15,$2,%lo(ff_squareTbl+1024)
move	$25,$0
move	$24,$0
$L42:
lbu	$6,1($13)
lbu	$2,0($13)
lbu	$4,1($14)
lbu	$3,0($14)
lbu	$7,2($13)
lbu	$5,2($14)
subu	$4,$4,$6
subu	$3,$3,$2
lbu	$6,3($14)
lbu	$2,3($13)
lbu	$9,4($13)
subu	$5,$5,$7
sll	$4,$4,2
lbu	$7,4($14)
sll	$3,$3,2
lbu	$10,5($13)
subu	$6,$6,$2
addu	$4,$15,$4
addu	$3,$15,$3
lbu	$8,5($14)
sll	$5,$5,2
lw	$11,0($3)
subu	$7,$7,$9
lw	$2,0($4)
lbu	$9,6($13)
addu	$5,$15,$5
lbu	$3,6($14)
sll	$6,$6,2
lw	$12,0($5)
subu	$8,$8,$10
addu	$6,$15,$6
lbu	$10,7($13)
lbu	$4,7($14)
sll	$7,$7,2
addu	$2,$2,$11
subu	$3,$3,$9
lw	$11,0($6)
addu	$7,$15,$7
lbu	$6,8($13)
lbu	$5,8($14)
sll	$8,$8,2
lbu	$9,9($13)
addu	$2,$2,$12
subu	$4,$4,$10
lw	$12,0($7)
addu	$8,$15,$8
lbu	$7,9($14)
sll	$3,$3,2
lw	$10,0($8)
addu	$2,$2,$11
subu	$5,$5,$6
addu	$3,$15,$3
lbu	$6,10($13)
lbu	$8,10($14)
sll	$4,$4,2
lw	$11,0($3)
addu	$2,$2,$12
lbu	$3,11($13)
subu	$7,$7,$9
addu	$4,$15,$4
lbu	$9,11($14)
sll	$5,$5,2
addu	$2,$2,$10
subu	$8,$8,$6
lw	$10,0($4)
addu	$5,$15,$5
lbu	$4,12($13)
lbu	$6,12($14)
sll	$7,$7,2
lw	$12,0($5)
addu	$2,$2,$11
subu	$9,$9,$3
addu	$7,$15,$7
lbu	$3,13($13)
lbu	$5,13($14)
sll	$8,$8,2
addu	$2,$2,$10
subu	$6,$6,$4
lw	$10,0($7)
addu	$8,$15,$8
lbu	$4,14($14)
lbu	$11,14($13)
sll	$9,$9,2
addu	$2,$2,$12
subu	$5,$5,$3
lw	$12,0($8)
lbu	$3,15($14)
lbu	$7,15($13)
addu	$9,$15,$9
sll	$6,$6,2
addu	$2,$2,$10
addu	$6,$15,$6
subu	$4,$4,$11
lw	$10,0($9)
sll	$5,$5,2
lw	$8,0($6)
addu	$5,$15,$5
addu	$2,$2,$12
subu	$3,$3,$7
sll	$4,$4,2
lw	$6,0($5)
addu	$4,$15,$4
addu	$2,$2,$10
sll	$3,$3,2
lw	$5,0($4)
addu	$3,$15,$3
addu	$2,$2,$8
lw	$4,0($3)
addu	$2,$2,$6
addu	$2,$2,$5
addiu	$24,$24,1
addu	$2,$2,$4
slt	$3,$24,$17
addu	$25,$2,$25
addu	$14,$14,$16
bne	$3,$0,$L42
addu	$13,$13,$16

$L41:
move	$2,$25
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

$L45:
b	$L41
move	$25,$0

.set	macro
.set	reorder
.end	sse16_c
.align	2
.ent	get_pixels_c
.type	get_pixels_c, @function
get_pixels_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$0
li	$8,8			# 0x8
$L47:
lbu	$3,0($5)
addiu	$7,$7,1
sh	$3,0($4)
lbu	$2,1($5)
sh	$2,2($4)
lbu	$3,2($5)
sh	$3,4($4)
lbu	$2,3($5)
sh	$2,6($4)
lbu	$3,4($5)
sh	$3,8($4)
lbu	$2,5($5)
sh	$2,10($4)
lbu	$3,6($5)
sh	$3,12($4)
lbu	$2,7($5)
addu	$5,$5,$6
sh	$2,14($4)
bne	$7,$8,$L47
addiu	$4,$4,16

j	$31
nop

.set	macro
.set	reorder
.end	get_pixels_c
.align	2
.ent	diff_pixels_c
.type	diff_pixels_c, @function
diff_pixels_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$8,$0
li	$9,8			# 0x8
$L51:
lbu	$2,0($6)
lbu	$3,0($5)
addiu	$8,$8,1
subu	$3,$3,$2
sh	$3,0($4)
lbu	$3,1($6)
lbu	$2,1($5)
subu	$2,$2,$3
sh	$2,2($4)
lbu	$2,2($6)
lbu	$3,2($5)
subu	$3,$3,$2
sh	$3,4($4)
lbu	$3,3($6)
lbu	$2,3($5)
subu	$2,$2,$3
sh	$2,6($4)
lbu	$2,4($6)
lbu	$3,4($5)
subu	$3,$3,$2
sh	$3,8($4)
lbu	$3,5($6)
lbu	$2,5($5)
subu	$2,$2,$3
sh	$2,10($4)
lbu	$2,6($6)
lbu	$3,6($5)
subu	$3,$3,$2
sh	$3,12($4)
lbu	$2,7($5)
lbu	$3,7($6)
addu	$5,$5,$7
subu	$2,$2,$3
sh	$2,14($4)
addu	$6,$6,$7
bne	$8,$9,$L51
addiu	$4,$4,16

j	$31
nop

.set	macro
.set	reorder
.end	diff_pixels_c
.align	2
.ent	put_pixels_clamped_c
.type	put_pixels_clamped_c, @function
put_pixels_clamped_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$2,%hi(ff_cropTbl+1024)
addiu	$7,$2,%lo(ff_cropTbl+1024)
move	$8,$0
li	$9,8			# 0x8
$L55:
lh	$2,0($4)
addiu	$8,$8,1
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,0($5)
lh	$2,2($4)
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,1($5)
lh	$2,4($4)
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,2($5)
lh	$2,6($4)
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,3($5)
lh	$2,8($4)
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,4($5)
lh	$2,10($4)
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,5($5)
lh	$2,12($4)
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,6($5)
lh	$2,14($4)
addiu	$4,$4,16
addu	$2,$7,$2
lbu	$3,0($2)
sb	$3,7($5)
bne	$8,$9,$L55
addu	$5,$5,$6

j	$31
nop

.set	macro
.set	reorder
.end	put_pixels_clamped_c
.align	2
.ent	put_signed_pixels_clamped_c
.type	put_signed_pixels_clamped_c, @function
put_signed_pixels_clamped_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$11,$0
li	$13,-1
li	$12,8			# 0x8
$L59:
move	$10,$4
move	$9,$5
b	$L63
move	$8,$0

$L68:
sb	$0,0($9)
$L61:
addiu	$8,$8,1
addiu	$10,$10,2
beq	$8,$12,$L67
addiu	$9,$9,1

$L63:
lh	$3,0($10)
slt	$2,$3,-128
bne	$2,$0,$L68
slt	$7,$3,128

bne	$7,$0,$L62
addiu	$2,$3,-128

addiu	$8,$8,1
sb	$13,0($9)
addiu	$10,$10,2
bne	$8,$12,$L63
addiu	$9,$9,1

$L67:
addiu	$11,$11,1
beq	$11,$12,$L69
addiu	$4,$4,16

b	$L59
addu	$5,$5,$6

$L62:
b	$L61
sb	$2,0($9)

$L69:
j	$31
nop

.set	macro
.set	reorder
.end	put_signed_pixels_clamped_c
.align	2
.ent	add_pixels_clamped_c
.type	add_pixels_clamped_c, @function
add_pixels_clamped_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$2,%hi(ff_cropTbl+1024)
move	$10,$4
move	$9,$5
move	$14,$6
addiu	$11,$2,%lo(ff_cropTbl+1024)
move	$12,$0
li	$13,8			# 0x8
$L71:
lh	$2,0($10)
lbu	$3,0($9)
lbu	$4,1($9)
addu	$2,$2,$3
addu	$2,$11,$2
lbu	$3,0($2)
lbu	$5,2($9)
sb	$3,0($9)
lh	$2,2($10)
lbu	$6,3($9)
addu	$2,$2,$4
addu	$2,$11,$2
lbu	$3,0($2)
lbu	$4,4($9)
sb	$3,1($9)
lh	$2,4($10)
lbu	$7,5($9)
addu	$2,$2,$5
addu	$2,$11,$2
lbu	$3,0($2)
lbu	$5,6($9)
sb	$3,2($9)
lh	$2,6($10)
lbu	$8,7($9)
addu	$2,$2,$6
addu	$2,$11,$2
lbu	$3,0($2)
addiu	$12,$12,1
sb	$3,3($9)
lh	$2,8($10)
addu	$2,$2,$4
addu	$2,$11,$2
lbu	$3,0($2)
sb	$3,4($9)
lh	$2,10($10)
addu	$2,$2,$7
addu	$2,$11,$2
lbu	$3,0($2)
sb	$3,5($9)
lh	$2,12($10)
addu	$2,$2,$5
addu	$2,$11,$2
lbu	$3,0($2)
sb	$3,6($9)
lh	$2,14($10)
addiu	$10,$10,16
addu	$2,$2,$8
addu	$2,$11,$2
lbu	$3,0($2)
sb	$3,7($9)
bne	$12,$13,$L71
addu	$9,$9,$14

j	$31
nop

.set	macro
.set	reorder
.end	add_pixels_clamped_c
.align	2
.ent	add_pixels8_c
.type	add_pixels8_c, @function
add_pixels8_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$4
move	$8,$5
move	$9,$0
li	$10,8			# 0x8
$L75:
lbu	$3,0($8)
lbu	$2,0($7)
lbu	$4,1($7)
addu	$3,$3,$2
sb	$3,0($7)
lbu	$2,2($8)
lbu	$5,2($7)
addu	$2,$2,$4
sb	$2,1($7)
lbu	$3,4($8)
lbu	$4,3($7)
addu	$3,$3,$5
sb	$3,2($7)
lbu	$2,6($8)
lbu	$5,4($7)
addu	$2,$2,$4
sb	$2,3($7)
lbu	$3,8($8)
lbu	$4,5($7)
addu	$3,$3,$5
sb	$3,4($7)
lbu	$2,10($8)
lbu	$5,6($7)
addu	$2,$2,$4
sb	$2,5($7)
lbu	$3,12($8)
lbu	$4,7($7)
addu	$3,$3,$5
sb	$3,6($7)
lbu	$2,14($8)
addiu	$9,$9,1
addu	$2,$2,$4
sb	$2,7($7)
addiu	$8,$8,16
bne	$9,$10,$L75
addu	$7,$7,$6

j	$31
nop

.set	macro
.set	reorder
.end	add_pixels8_c
.align	2
.ent	add_pixels4_c
.type	add_pixels4_c, @function
add_pixels4_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$4
move	$8,$5
move	$9,$0
li	$10,4			# 0x4
$L79:
lbu	$3,0($8)
lbu	$2,0($7)
lbu	$4,1($7)
addu	$3,$3,$2
sb	$3,0($7)
lbu	$2,2($8)
lbu	$5,2($7)
addu	$2,$2,$4
sb	$2,1($7)
lbu	$3,4($8)
lbu	$4,3($7)
addu	$3,$3,$5
sb	$3,2($7)
lbu	$2,6($8)
addiu	$9,$9,1
addu	$2,$2,$4
sb	$2,3($7)
addiu	$8,$8,8
bne	$9,$10,$L79
addu	$7,$7,$6

j	$31
nop

.set	macro
.set	reorder
.end	add_pixels4_c
.align	2
.ent	sum_abs_dctelem_c
.type	sum_abs_dctelem_c, @function
sum_abs_dctelem_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$8,$4
move	$6,$0
move	$5,$0
li	$7,128			# 0x80
$L84:
addu	$3,$8,$5
lh	$2,0($3)
addiu	$5,$5,2
subu	$4,$0,$2
slt	$3,$2,0
movn	$2,$4,$3
bne	$5,$7,$L84
addu	$6,$6,$2

j	$31
move	$2,$6

.set	macro
.set	reorder
.end	sum_abs_dctelem_c
.align	2
.ent	avg_pixels2_c
.type	avg_pixels2_c, @function
avg_pixels2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$10,$4
blez	$7,$L92
move	$8,$5

li	$2,-16908288			# 0xfffffffffefe0000
ori	$11,$2,0xfefe
move	$9,$0
$L89:
lbu	$2,1($8)
lbu	$4,0($8)
lhu	$5,0($10)
sll	$2,$2,8
or	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$11
srl	$3,$3,1
addiu	$9,$9,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$9,$7
sh	$2,0($10)
addu	$8,$8,$6
bne	$4,$0,$L89
addu	$10,$10,$6

$L92:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels2_c
.align	2
.ent	avg_pixels4_c
.type	avg_pixels4_c, @function
avg_pixels4_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L98
move	$9,$4

li	$2,-16908288			# 0xfffffffffefe0000
ori	$10,$2,0xfefe
move	$8,$0
$L95:
lwl	$3,3($5)
lw	$4,0($9)
lwr	$3,0($5)
addiu	$8,$8,1
xor	$2,$3,$4
and	$2,$2,$10
or	$3,$3,$4
srl	$2,$2,1
subu	$3,$3,$2
slt	$4,$8,$7
sw	$3,0($9)
addu	$5,$5,$6
bne	$4,$0,$L95
addu	$9,$9,$6

$L98:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels4_c
.align	2
.ent	avg_pixels8_c
.type	avg_pixels8_c, @function
avg_pixels8_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$9,$4
blez	$7,$L104
move	$8,$5

li	$2,-16908288			# 0xfffffffffefe0000
ori	$11,$2,0xfefe
move	$10,$0
$L101:
lwl	$2,3($8)
lw	$4,0($9)
lwr	$2,0($8)
lw	$5,4($9)
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($9)
lwl	$3,7($8)
addiu	$10,$10,1
lwr	$3,4($8)
slt	$4,$10,$7
xor	$2,$3,$5
and	$2,$2,$11
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,4($9)
addu	$8,$8,$6
bne	$4,$0,$L101
addu	$9,$9,$6

$L104:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels8_c
.align	2
.ent	avg_no_rnd_pixels8_c
.type	avg_no_rnd_pixels8_c, @function
avg_no_rnd_pixels8_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	avg_pixels8_c
nop

.option	pic2
.set	macro
.set	reorder
.end	avg_no_rnd_pixels8_c
.align	2
.ent	avg_pixels8_l2
.type	avg_pixels8_l2, @function
avg_pixels8_l2:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,24($sp)
lw	$13,16($sp)
blez	$14,$L112
lw	$12,20($sp)

li	$2,-16908288			# 0xfffffffffefe0000
move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L109:
lwl	$4,3($8)
lwl	$2,3($6)
lwr	$4,0($8)
lwr	$2,0($6)
lw	$5,0($9)
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$11
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($9)
lwl	$4,7($8)
lwl	$3,7($6)
lwr	$4,4($8)
lwr	$3,4($6)
lw	$5,4($9)
xor	$2,$3,$4
and	$2,$2,$11
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$11
srl	$4,$4,1
addiu	$10,$10,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$10,$14
sw	$3,4($9)
addu	$8,$8,$13
addu	$6,$6,$12
bne	$2,$0,$L109
addu	$9,$9,$7

$L112:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels8_l2
.align	2
.ent	avg_pixels4_x2_c
.type	avg_pixels4_x2_c, @function
avg_pixels4_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L118
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L115:
lwl	$4,3($8)
lwl	$3,4($8)
lwr	$4,0($8)
lwr	$3,1($8)
lw	$5,0($9)
xor	$2,$3,$4
and	$2,$2,$11
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$11
srl	$4,$4,1
addiu	$10,$10,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$10,$7
sw	$3,0($9)
addu	$8,$8,$6
bne	$2,$0,$L115
addu	$9,$9,$6

$L118:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels4_x2_c
.align	2
.ent	avg_pixels4_y2_c
.type	avg_pixels4_y2_c, @function
avg_pixels4_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$14,$5
blez	$7,$L124
move	$11,$6

li	$2,-16908288			# 0xfffffffffefe0000
move	$9,$4
ori	$13,$2,0xfefe
addu	$12,$5,$6
move	$10,$0
move	$8,$0
$L121:
addu	$2,$14,$8
addu	$4,$12,$8
lwl	$5,3($2)
lwl	$3,3($4)
lwr	$5,0($2)
lwr	$3,0($4)
lw	$6,0($9)
xor	$2,$3,$5
and	$2,$2,$13
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
xor	$4,$3,$6
and	$4,$4,$13
srl	$4,$4,1
addiu	$10,$10,1
or	$3,$3,$6
subu	$3,$3,$4
slt	$2,$10,$7
sw	$3,0($9)
addu	$8,$8,$11
bne	$2,$0,$L121
addu	$9,$9,$11

$L124:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels4_y2_c
.align	2
.ent	avg_pixels2_x2_c
.type	avg_pixels2_x2_c, @function
avg_pixels2_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L130
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L127:
lbu	$5,1($8)
lbu	$2,2($8)
lbu	$3,0($8)
sll	$4,$5,8
sll	$2,$2,8
or	$4,$4,$3
or	$2,$2,$5
xor	$3,$2,$4
and	$3,$3,$11
lhu	$5,0($9)
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$11
srl	$4,$4,1
addiu	$10,$10,1
or	$2,$2,$5
subu	$2,$2,$4
slt	$3,$10,$7
sh	$2,0($9)
addu	$8,$8,$6
bne	$3,$0,$L127
addu	$9,$9,$6

$L130:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels2_x2_c
.align	2
.ent	avg_pixels2_y2_c
.type	avg_pixels2_y2_c, @function
avg_pixels2_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$15,$7
move	$14,$5
blez	$7,$L136
move	$11,$6

li	$2,-16908288			# 0xfffffffffefe0000
move	$9,$4
ori	$13,$2,0xfefe
addu	$12,$5,$6
move	$10,$0
move	$8,$0
$L133:
addu	$3,$14,$8
addu	$5,$12,$8
lbu	$4,1($3)
lbu	$2,1($5)
lbu	$6,0($3)
lbu	$7,0($5)
sll	$4,$4,8
sll	$2,$2,8
or	$4,$4,$6
or	$2,$2,$7
xor	$3,$2,$4
and	$3,$3,$13
lhu	$5,0($9)
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$13
srl	$4,$4,1
addiu	$10,$10,1
or	$2,$2,$5
subu	$2,$2,$4
slt	$3,$10,$15
sh	$2,0($9)
addu	$8,$8,$11
bne	$3,$0,$L133
addu	$9,$9,$11

$L136:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels2_y2_c
.align	2
.ent	avg_pixels2_xy2_c
.type	avg_pixels2_xy2_c, @function
avg_pixels2_xy2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$15,$4
lbu	$2,1($5)
lbu	$4,0($5)
blez	$7,$L142
lbu	$3,2($5)

addiu	$2,$2,2
addu	$9,$5,$6
addu	$13,$2,$3
addu	$11,$2,$4
addu	$12,$15,$6
sll	$10,$6,1
addu	$8,$9,$6
move	$14,$0
$L139:
lbu	$3,1($9)
lbu	$4,0($9)
lbu	$5,2($9)
addu	$4,$3,$4
addu	$5,$5,$3
addu	$2,$11,$4
addu	$3,$13,$5
sra	$2,$2,2
sra	$3,$3,2
sb	$2,0($15)
sb	$3,1($15)
lbu	$2,1($8)
lbu	$6,0($8)
lbu	$3,2($8)
addiu	$2,$2,2
addu	$13,$2,$3
addu	$11,$2,$6
addu	$4,$11,$4
addu	$5,$13,$5
addiu	$14,$14,2
sra	$4,$4,2
sra	$5,$5,2
slt	$2,$14,$7
sb	$4,0($12)
sb	$5,1($12)
addu	$9,$9,$10
addu	$15,$15,$10
addu	$8,$8,$10
bne	$2,$0,$L139
addu	$12,$12,$10

$L142:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels2_xy2_c
.align	2
.ent	avg_pixels4_xy2_c
.type	avg_pixels4_xy2_c, @function
avg_pixels4_xy2_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
sw	$18,12($sp)
sw	$17,8($sp)
sw	$16,4($sp)
lwl	$10,3($5)
lwl	$2,4($5)
move	$9,$5
move	$18,$7
move	$15,$4
move	$14,$6
lwr	$10,0($5)
blez	$7,$L146
lwr	$2,1($5)

li	$6,-50593792			# 0xfffffffffcfc0000
ori	$6,$6,0xfcfc
li	$8,50528256			# 0x3030000
ori	$8,$8,0x303
and	$5,$2,$6
and	$3,$10,$6
and	$4,$10,$8
and	$2,$2,$8
srl	$3,$3,2
li	$7,33685504			# 0x2020000
srl	$5,$5,2
addu	$4,$4,$2
ori	$7,$7,0x202
addu	$10,$9,$14
addu	$5,$5,$3
li	$2,252641280			# 0xf0f0000
li	$3,-16908288			# 0xfffffffffefe0000
addu	$13,$15,$14
sll	$11,$14,1
addu	$9,$10,$14
addu	$12,$4,$7
move	$24,$6
ori	$16,$2,0xf0f
ori	$25,$3,0xfefe
move	$17,$7
move	$14,$0
$L145:
lwl	$2,3($10)
lwl	$6,4($10)
lwr	$2,0($10)
lwr	$6,1($10)
and	$3,$2,$8
and	$7,$6,$8
addu	$7,$7,$3
and	$6,$6,$24
and	$2,$2,$24
addu	$4,$12,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$4,$4,2
addu	$2,$5,$6
and	$4,$4,$16
lw	$5,0($15)
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$25
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($15)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$8
and	$5,$3,$8
addu	$2,$2,$5
addu	$12,$2,$17
and	$3,$3,$24
and	$4,$4,$24
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$12,$7
addu	$5,$3,$4
srl	$7,$7,2
lw	$3,0($13)
addu	$6,$5,$6
and	$7,$7,$16
addu	$6,$6,$7
xor	$2,$6,$3
and	$2,$2,$25
or	$6,$6,$3
srl	$2,$2,1
addiu	$14,$14,2
subu	$6,$6,$2
slt	$3,$14,$18
sw	$6,0($13)
addu	$10,$10,$11
addu	$15,$15,$11
addu	$9,$9,$11
bne	$3,$0,$L145
addu	$13,$13,$11

$L146:
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	avg_pixels4_xy2_c
.align	2
.ent	avg_pixels8_xy2_c
.type	avg_pixels8_xy2_c, @function
avg_pixels8_xy2_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 9/0, args= 0, gp= 0
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
addiu	$3,$7,-1
sw	$22,28($sp)
srl	$3,$3,1
move	$22,$6
nor	$6,$0,$7
mul	$6,$6,$22
addiu	$3,$3,1
li	$2,4			# 0x4
sll	$14,$22,1
sw	$23,32($sp)
mul	$23,$3,$14
mtlo	$2
li	$2,50528256			# 0x3030000
li	$3,33685504			# 0x2020000
ori	$24,$2,0x303
li	$2,-50593792			# 0xfffffffffcfc0000
sw	$21,24($sp)
ori	$15,$2,0xfcfc
ori	$21,$3,0x202
li	$2,-16908288			# 0xfffffffffefe0000
li	$3,252641280			# 0xf0f0000
msub	$7,$22
sw	$fp,36($sp)
sw	$20,20($sp)
sw	$19,16($sp)
sw	$18,12($sp)
sw	$17,8($sp)
sw	$16,4($sp)
move	$19,$4
move	$16,$7
addiu	$fp,$6,4
ori	$18,$3,0xf0f
ori	$17,$2,0xfefe
move	$20,$0
$L152:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$16,$L149
addu	$25,$5,$22

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$21
addu	$9,$25,$22
addu	$12,$19,$22
move	$11,$19
move	$8,$25
move	$13,$0
$L150:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$4,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$4,$4,2
addu	$2,$5,$6
and	$4,$4,$18
lw	$5,0($11)
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$17
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($11)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$21
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
lw	$3,0($12)
addu	$6,$5,$6
and	$7,$7,$18
addu	$6,$6,$7
xor	$2,$6,$3
and	$2,$2,$17
or	$6,$6,$3
srl	$2,$2,1
addiu	$13,$13,2
subu	$6,$6,$2
slt	$3,$13,$16
sw	$6,0($12)
addu	$8,$8,$14
addu	$11,$11,$14
addu	$9,$9,$14
bne	$3,$0,$L150
addu	$12,$12,$14

addu	$19,$19,$23
addu	$25,$25,$23
$L149:
addiu	$20,$20,1
li	$2,2			# 0x2
beq	$20,$2,$L153
mflo	$2

addu	$5,$25,$fp
b	$L152
addu	$19,$19,$2

$L153:
lw	$fp,36($sp)
lw	$23,32($sp)
lw	$22,28($sp)
lw	$21,24($sp)
lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	avg_pixels8_xy2_c
.align	2
.ent	avg_no_rnd_pixels8_xy2_c
.type	avg_no_rnd_pixels8_xy2_c, @function
avg_no_rnd_pixels8_xy2_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 9/0, args= 0, gp= 0
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
addiu	$3,$7,-1
sw	$22,28($sp)
srl	$3,$3,1
move	$22,$6
nor	$6,$0,$7
mul	$6,$6,$22
addiu	$3,$3,1
li	$2,4			# 0x4
sll	$14,$22,1
sw	$23,32($sp)
mul	$23,$3,$14
mtlo	$2
li	$2,50528256			# 0x3030000
li	$3,16842752			# 0x1010000
ori	$24,$2,0x303
li	$2,-50593792			# 0xfffffffffcfc0000
sw	$21,24($sp)
ori	$15,$2,0xfcfc
ori	$21,$3,0x101
li	$2,-16908288			# 0xfffffffffefe0000
li	$3,252641280			# 0xf0f0000
msub	$7,$22
sw	$fp,36($sp)
sw	$20,20($sp)
sw	$19,16($sp)
sw	$18,12($sp)
sw	$17,8($sp)
sw	$16,4($sp)
move	$19,$4
move	$16,$7
addiu	$fp,$6,4
ori	$18,$3,0xf0f
ori	$17,$2,0xfefe
move	$20,$0
$L159:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$16,$L156
addu	$25,$5,$22

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$21
addu	$9,$25,$22
addu	$12,$19,$22
move	$11,$19
move	$8,$25
move	$13,$0
$L157:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$4,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$4,$4,2
addu	$2,$5,$6
and	$4,$4,$18
lw	$5,0($11)
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$17
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($11)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$21
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
lw	$3,0($12)
addu	$6,$5,$6
and	$7,$7,$18
addu	$6,$6,$7
xor	$2,$6,$3
and	$2,$2,$17
or	$6,$6,$3
srl	$2,$2,1
addiu	$13,$13,2
subu	$6,$6,$2
slt	$3,$13,$16
sw	$6,0($12)
addu	$8,$8,$14
addu	$11,$11,$14
addu	$9,$9,$14
bne	$3,$0,$L157
addu	$12,$12,$14

addu	$19,$19,$23
addu	$25,$25,$23
$L156:
addiu	$20,$20,1
li	$2,2			# 0x2
beq	$20,$2,$L160
mflo	$2

addu	$5,$25,$fp
b	$L159
addu	$19,$19,$2

$L160:
lw	$fp,36($sp)
lw	$23,32($sp)
lw	$22,28($sp)
lw	$21,24($sp)
lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	avg_no_rnd_pixels8_xy2_c
.align	2
.ent	avg_pixels16_c
.type	avg_pixels16_c, @function
avg_pixels16_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
sw	$19,40($sp)
sw	$18,36($sp)
sw	$17,32($sp)
sw	$16,28($sp)
.cprestore	16
move	$16,$4
move	$17,$5
move	$18,$6
.option	pic0
jal	avg_pixels8_c
.option	pic2
move	$19,$7

lw	$28,16($sp)
addiu	$4,$16,8
addiu	$5,$17,8
move	$6,$18
move	$7,$19
lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
.option	pic0
j	avg_pixels8_c
.option	pic2
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	avg_pixels16_c
.align	2
.ent	avg_no_rnd_pixels16_c
.type	avg_no_rnd_pixels16_c, @function
avg_no_rnd_pixels16_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
sw	$19,40($sp)
sw	$18,36($sp)
sw	$17,32($sp)
sw	$16,28($sp)
.cprestore	16
move	$16,$4
move	$17,$5
move	$18,$6
.option	pic0
jal	avg_pixels8_c
.option	pic2
move	$19,$7

lw	$28,16($sp)
addiu	$4,$16,8
addiu	$5,$17,8
move	$6,$18
move	$7,$19
lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
.option	pic0
j	avg_pixels8_c
.option	pic2
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	avg_no_rnd_pixels16_c
.align	2
.ent	put_pixels2_c
.type	put_pixels2_c, @function
put_pixels2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L171
move	$9,$4

move	$8,$0
$L168:
lbu	$2,1($5)
lbu	$3,0($5)
sll	$2,$2,8
addiu	$8,$8,1
or	$2,$2,$3
slt	$4,$8,$7
sh	$2,0($9)
addu	$5,$5,$6
bne	$4,$0,$L168
addu	$9,$9,$6

$L171:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels2_c
.align	2
.ent	put_pixels4_c
.type	put_pixels4_c, @function
put_pixels4_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L177
move	$8,$0

$L174:
lwl	$2,3($5)
addiu	$8,$8,1
lwr	$2,0($5)
slt	$3,$8,$7
sw	$2,0($4)
addu	$5,$5,$6
bne	$3,$0,$L174
addu	$4,$4,$6

$L177:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels4_c
.align	2
.ent	put_pixels8_c
.type	put_pixels8_c, @function
put_pixels8_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L183
move	$8,$4

move	$9,$0
$L180:
lwl	$2,3($5)
addiu	$9,$9,1
lwr	$2,0($5)
slt	$4,$9,$7
sw	$2,0($8)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($8)
bne	$4,$0,$L180
addu	$8,$8,$6

$L183:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels8_c
.align	2
.ent	put_no_rnd_pixels8_c
.type	put_no_rnd_pixels8_c, @function
put_no_rnd_pixels8_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L189
move	$8,$4

move	$9,$0
$L186:
lwl	$2,3($5)
addiu	$9,$9,1
lwr	$2,0($5)
slt	$4,$9,$7
sw	$2,0($8)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($8)
bne	$4,$0,$L186
addu	$8,$8,$6

$L189:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels8_c
.align	2
.ent	put_pixels4_x2_c
.type	put_pixels4_x2_c, @function
put_pixels4_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L195
li	$2,-16908288			# 0xfffffffffefe0000

move	$9,$4
ori	$10,$2,0xfefe
move	$8,$0
$L192:
lwl	$4,3($5)
lwl	$3,4($5)
lwr	$4,0($5)
lwr	$3,1($5)
addiu	$8,$8,1
xor	$2,$3,$4
and	$2,$2,$10
or	$3,$3,$4
srl	$2,$2,1
subu	$3,$3,$2
slt	$4,$8,$7
sw	$3,0($9)
addu	$5,$5,$6
bne	$4,$0,$L192
addu	$9,$9,$6

$L195:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels4_x2_c
.align	2
.ent	put_pixels4_y2_c
.type	put_pixels4_y2_c, @function
put_pixels4_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$13,$4
blez	$7,$L201
move	$12,$5

li	$2,-16908288			# 0xfffffffffefe0000
ori	$11,$2,0xfefe
addu	$10,$5,$6
move	$9,$0
move	$8,$0
$L198:
addu	$2,$12,$8
addu	$3,$10,$8
lwl	$5,3($2)
lwl	$4,3($3)
lwr	$5,0($2)
lwr	$4,0($3)
addiu	$9,$9,1
xor	$2,$4,$5
and	$2,$2,$11
srl	$2,$2,1
or	$4,$4,$5
subu	$4,$4,$2
addu	$3,$13,$8
slt	$2,$9,$7
sw	$4,0($3)
bne	$2,$0,$L198
addu	$8,$8,$6

$L201:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels4_y2_c
.align	2
.ent	put_pixels2_x2_c
.type	put_pixels2_x2_c, @function
put_pixels2_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L207
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$10,$4
ori	$11,$2,0xfefe
move	$9,$0
$L204:
lbu	$5,1($8)
lbu	$2,2($8)
lbu	$3,0($8)
sll	$2,$2,8
sll	$4,$5,8
or	$4,$4,$3
or	$2,$2,$5
xor	$3,$2,$4
and	$3,$3,$11
or	$2,$2,$4
srl	$3,$3,1
addiu	$9,$9,1
subu	$2,$2,$3
slt	$4,$9,$7
sh	$2,0($10)
addu	$8,$8,$6
bne	$4,$0,$L204
addu	$10,$10,$6

$L207:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels2_x2_c
.align	2
.ent	put_pixels2_y2_c
.type	put_pixels2_y2_c, @function
put_pixels2_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$14,$7
move	$15,$4
move	$13,$5
blez	$7,$L213
move	$12,$6

li	$2,-16908288			# 0xfffffffffefe0000
ori	$11,$2,0xfefe
addu	$10,$5,$6
move	$9,$0
move	$8,$0
$L210:
addu	$2,$13,$8
addu	$5,$10,$8
lbu	$4,1($2)
lbu	$3,1($5)
lbu	$6,0($2)
lbu	$7,0($5)
sll	$4,$4,8
sll	$3,$3,8
or	$4,$4,$6
or	$3,$3,$7
xor	$2,$3,$4
and	$2,$2,$11
srl	$2,$2,1
or	$3,$3,$4
addiu	$9,$9,1
subu	$3,$3,$2
addu	$4,$15,$8
slt	$2,$9,$14
sh	$3,0($4)
bne	$2,$0,$L210
addu	$8,$8,$12

$L213:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels2_y2_c
.align	2
.ent	put_pixels2_xy2_c
.type	put_pixels2_xy2_c, @function
put_pixels2_xy2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$15,$4
lbu	$2,1($5)
lbu	$4,0($5)
blez	$7,$L219
lbu	$3,2($5)

addiu	$2,$2,2
addu	$9,$5,$6
addu	$13,$2,$3
addu	$11,$2,$4
addu	$12,$15,$6
sll	$10,$6,1
addu	$8,$9,$6
move	$14,$0
$L216:
lbu	$3,1($9)
lbu	$4,0($9)
lbu	$5,2($9)
addu	$4,$3,$4
addu	$5,$5,$3
addu	$2,$11,$4
addu	$3,$13,$5
sra	$2,$2,2
sra	$3,$3,2
sb	$2,0($15)
sb	$3,1($15)
lbu	$2,1($8)
lbu	$6,0($8)
lbu	$3,2($8)
addiu	$2,$2,2
addu	$13,$2,$3
addu	$11,$2,$6
addu	$4,$11,$4
addu	$5,$13,$5
addiu	$14,$14,2
sra	$4,$4,2
sra	$5,$5,2
slt	$2,$14,$7
sb	$4,0($12)
sb	$5,1($12)
addu	$9,$9,$10
addu	$15,$15,$10
addu	$8,$8,$10
bne	$2,$0,$L216
addu	$12,$12,$10

$L219:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels2_xy2_c
.align	2
.ent	put_pixels4_xy2_c
.type	put_pixels4_xy2_c, @function
put_pixels4_xy2_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
sw	$18,12($sp)
sw	$17,8($sp)
sw	$16,4($sp)
move	$9,$5
lwl	$2,4($9)
lwl	$5,3($5)
move	$18,$7
move	$24,$4
move	$14,$6
lwr	$5,0($9)
blez	$7,$L223
lwr	$2,1($9)

li	$8,50528256			# 0x3030000
li	$7,-50593792			# 0xfffffffffcfc0000
ori	$7,$7,0xfcfc
ori	$8,$8,0x303
and	$6,$2,$7
and	$3,$5,$7
and	$4,$5,$8
and	$2,$2,$8
li	$5,33685504			# 0x2020000
addu	$4,$4,$2
ori	$5,$5,0x202
addu	$10,$9,$14
srl	$6,$6,2
srl	$3,$3,2
li	$2,252641280			# 0xf0f0000
addu	$15,$24,$14
sll	$11,$14,1
addu	$9,$10,$14
addu	$12,$6,$3
addu	$13,$4,$5
move	$25,$7
ori	$16,$2,0xf0f
move	$17,$5
move	$14,$0
$L222:
lwl	$2,3($10)
lwl	$6,4($10)
lwr	$2,0($10)
lwr	$6,1($10)
and	$3,$2,$8
and	$7,$6,$8
addu	$7,$7,$3
and	$6,$6,$25
and	$2,$2,$25
addu	$3,$13,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$3,$3,2
addu	$2,$12,$6
and	$3,$3,$16
addu	$2,$2,$3
sw	$2,0($24)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$8
and	$5,$3,$8
addu	$2,$2,$5
addu	$13,$2,$17
and	$3,$3,$25
and	$4,$4,$25
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$13,$7
addu	$12,$3,$4
srl	$7,$7,2
addu	$6,$12,$6
and	$7,$7,$16
addiu	$14,$14,2
addu	$6,$6,$7
slt	$2,$14,$18
sw	$6,0($15)
addu	$10,$10,$11
addu	$24,$24,$11
addu	$9,$9,$11
bne	$2,$0,$L222
addu	$15,$15,$11

$L223:
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	put_pixels4_xy2_c
.align	2
.ent	put_pixels8_xy2_c
.type	put_pixels8_xy2_c, @function
put_pixels8_xy2_c:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 8/0, args= 0, gp= 0
.mask	0x00ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-32
sw	$21,20($sp)
addiu	$3,$7,-1
move	$21,$6
nor	$6,$0,$7
mul	$6,$6,$21
srl	$3,$3,1
addiu	$3,$3,1
li	$2,4			# 0x4
sll	$14,$21,1
sw	$22,24($sp)
mul	$22,$3,$14
mtlo	$2
li	$3,33685504			# 0x2020000
li	$2,50528256			# 0x3030000
sw	$20,16($sp)
ori	$24,$2,0x303
ori	$20,$3,0x202
li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,252641280			# 0xf0f0000
msub	$7,$21
sw	$23,28($sp)
sw	$19,12($sp)
sw	$18,8($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$7
move	$18,$4
addiu	$23,$6,4
ori	$15,$2,0xfcfc
ori	$16,$3,0xf0f
move	$19,$0
$L229:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$17,$L226
addu	$25,$5,$21

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$20
addu	$9,$25,$21
addu	$13,$18,$21
move	$12,$18
move	$8,$25
move	$11,$0
$L227:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$3,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$3,$3,2
addu	$2,$5,$6
and	$3,$3,$16
addu	$2,$2,$3
sw	$2,0($12)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$20
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
addu	$6,$5,$6
and	$7,$7,$16
addiu	$11,$11,2
addu	$6,$6,$7
slt	$2,$11,$17
sw	$6,0($13)
addu	$8,$8,$14
addu	$12,$12,$14
addu	$9,$9,$14
bne	$2,$0,$L227
addu	$13,$13,$14

addu	$18,$18,$22
addu	$25,$25,$22
$L226:
addiu	$19,$19,1
li	$2,2			# 0x2
beq	$19,$2,$L230
mflo	$2

addu	$5,$25,$23
b	$L229
addu	$18,$18,$2

$L230:
lw	$23,28($sp)
lw	$22,24($sp)
lw	$21,20($sp)
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

.set	macro
.set	reorder
.end	put_pixels8_xy2_c
.align	2
.ent	put_no_rnd_pixels8_xy2_c
.type	put_no_rnd_pixels8_xy2_c, @function
put_no_rnd_pixels8_xy2_c:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 8/0, args= 0, gp= 0
.mask	0x00ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-32
sw	$21,20($sp)
addiu	$3,$7,-1
move	$21,$6
nor	$6,$0,$7
mul	$6,$6,$21
srl	$3,$3,1
addiu	$3,$3,1
li	$2,4			# 0x4
sll	$14,$21,1
sw	$22,24($sp)
mul	$22,$3,$14
mtlo	$2
li	$3,16842752			# 0x1010000
li	$2,50528256			# 0x3030000
sw	$20,16($sp)
ori	$24,$2,0x303
ori	$20,$3,0x101
li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,252641280			# 0xf0f0000
msub	$7,$21
sw	$23,28($sp)
sw	$19,12($sp)
sw	$18,8($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$7
move	$18,$4
addiu	$23,$6,4
ori	$15,$2,0xfcfc
ori	$16,$3,0xf0f
move	$19,$0
$L236:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$17,$L233
addu	$25,$5,$21

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$20
addu	$9,$25,$21
addu	$13,$18,$21
move	$12,$18
move	$8,$25
move	$11,$0
$L234:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$3,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$3,$3,2
addu	$2,$5,$6
and	$3,$3,$16
addu	$2,$2,$3
sw	$2,0($12)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$20
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
addu	$6,$5,$6
and	$7,$7,$16
addiu	$11,$11,2
addu	$6,$6,$7
slt	$2,$11,$17
sw	$6,0($13)
addu	$8,$8,$14
addu	$12,$12,$14
addu	$9,$9,$14
bne	$2,$0,$L234
addu	$13,$13,$14

addu	$18,$18,$22
addu	$25,$25,$22
$L233:
addiu	$19,$19,1
li	$2,2			# 0x2
beq	$19,$2,$L237
mflo	$2

addu	$5,$25,$23
b	$L236
addu	$18,$18,$2

$L237:
lw	$23,28($sp)
lw	$22,24($sp)
lw	$21,20($sp)
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

.set	macro
.set	reorder
.end	put_no_rnd_pixels8_xy2_c
.align	2
.ent	put_pixels16_c
.type	put_pixels16_c, @function
put_pixels16_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L246
move	$11,$4

move	$9,$4
move	$8,$5
move	$10,$0
$L241:
lwl	$2,3($8)
addiu	$10,$10,1
lwr	$2,0($8)
slt	$4,$10,$7
sw	$2,0($9)
lwl	$3,7($8)
lwr	$3,4($8)
addu	$8,$8,$6
sw	$3,4($9)
bne	$4,$0,$L241
addu	$9,$9,$6

addiu	$8,$11,8
addiu	$5,$5,8
move	$9,$0
$L242:
lwl	$2,3($5)
addiu	$9,$9,1
lwr	$2,0($5)
slt	$4,$9,$7
sw	$2,0($8)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($8)
bne	$4,$0,$L242
addu	$8,$8,$6

$L246:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels16_c
.align	2
.ent	put_no_rnd_pixels16_c
.type	put_no_rnd_pixels16_c, @function
put_no_rnd_pixels16_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L254
move	$11,$4

move	$9,$4
move	$8,$5
move	$10,$0
$L249:
lwl	$2,3($8)
addiu	$10,$10,1
lwr	$2,0($8)
slt	$4,$10,$7
sw	$2,0($9)
lwl	$3,7($8)
lwr	$3,4($8)
addu	$8,$8,$6
sw	$3,4($9)
bne	$4,$0,$L249
addu	$9,$9,$6

addiu	$8,$11,8
addiu	$5,$5,8
move	$9,$0
$L250:
lwl	$2,3($5)
addiu	$9,$9,1
lwr	$2,0($5)
slt	$4,$9,$7
sw	$2,0($8)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($8)
bne	$4,$0,$L250
addu	$8,$8,$6

$L254:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels16_c
.align	2
.ent	gmc1_c
.type	gmc1_c, @function
gmc1_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
lw	$3,32($sp)
lw	$8,36($sp)
li	$2,16			# 0x10
subu	$9,$2,$8
subu	$2,$2,$3
sw	$18,12($sp)
sw	$16,4($sp)
mul	$13,$8,$3
mul	$12,$9,$3
sw	$17,8($sp)
move	$18,$7
move	$11,$4
move	$24,$5
move	$16,$6
mul	$8,$8,$2
lw	$14,40($sp)
blez	$7,$L258
mul	$9,$9,$2

addu	$15,$5,$6
move	$10,$15
move	$25,$0
subu	$17,$0,$6
$L257:
lbu	$3,0($10)
lbu	$2,1($10)
mult	$8,$3
lbu	$4,0($24)
madd	$13,$2
lbu	$3,1($24)
mflo	$2
addu	$5,$15,$17
addu	$2,$2,$14
mtlo	$2
madd	$9,$4
addiu	$25,$25,1
madd	$12,$3
slt	$7,$25,$18
mflo	$3
move	$24,$15
sra	$3,$3,8
sb	$3,0($11)
lbu	$4,1($10)
lbu	$2,2($10)
mult	$8,$4
lbu	$6,1($5)
madd	$13,$2
lbu	$3,2($5)
mflo	$2
addu	$15,$15,$16
addu	$2,$2,$14
mtlo	$2
madd	$9,$6
madd	$12,$3
mflo	$3
sra	$3,$3,8
sb	$3,1($11)
lbu	$4,2($10)
lbu	$2,3($10)
mult	$8,$4
lbu	$6,2($5)
madd	$13,$2
lbu	$3,3($5)
mflo	$2
addu	$2,$2,$14
mtlo	$2
madd	$9,$6
madd	$12,$3
mflo	$3
sra	$3,$3,8
sb	$3,2($11)
lbu	$2,3($10)
lbu	$3,4($10)
mult	$8,$2
lbu	$4,3($5)
madd	$13,$3
lbu	$2,4($5)
mflo	$3
addu	$3,$3,$14
mtlo	$3
madd	$9,$4
madd	$12,$2
mflo	$2
sra	$2,$2,8
sb	$2,3($11)
lbu	$4,4($10)
lbu	$3,5($10)
mult	$8,$4
lbu	$6,4($5)
madd	$13,$3
lbu	$2,5($5)
mflo	$3
addu	$3,$3,$14
mtlo	$3
madd	$9,$6
madd	$12,$2
mflo	$2
sra	$2,$2,8
sb	$2,4($11)
lbu	$4,5($10)
lbu	$3,6($10)
mult	$8,$4
lbu	$6,5($5)
madd	$13,$3
lbu	$2,6($5)
mflo	$3
addu	$3,$3,$14
mtlo	$3
madd	$9,$6
madd	$12,$2
mflo	$2
sra	$2,$2,8
sb	$2,5($11)
lbu	$4,6($10)
lbu	$3,7($10)
mult	$8,$4
lbu	$6,6($5)
madd	$13,$3
lbu	$2,7($5)
mflo	$3
addu	$3,$3,$14
mtlo	$3
madd	$9,$6
madd	$12,$2
mflo	$2
sra	$2,$2,8
sb	$2,6($11)
lbu	$3,7($10)
lbu	$2,8($10)
mult	$8,$3
lbu	$4,7($5)
madd	$13,$2
lbu	$3,8($5)
mflo	$2
addu	$10,$10,$16
addu	$2,$2,$14
mtlo	$2
madd	$9,$4
madd	$12,$3
mflo	$3
sra	$3,$3,8
sb	$3,7($11)
bne	$7,$0,$L257
addu	$11,$11,$16

$L258:
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	gmc1_c
.align	2
.globl	ff_gmc_c
.ent	ff_gmc_c
.type	ff_gmc_c, @function
ff_gmc_c:
.set	nomips16
.frame	$sp,56,$31		# vars= 8, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-56
sw	$fp,52($sp)
sw	$23,48($sp)
sw	$22,44($sp)
sw	$21,40($sp)
sw	$20,36($sp)
sw	$19,32($sp)
sw	$18,28($sp)
sw	$17,24($sp)
sw	$16,20($sp)
.cprestore	0
lw	$2,108($sp)
sw	$7,68($sp)
move	$23,$5
move	$18,$6
addiu	$17,$2,-1
blez	$7,$L277
lw	$19,96($sp)

li	$2,1			# 0x1
sll	$7,$2,$19
lw	$2,104($sp)
lw	$13,72($sp)
lw	$12,76($sp)
addiu	$16,$2,-1
move	$22,$4
addiu	$21,$7,-1
sll	$20,$19,1
move	$fp,$0
$L276:
move	$25,$22
move	$24,$22
move	$15,$22
move	$14,$22
b	$L275
move	$11,$0

$L278:
sltu	$2,$5,$17
beq	$2,$0,$L263
and	$9,$6,$21

mul	$2,$5,$18
subu	$5,$7,$9
addu	$3,$2,$4
addu	$6,$23,$3
lbu	$4,0($6)
addu	$3,$3,$18
mul	$8,$4,$5
addu	$3,$23,$3
lbu	$2,0($3)
sw	$8,8($sp)
mul	$8,$2,$5
lbu	$2,1($3)
lw	$3,8($sp)
lbu	$4,1($6)
mtlo	$3
madd	$4,$9
subu	$3,$7,$10
mflo	$4
mul	$5,$2,$9
addu	$2,$5,$8
lw	$5,100($sp)
mtlo	$5
madd	$4,$3
madd	$2,$10
mflo	$2
sra	$2,$2,$20
sb	$2,0($14)
$L264:
addiu	$11,$11,1
li	$2,8			# 0x8
addiu	$25,$25,1
addiu	$24,$24,1
addiu	$15,$15,1
beq	$11,$2,$L274
addiu	$14,$14,1

$L280:
lw	$3,80($sp)
lw	$5,88($sp)
addu	$13,$13,$3
addu	$12,$12,$5
$L275:
sra	$6,$13,16
sra	$4,$6,$19
sra	$2,$12,16
sltu	$3,$4,$16
sra	$5,$2,$19
bne	$3,$0,$L278
and	$10,$2,$21

sltu	$2,$5,$17
beq	$2,$0,$L267
nop

bltz	$4,$L279
slt	$2,$16,$4

movn	$4,$16,$2
mtlo	$4
$L269:
madd	$5,$18
subu	$5,$7,$10
mflo	$3
addiu	$11,$11,1
addu	$3,$23,$3
lbu	$4,0($3)
addu	$3,$3,$18
lbu	$2,0($3)
mult	$4,$5
lw	$3,100($sp)
madd	$2,$10
addiu	$25,$25,1
mflo	$2
mtlo	$3
madd	$2,$7
addiu	$15,$15,1
mflo	$2
addiu	$14,$14,1
sra	$2,$2,$20
sb	$2,0($24)
li	$2,8			# 0x8
bne	$11,$2,$L280
addiu	$24,$24,1

$L274:
lw	$8,68($sp)
addiu	$fp,$fp,1
slt	$2,$fp,$8
beq	$2,$0,$L277
addu	$22,$22,$18

lw	$2,72($sp)
lw	$5,76($sp)
lw	$3,84($sp)
lw	$8,92($sp)
addu	$2,$2,$3
addu	$5,$5,$8
sw	$2,72($sp)
sw	$5,76($sp)
move	$12,$5
b	$L276
move	$13,$2

$L263:
bltz	$5,$L281
move	$3,$17

slt	$2,$17,$5
movz	$3,$5,$2
mul	$2,$3,$18
$L266:
addu	$3,$2,$4
addu	$3,$23,$3
lbu	$5,0($3)
subu	$4,$7,$9
lbu	$2,1($3)
mult	$5,$4
lw	$3,100($sp)
madd	$2,$9
mflo	$2
mtlo	$3
madd	$2,$7
mflo	$2
sra	$2,$2,$20
b	$L264
sb	$2,0($25)

$L267:
bltz	$4,$L282
slt	$2,$16,$4

bltz	$5,$L283
movn	$4,$16,$2

$L272:
slt	$2,$17,$5
move	$3,$17
movz	$3,$5,$2
mul	$2,$3,$18
$L273:
addu	$2,$23,$2
addu	$2,$2,$4
lbu	$3,0($2)
b	$L264
sb	$3,0($15)

$L282:
bgez	$5,$L272
move	$4,$0

$L283:
b	$L273
move	$2,$0

$L279:
b	$L269
mtlo	$0

$L281:
b	$L266
move	$2,$0

$L277:
lw	$fp,52($sp)
lw	$23,48($sp)
lw	$22,44($sp)
lw	$21,40($sp)
lw	$20,36($sp)
lw	$19,32($sp)
lw	$18,28($sp)
lw	$17,24($sp)
lw	$16,20($sp)
j	$31
addiu	$sp,$sp,56

.set	macro
.set	reorder
.end	ff_gmc_c
.align	2
.ent	put_tpel_pixels_mc00_c
.type	put_tpel_pixels_mc00_c, @function
put_tpel_pixels_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$3,$7
li	$2,4			# 0x4
move	$9,$4
move	$8,$5
move	$10,$6
beq	$3,$2,$L287
lw	$7,16($sp)

slt	$2,$3,5
bne	$2,$0,$L300
li	$2,2			# 0x2

li	$2,8			# 0x8
beq	$3,$2,$L288
li	$2,16			# 0x10

beq	$3,$2,$L301
nop

$L305:
j	$31
nop

$L300:
bne	$3,$2,$L304
nop

blez	$7,$L305
move	$5,$0

$L293:
lbu	$2,1($8)
lbu	$3,0($8)
sll	$2,$2,8
addiu	$5,$5,1
or	$2,$2,$3
slt	$4,$5,$7
sh	$2,0($9)
addu	$8,$8,$10
bne	$4,$0,$L293
addu	$9,$9,$10

j	$31
nop

$L301:
.option	pic0
j	put_pixels16_c
nop

.option	pic2
$L287:
blez	$7,$L305
move	$4,$0

$L294:
lwl	$2,3($8)
addiu	$4,$4,1
lwr	$2,0($8)
slt	$3,$4,$7
sw	$2,0($9)
addu	$8,$8,$10
bne	$3,$0,$L294
addu	$9,$9,$10

j	$31
nop

$L288:
blez	$7,$L305
move	$5,$0

$L295:
lwl	$2,3($8)
addiu	$5,$5,1
lwr	$2,0($8)
slt	$4,$5,$7
sw	$2,0($9)
lwl	$3,7($8)
lwr	$3,4($8)
addu	$8,$8,$10
sw	$3,4($9)
bne	$4,$0,$L295
addu	$9,$9,$10

j	$31
nop

$L304:
j	$31
nop

.set	macro
.set	reorder
.end	put_tpel_pixels_mc00_c
.align	2
.ent	put_tpel_pixels_mc10_c
.type	put_tpel_pixels_mc10_c, @function
put_tpel_pixels_mc10_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,16($sp)
blez	$14,$L313
move	$15,$4

move	$12,$0
move	$11,$0
li	$13,683			# 0x2ab
$L308:
blez	$7,$L310
addu	$10,$15,$11

addu	$9,$5,$11
move	$8,$0
$L309:
lbu	$2,1($9)
lbu	$3,0($9)
addiu	$2,$2,1
sll	$3,$3,1
addu	$2,$2,$3
mul	$2,$2,$13
addu	$4,$10,$8
addiu	$8,$8,1
sra	$2,$2,11
slt	$3,$8,$7
sb	$2,0($4)
bne	$3,$0,$L309
addiu	$9,$9,1

$L310:
addiu	$12,$12,1
slt	$2,$12,$14
bne	$2,$0,$L308
addu	$11,$11,$6

$L313:
j	$31
nop

.set	macro
.set	reorder
.end	put_tpel_pixels_mc10_c
.align	2
.ent	put_tpel_pixels_mc20_c
.type	put_tpel_pixels_mc20_c, @function
put_tpel_pixels_mc20_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,16($sp)
blez	$14,$L321
move	$15,$4

move	$12,$0
move	$11,$0
li	$13,683			# 0x2ab
$L316:
blez	$7,$L318
addu	$10,$15,$11

addu	$9,$5,$11
move	$8,$0
$L317:
lbu	$2,0($9)
lbu	$3,1($9)
addiu	$2,$2,1
sll	$3,$3,1
addu	$2,$2,$3
mul	$2,$2,$13
addu	$4,$10,$8
addiu	$8,$8,1
sra	$2,$2,11
slt	$3,$8,$7
sb	$2,0($4)
bne	$3,$0,$L317
addiu	$9,$9,1

$L318:
addiu	$12,$12,1
slt	$2,$12,$14
bne	$2,$0,$L316
addu	$11,$11,$6

$L321:
j	$31
nop

.set	macro
.set	reorder
.end	put_tpel_pixels_mc20_c
.align	2
.ent	put_tpel_pixels_mc01_c
.type	put_tpel_pixels_mc01_c, @function
put_tpel_pixels_mc01_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$25,16($sp)
blez	$25,$L330
move	$24,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$15,683			# 0x2ab
$L324:
addu	$11,$24,$12
blez	$7,$L327
addu	$10,$5,$12

move	$9,$14
move	$8,$0
$L325:
addu	$3,$10,$8
lbu	$4,0($3)
lbu	$2,0($9)
sll	$4,$4,1
addiu	$2,$2,1
addu	$2,$2,$4
mul	$2,$2,$15
addu	$4,$11,$8
addiu	$8,$8,1
sra	$2,$2,11
slt	$3,$8,$7
sb	$2,0($4)
bne	$3,$0,$L325
addiu	$9,$9,1

$L327:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L324
addu	$12,$12,$6

$L330:
j	$31
nop

.set	macro
.set	reorder
.end	put_tpel_pixels_mc01_c
.align	2
.ent	put_tpel_pixels_mc11_c
.type	put_tpel_pixels_mc11_c, @function
put_tpel_pixels_mc11_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$25,24($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$5
blez	$25,$L336
move	$16,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,10924			# 0x2aac
li	$15,5462			# 0x1556
$L333:
blez	$7,$L335
addu	$11,$16,$12

addu	$10,$17,$12
move	$9,$14
move	$8,$0
$L334:
lbu	$3,1($10)
lbu	$4,0($10)
sll	$2,$3,13
addu	$2,$2,$3
mul	$3,$4,$24
lbu	$5,0($9)
addu	$4,$3,$2
lbu	$3,1($9)
addiu	$4,$4,16386
mul	$2,$3,$15
addiu	$10,$10,1
addu	$3,$2,$4
sll	$2,$5,13
addu	$2,$2,$5
addu	$3,$3,$2
addu	$4,$11,$8
addiu	$8,$8,1
sra	$3,$3,15
slt	$2,$8,$7
sb	$3,0($4)
bne	$2,$0,$L334
addiu	$9,$9,1

$L335:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L333
addu	$12,$12,$6

$L336:
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_tpel_pixels_mc11_c
.align	2
.ent	put_tpel_pixels_mc12_c
.type	put_tpel_pixels_mc12_c, @function
put_tpel_pixels_mc12_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$25,24($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$5
blez	$25,$L343
move	$16,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,5462			# 0x1556
li	$15,10924			# 0x2aac
$L340:
blez	$7,$L342
addu	$11,$16,$12

addu	$10,$17,$12
move	$9,$14
move	$8,$0
$L341:
lbu	$4,0($10)
lbu	$3,1($10)
sll	$2,$4,13
addu	$2,$2,$4
mul	$4,$3,$24
lbu	$5,1($9)
addu	$3,$4,$2
lbu	$2,0($9)
sll	$4,$5,13
addu	$4,$4,$5
addiu	$3,$3,16386
addu	$3,$3,$4
mul	$4,$2,$15
addiu	$10,$10,1
addu	$2,$4,$3
addu	$4,$11,$8
addiu	$8,$8,1
sra	$2,$2,15
slt	$3,$8,$7
sb	$2,0($4)
bne	$3,$0,$L341
addiu	$9,$9,1

$L342:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L340
addu	$12,$12,$6

$L343:
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_tpel_pixels_mc12_c
.align	2
.ent	put_tpel_pixels_mc02_c
.type	put_tpel_pixels_mc02_c, @function
put_tpel_pixels_mc02_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$25,16($sp)
blez	$25,$L353
move	$24,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$15,683			# 0x2ab
$L347:
addu	$11,$24,$12
blez	$7,$L350
addu	$10,$5,$12

move	$9,$14
move	$8,$0
$L348:
addu	$4,$10,$8
lbu	$2,0($4)
lbu	$3,0($9)
addiu	$2,$2,1
sll	$3,$3,1
addu	$2,$2,$3
mul	$2,$2,$15
addu	$4,$11,$8
addiu	$8,$8,1
sra	$2,$2,11
slt	$3,$8,$7
sb	$2,0($4)
bne	$3,$0,$L348
addiu	$9,$9,1

$L350:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L347
addu	$12,$12,$6

$L353:
j	$31
nop

.set	macro
.set	reorder
.end	put_tpel_pixels_mc02_c
.align	2
.ent	put_tpel_pixels_mc21_c
.type	put_tpel_pixels_mc21_c, @function
put_tpel_pixels_mc21_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$25,24($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$5
blez	$25,$L359
move	$16,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,10924			# 0x2aac
li	$15,5462			# 0x1556
$L356:
blez	$7,$L358
addu	$11,$16,$12

addu	$10,$17,$12
move	$9,$14
move	$8,$0
$L357:
lbu	$4,0($10)
lbu	$3,1($10)
sll	$2,$4,13
addu	$2,$2,$4
mul	$4,$3,$24
lbu	$5,1($9)
addu	$3,$4,$2
lbu	$2,0($9)
sll	$4,$5,13
addu	$4,$4,$5
addiu	$3,$3,16386
addu	$3,$3,$4
mul	$4,$2,$15
addiu	$10,$10,1
addu	$2,$4,$3
addu	$4,$11,$8
addiu	$8,$8,1
sra	$2,$2,15
slt	$3,$8,$7
sb	$2,0($4)
bne	$3,$0,$L357
addiu	$9,$9,1

$L358:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L356
addu	$12,$12,$6

$L359:
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_tpel_pixels_mc21_c
.align	2
.ent	put_tpel_pixels_mc22_c
.type	put_tpel_pixels_mc22_c, @function
put_tpel_pixels_mc22_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$25,24($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$5
blez	$25,$L366
move	$16,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,5462			# 0x1556
li	$15,10924			# 0x2aac
$L363:
blez	$7,$L365
addu	$11,$16,$12

addu	$10,$17,$12
move	$9,$14
move	$8,$0
$L364:
lbu	$3,1($10)
lbu	$4,0($10)
sll	$2,$3,13
addu	$2,$2,$3
mul	$3,$4,$24
lbu	$5,0($9)
addu	$4,$3,$2
lbu	$3,1($9)
addiu	$4,$4,16386
mul	$2,$3,$15
addiu	$10,$10,1
addu	$3,$2,$4
sll	$2,$5,13
addu	$2,$2,$5
addu	$3,$3,$2
addu	$4,$11,$8
addiu	$8,$8,1
sra	$3,$3,15
slt	$2,$8,$7
sb	$3,0($4)
bne	$2,$0,$L364
addiu	$9,$9,1

$L365:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L363
addu	$12,$12,$6

$L366:
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_tpel_pixels_mc22_c
.align	2
.ent	avg_tpel_pixels_mc00_c
.type	avg_tpel_pixels_mc00_c, @function
avg_tpel_pixels_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

li	$2,4			# 0x4
move	$9,$4
move	$8,$5
move	$10,$6
beq	$7,$2,$L371
lw	$11,16($sp)

slt	$2,$7,5
bne	$2,$0,$L381
li	$2,2			# 0x2

li	$2,8			# 0x8
beq	$7,$2,$L372
li	$2,16			# 0x10

beq	$7,$2,$L382
nop

$L385:
j	$31
nop

$L381:
bne	$7,$2,$L384
nop

blez	$11,$L385
li	$2,-16908288			# 0xfffffffffefe0000

ori	$7,$2,0xfefe
move	$6,$0
$L376:
lbu	$2,1($8)
lbu	$4,0($8)
lhu	$5,0($9)
sll	$2,$2,8
or	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$7
srl	$3,$3,1
addiu	$6,$6,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$6,$11
sh	$2,0($9)
addu	$8,$8,$10
bne	$4,$0,$L376
addu	$9,$9,$10

j	$31
nop

$L382:
.option	pic0
j	avg_pixels16_c
.option	pic2
move	$7,$11

$L371:
blez	$11,$L385
li	$2,-16908288			# 0xfffffffffefe0000

ori	$6,$2,0xfefe
move	$5,$0
$L377:
lwl	$3,3($8)
lw	$4,0($9)
lwr	$3,0($8)
addiu	$5,$5,1
xor	$2,$3,$4
and	$2,$2,$6
or	$3,$3,$4
srl	$2,$2,1
subu	$3,$3,$2
slt	$4,$5,$11
sw	$3,0($9)
addu	$8,$8,$10
bne	$4,$0,$L377
addu	$9,$9,$10

j	$31
nop

$L372:
.option	pic0
j	avg_pixels8_c
.option	pic2
move	$7,$11

$L384:
j	$31
nop

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc00_c
.align	2
.ent	avg_tpel_pixels_mc10_c
.type	avg_tpel_pixels_mc10_c, @function
avg_tpel_pixels_mc10_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,16($sp)
blez	$14,$L393
move	$12,$0

move	$11,$0
li	$13,683			# 0x2ab
$L388:
blez	$7,$L390
nop

addu	$9,$4,$11
addu	$8,$5,$11
move	$10,$0
$L389:
lbu	$3,1($8)
lbu	$2,0($8)
addiu	$3,$3,1
sll	$2,$2,1
addu	$3,$3,$2
mul	$3,$3,$13
lbu	$2,0($9)
sra	$3,$3,11
addiu	$2,$2,1
addu	$2,$2,$3
addiu	$10,$10,1
sra	$2,$2,1
slt	$3,$10,$7
sb	$2,0($9)
addiu	$8,$8,1
bne	$3,$0,$L389
addiu	$9,$9,1

$L390:
addiu	$12,$12,1
slt	$2,$12,$14
bne	$2,$0,$L388
addu	$11,$11,$6

$L393:
j	$31
nop

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc10_c
.align	2
.ent	avg_tpel_pixels_mc20_c
.type	avg_tpel_pixels_mc20_c, @function
avg_tpel_pixels_mc20_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,16($sp)
blez	$14,$L401
move	$12,$0

move	$11,$0
li	$13,683			# 0x2ab
$L396:
blez	$7,$L398
nop

addu	$9,$4,$11
addu	$8,$5,$11
move	$10,$0
$L397:
lbu	$3,0($8)
lbu	$2,1($8)
addiu	$3,$3,1
sll	$2,$2,1
addu	$3,$3,$2
mul	$3,$3,$13
lbu	$2,0($9)
sra	$3,$3,11
addiu	$2,$2,1
addu	$2,$2,$3
addiu	$10,$10,1
sra	$2,$2,1
slt	$3,$10,$7
sb	$2,0($9)
addiu	$8,$8,1
bne	$3,$0,$L397
addiu	$9,$9,1

$L398:
addiu	$12,$12,1
slt	$2,$12,$14
bne	$2,$0,$L396
addu	$11,$11,$6

$L401:
j	$31
nop

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc20_c
.align	2
.ent	avg_tpel_pixels_mc01_c
.type	avg_tpel_pixels_mc01_c, @function
avg_tpel_pixels_mc01_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$24,16($sp)
blez	$24,$L409
move	$25,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$15,683			# 0x2ab
$L404:
blez	$7,$L406
addu	$11,$5,$12

addu	$9,$25,$12
move	$10,$14
move	$8,$0
$L405:
addu	$3,$11,$8
lbu	$4,0($3)
lbu	$2,0($10)
sll	$4,$4,1
addiu	$2,$2,1
addu	$2,$2,$4
mul	$2,$2,$15
lbu	$3,0($9)
sra	$2,$2,11
addiu	$3,$3,1
addu	$3,$3,$2
addiu	$8,$8,1
sra	$3,$3,1
slt	$2,$8,$7
sb	$3,0($9)
addiu	$10,$10,1
bne	$2,$0,$L405
addiu	$9,$9,1

$L406:
addiu	$13,$13,1
slt	$2,$13,$24
addu	$14,$14,$6
bne	$2,$0,$L404
addu	$12,$12,$6

$L409:
j	$31
nop

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc01_c
.align	2
.ent	avg_tpel_pixels_mc11_c
.type	avg_tpel_pixels_mc11_c, @function
avg_tpel_pixels_mc11_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
sw	$16,4($sp)
lw	$16,32($sp)
sw	$18,12($sp)
sw	$17,8($sp)
move	$18,$4
move	$17,$5
blez	$16,$L415
move	$25,$6

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,10924			# 0x2aac
li	$15,5462			# 0x1556
$L412:
blez	$7,$L414
nop

addu	$10,$18,$12
addu	$9,$17,$12
move	$8,$14
move	$11,$0
$L413:
lbu	$3,1($9)
lbu	$5,0($9)
sll	$2,$3,13
addu	$2,$2,$3
mul	$3,$5,$24
lbu	$6,0($8)
addu	$5,$3,$2
lbu	$3,1($8)
addiu	$5,$5,16386
mul	$2,$3,$15
sll	$4,$6,13
addu	$3,$2,$5
addu	$4,$4,$6
lbu	$2,0($10)
addu	$3,$3,$4
sra	$3,$3,15
addiu	$2,$2,1
addu	$2,$2,$3
addiu	$11,$11,1
sra	$2,$2,1
slt	$3,$11,$7
sb	$2,0($10)
addiu	$9,$9,1
addiu	$10,$10,1
bne	$3,$0,$L413
addiu	$8,$8,1

$L414:
addiu	$13,$13,1
slt	$2,$13,$16
addu	$14,$14,$25
bne	$2,$0,$L412
addu	$12,$12,$25

$L415:
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc11_c
.align	2
.ent	avg_tpel_pixels_mc12_c
.type	avg_tpel_pixels_mc12_c, @function
avg_tpel_pixels_mc12_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$25,24($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$4
blez	$25,$L422
move	$16,$5

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,5462			# 0x1556
li	$15,10924			# 0x2aac
$L419:
blez	$7,$L421
nop

addu	$10,$17,$12
addu	$9,$16,$12
move	$8,$14
move	$11,$0
$L420:
lbu	$4,0($9)
lbu	$3,1($9)
sll	$2,$4,13
addu	$2,$2,$4
mul	$4,$3,$24
lbu	$5,1($8)
addu	$3,$4,$2
sll	$4,$5,13
addu	$4,$4,$5
lbu	$5,0($8)
addiu	$3,$3,16386
mul	$2,$5,$15
addu	$3,$3,$4
addu	$5,$2,$3
lbu	$2,0($10)
sra	$5,$5,15
addiu	$2,$2,1
addu	$2,$2,$5
addiu	$11,$11,1
sra	$2,$2,1
slt	$3,$11,$7
sb	$2,0($10)
addiu	$9,$9,1
addiu	$10,$10,1
bne	$3,$0,$L420
addiu	$8,$8,1

$L421:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L419
addu	$12,$12,$6

$L422:
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc12_c
.align	2
.ent	avg_tpel_pixels_mc02_c
.type	avg_tpel_pixels_mc02_c, @function
avg_tpel_pixels_mc02_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$24,16($sp)
blez	$24,$L431
move	$25,$4

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$15,683			# 0x2ab
$L426:
blez	$7,$L428
addu	$11,$5,$12

addu	$9,$25,$12
move	$10,$14
move	$8,$0
$L427:
addu	$4,$11,$8
lbu	$2,0($10)
lbu	$3,0($4)
sll	$2,$2,1
addiu	$3,$3,1
addu	$3,$3,$2
mul	$3,$3,$15
lbu	$2,0($9)
sra	$3,$3,11
addiu	$2,$2,1
addu	$2,$2,$3
addiu	$8,$8,1
sra	$2,$2,1
slt	$3,$8,$7
sb	$2,0($9)
addiu	$10,$10,1
bne	$3,$0,$L427
addiu	$9,$9,1

$L428:
addiu	$13,$13,1
slt	$2,$13,$24
addu	$14,$14,$6
bne	$2,$0,$L426
addu	$12,$12,$6

$L431:
j	$31
nop

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc02_c
.align	2
.ent	avg_tpel_pixels_mc21_c
.type	avg_tpel_pixels_mc21_c, @function
avg_tpel_pixels_mc21_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$25,24($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$4
blez	$25,$L437
move	$16,$5

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,10924			# 0x2aac
li	$15,5462			# 0x1556
$L434:
blez	$7,$L436
nop

addu	$10,$17,$12
addu	$9,$16,$12
move	$8,$14
move	$11,$0
$L435:
lbu	$4,0($9)
lbu	$3,1($9)
sll	$2,$4,13
addu	$2,$2,$4
mul	$4,$3,$24
lbu	$5,1($8)
addu	$3,$4,$2
sll	$4,$5,13
addu	$4,$4,$5
lbu	$5,0($8)
addiu	$3,$3,16386
mul	$2,$5,$15
addu	$3,$3,$4
addu	$5,$2,$3
lbu	$2,0($10)
sra	$5,$5,15
addiu	$2,$2,1
addu	$2,$2,$5
addiu	$11,$11,1
sra	$2,$2,1
slt	$3,$11,$7
sb	$2,0($10)
addiu	$9,$9,1
addiu	$10,$10,1
bne	$3,$0,$L435
addiu	$8,$8,1

$L436:
addiu	$13,$13,1
slt	$2,$13,$25
addu	$14,$14,$6
bne	$2,$0,$L434
addu	$12,$12,$6

$L437:
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc21_c
.align	2
.ent	avg_tpel_pixels_mc22_c
.type	avg_tpel_pixels_mc22_c, @function
avg_tpel_pixels_mc22_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
sw	$16,4($sp)
lw	$16,32($sp)
sw	$18,12($sp)
sw	$17,8($sp)
move	$18,$4
move	$17,$5
blez	$16,$L444
move	$25,$6

addu	$14,$5,$6
move	$13,$0
move	$12,$0
li	$24,5462			# 0x1556
li	$15,10924			# 0x2aac
$L441:
blez	$7,$L443
nop

addu	$10,$18,$12
addu	$9,$17,$12
move	$8,$14
move	$11,$0
$L442:
lbu	$3,1($9)
lbu	$5,0($9)
sll	$2,$3,13
addu	$2,$2,$3
mul	$3,$5,$24
lbu	$6,0($8)
addu	$5,$3,$2
lbu	$3,1($8)
addiu	$5,$5,16386
mul	$2,$3,$15
sll	$4,$6,13
addu	$3,$2,$5
addu	$4,$4,$6
lbu	$2,0($10)
addu	$3,$3,$4
sra	$3,$3,15
addiu	$2,$2,1
addu	$2,$2,$3
addiu	$11,$11,1
sra	$2,$2,1
slt	$3,$11,$7
sb	$2,0($10)
addiu	$9,$9,1
addiu	$10,$10,1
bne	$3,$0,$L442
addiu	$8,$8,1

$L443:
addiu	$13,$13,1
slt	$2,$13,$16
addu	$14,$14,$25
bne	$2,$0,$L441
addu	$12,$12,$25

$L444:
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	avg_tpel_pixels_mc22_c
.align	2
.ent	put_mpeg4_qpel8_h_lowpass
.type	put_mpeg4_qpel8_h_lowpass, @function
put_mpeg4_qpel8_h_lowpass:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
.mask	0x00010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$24,24($sp)
sw	$16,4($sp)
move	$12,$4
move	$11,$5
move	$25,$6
blez	$24,$L449
move	$16,$7

lui	$2,%hi(ff_cropTbl+1024)
addiu	$13,$2,%lo(ff_cropTbl+1024)
move	$14,$0
li	$15,16			# 0x10
$L448:
lbu	$8,1($11)
lbu	$4,0($11)
lbu	$2,4($11)
lbu	$7,2($11)
lbu	$5,3($11)
addu	$3,$8,$4
subu	$2,$0,$2
addu	$4,$7,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addiu	$14,$14,1
sb	$3,0($12)
lbu	$7,1($11)
lbu	$2,5($11)
lbu	$3,2($11)
lbu	$8,0($11)
lbu	$4,3($11)
lbu	$5,4($11)
addu	$3,$3,$7
subu	$2,$0,$2
addu	$4,$4,$8
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$4,0($2)
slt	$10,$14,$24
sb	$4,1($12)
lbu	$2,2($11)
lbu	$3,3($11)
lbu	$8,0($11)
lbu	$6,1($11)
lbu	$4,4($11)
lbu	$9,6($11)
lbu	$5,5($11)
addu	$3,$3,$2
sll	$7,$3,4
addu	$4,$4,$6
subu	$2,$15,$8
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$7
sll	$6,$4,3
subu	$2,$2,$9
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,2($12)
lbu	$3,3($11)
lbu	$4,4($11)
lbu	$7,2($11)
lbu	$2,0($11)
lbu	$5,5($11)
lbu	$8,1($11)
lbu	$9,7($11)
lbu	$6,6($11)
addu	$4,$4,$3
sll	$3,$4,4
addu	$5,$5,$7
subu	$2,$15,$2
sll	$4,$4,2
addu	$6,$6,$8
addu	$4,$4,$3
sll	$7,$5,3
subu	$2,$2,$9
sll	$5,$5,1
subu	$5,$5,$7
addu	$2,$2,$4
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$5
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,3($12)
lbu	$5,4($11)
lbu	$2,8($11)
lbu	$3,5($11)
lbu	$8,1($11)
lbu	$6,3($11)
lbu	$4,6($11)
lbu	$7,2($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,7($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,4($12)
lbu	$5,5($11)
lbu	$2,2($11)
lbu	$3,6($11)
lbu	$6,8($11)
lbu	$7,4($11)
lbu	$4,7($11)
lbu	$8,3($11)
addu	$3,$3,$5
subu	$2,$0,$2
addu	$4,$4,$7
sll	$5,$3,4
subu	$2,$2,$6
sll	$3,$3,2
addu	$6,$6,$8
addu	$3,$3,$5
addiu	$2,$2,16
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,5($12)
lbu	$7,7($11)
lbu	$2,3($11)
lbu	$3,6($11)
lbu	$8,8($11)
lbu	$4,5($11)
lbu	$5,4($11)
addu	$3,$7,$3
subu	$2,$0,$2
addu	$4,$8,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,6($12)
lbu	$8,7($11)
lbu	$4,8($11)
lbu	$2,4($11)
lbu	$7,6($11)
lbu	$5,5($11)
addu	$3,$4,$8
subu	$2,$0,$2
sll	$6,$3,4
addu	$4,$7,$4
subu	$2,$2,$7
sll	$3,$3,2
addu	$3,$3,$6
addu	$5,$5,$8
sll	$6,$4,3
addiu	$2,$2,16
sll	$4,$4,1
addu	$2,$2,$3
subu	$4,$4,$6
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addu	$11,$11,$16
sb	$3,7($12)
bne	$10,$0,$L448
addu	$12,$12,$25

$L449:
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_mpeg4_qpel8_h_lowpass
.align	2
.ent	put_mpeg4_qpel8_v_lowpass
.type	put_mpeg4_qpel8_v_lowpass, @function
put_mpeg4_qpel8_v_lowpass:
.set	nomips16
.frame	$sp,96,$31		# vars= 48, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-96
sw	$fp,92($sp)
sw	$23,88($sp)
sw	$22,84($sp)
sw	$21,80($sp)
sw	$20,76($sp)
sw	$19,72($sp)
sw	$18,68($sp)
sw	$17,64($sp)
sw	$16,60($sp)
.cprestore	0
sll	$9,$7,1
move	$25,$5
sll	$8,$7,3
sll	$10,$6,1
sll	$14,$7,2
addu	$2,$9,$7
sll	$16,$6,2
sll	$3,$6,3
move	$19,$4
subu	$11,$8,$9
subu	$12,$8,$7
subu	$15,$3,$6
addu	$5,$14,$7
addu	$2,$25,$2
addu	$13,$16,$6
subu	$3,$3,$10
addu	$4,$10,$6
sw	$2,40($sp)
addu	$5,$25,$5
addu	$11,$25,$11
addu	$12,$25,$12
addu	$8,$25,$8
addu	$4,$19,$4
addu	$13,$19,$13
addu	$3,$19,$3
addu	$15,$19,$15
lui	$2,%hi(ff_cropTbl+1024)
addu	$7,$25,$7
addu	$9,$25,$9
sw	$5,36($sp)
sw	$11,32($sp)
sw	$12,28($sp)
sw	$8,24($sp)
sw	$4,20($sp)
sw	$13,16($sp)
sw	$3,12($sp)
sw	$15,8($sp)
addiu	$24,$2,%lo(ff_cropTbl+1024)
sw	$7,48($sp)
sw	$9,44($sp)
addu	$fp,$25,$14
addu	$23,$19,$6
addu	$22,$19,$10
addu	$21,$19,$16
move	$20,$0
$L452:
lw	$2,48($sp)
lw	$3,44($sp)
lbu	$16,0($fp)
lbu	$8,0($2)
lbu	$10,0($25)
lw	$4,40($sp)
lbu	$13,0($3)
lbu	$15,0($4)
lw	$6,36($sp)
addu	$3,$8,$10
subu	$2,$0,$16
sll	$5,$3,4
addu	$4,$13,$10
subu	$2,$2,$13
sll	$3,$3,2
lbu	$18,0($6)
addu	$7,$15,$8
addu	$3,$3,$5
addiu	$2,$2,16
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$5,$7,1
addu	$6,$13,$8
addu	$5,$5,$7
addu	$2,$2,$4
subu	$3,$0,$18
addu	$4,$15,$10
sll	$7,$6,4
subu	$3,$3,$8
addu	$2,$2,$5
sll	$6,$6,2
sll	$5,$4,3
sll	$4,$4,1
addu	$6,$6,$7
subu	$4,$4,$5
addiu	$3,$3,16
lw	$5,32($sp)
addu	$7,$16,$10
addu	$3,$3,$6
lbu	$14,0($5)
addu	$6,$15,$13
sll	$5,$7,1
addu	$3,$3,$4
li	$4,16			# 0x10
subu	$9,$4,$10
addu	$5,$5,$7
sll	$7,$6,4
sll	$6,$6,2
addu	$6,$6,$7
addu	$3,$3,$5
subu	$5,$9,$14
addu	$5,$5,$6
sra	$2,$2,5
lw	$6,28($sp)
addu	$4,$16,$8
addu	$2,$24,$2
lbu	$11,0($6)
lbu	$12,0($2)
lw	$6,24($sp)
addu	$10,$18,$10
sll	$2,$4,3
sll	$4,$4,1
subu	$4,$4,$2
addu	$7,$16,$15
sll	$2,$10,1
addu	$2,$2,$10
addu	$5,$5,$4
lbu	$10,0($6)
sll	$4,$7,4
addu	$6,$18,$13
sra	$3,$3,5
sll	$7,$7,2
sb	$12,0($19)
addu	$7,$7,$4
addu	$12,$14,$8
addu	$3,$24,$3
addu	$5,$5,$2
subu	$9,$9,$11
sll	$2,$6,3
sll	$6,$6,1
lbu	$17,0($3)
subu	$6,$6,$2
addu	$9,$9,$7
sll	$4,$12,1
addu	$7,$18,$16
subu	$3,$0,$10
addu	$4,$4,$12
addu	$9,$9,$6
addu	$2,$14,$15
sll	$6,$7,4
sra	$5,$5,5
sll	$7,$7,2
sb	$17,0($23)
addu	$7,$7,$6
addu	$5,$24,$5
addu	$6,$11,$13
subu	$8,$3,$8
addu	$9,$9,$4
sll	$4,$2,3
sll	$2,$2,1
lbu	$12,0($5)
subu	$2,$2,$4
addu	$5,$14,$18
sll	$4,$6,1
addiu	$8,$8,16
addu	$4,$4,$6
addu	$8,$8,$7
sll	$6,$5,4
sra	$9,$9,5
subu	$3,$3,$13
sll	$5,$5,2
sb	$12,0($22)
addu	$5,$5,$6
addu	$8,$8,$2
addu	$9,$24,$9
addu	$2,$11,$16
addiu	$3,$3,16
lbu	$12,0($9)
addu	$8,$8,$4
addu	$3,$3,$5
sll	$4,$2,3
lw	$5,20($sp)
sll	$2,$2,1
addu	$9,$10,$15
subu	$2,$2,$4
addu	$7,$11,$14
subu	$4,$0,$11
sb	$12,0($5)
sll	$6,$9,1
addu	$5,$10,$18
addu	$3,$3,$2
sra	$8,$8,5
sll	$2,$7,4
subu	$4,$4,$15
sll	$7,$7,2
addu	$6,$6,$9
addu	$7,$7,$2
addu	$8,$24,$8
sll	$2,$5,3
addiu	$4,$4,16
sll	$5,$5,1
lbu	$9,0($8)
subu	$5,$5,$2
addu	$8,$10,$16
addu	$3,$3,$6
addu	$4,$4,$7
addu	$6,$10,$11
subu	$2,$0,$14
addu	$4,$4,$5
sra	$3,$3,5
sll	$5,$6,4
sll	$7,$8,1
subu	$2,$2,$16
sll	$6,$6,2
sb	$9,0($21)
addu	$6,$6,$5
addu	$10,$10,$14
addu	$7,$7,$8
addu	$3,$24,$3
addiu	$2,$2,16
addu	$11,$11,$18
addu	$4,$4,$7
addu	$2,$2,$6
lbu	$7,0($3)
lw	$6,16($sp)
sll	$3,$10,3
sll	$10,$10,1
subu	$10,$10,$3
sra	$4,$4,5
sll	$3,$11,1
sb	$7,0($6)
addu	$3,$3,$11
addu	$4,$24,$4
addu	$2,$2,$10
lbu	$5,0($4)
addu	$2,$2,$3
lw	$3,12($sp)
sra	$2,$2,5
sb	$5,0($3)
addu	$2,$24,$2
lbu	$3,0($2)
lw	$4,8($sp)
addiu	$20,$20,1
sb	$3,0($4)
lw	$5,48($sp)
lw	$6,44($sp)
addiu	$5,$5,1
lw	$2,40($sp)
lw	$3,36($sp)
lw	$4,32($sp)
sw	$5,48($sp)
lw	$5,28($sp)
addiu	$6,$6,1
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
sw	$6,44($sp)
lw	$6,24($sp)
sw	$2,40($sp)
sw	$3,36($sp)
lw	$2,20($sp)
lw	$3,16($sp)
sw	$4,32($sp)
sw	$5,28($sp)
lw	$4,12($sp)
lw	$5,8($sp)
addiu	$6,$6,1
sw	$6,24($sp)
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
li	$6,8			# 0x8
addiu	$19,$19,1
addiu	$25,$25,1
addiu	$fp,$fp,1
addiu	$23,$23,1
addiu	$22,$22,1
sw	$2,20($sp)
addiu	$21,$21,1
sw	$3,16($sp)
sw	$4,12($sp)
bne	$20,$6,$L452
sw	$5,8($sp)

lw	$fp,92($sp)
lw	$23,88($sp)
lw	$22,84($sp)
lw	$21,80($sp)
lw	$20,76($sp)
lw	$19,72($sp)
lw	$18,68($sp)
lw	$17,64($sp)
lw	$16,60($sp)
j	$31
addiu	$sp,$sp,96

.set	macro
.set	reorder
.end	put_mpeg4_qpel8_v_lowpass
.align	2
.ent	put_mpeg4_qpel16_h_lowpass
.type	put_mpeg4_qpel16_h_lowpass, @function
put_mpeg4_qpel16_h_lowpass:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
.mask	0x00010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$24,24($sp)
sw	$16,4($sp)
move	$12,$4
move	$11,$5
move	$25,$6
blez	$24,$L458
move	$16,$7

lui	$2,%hi(ff_cropTbl+1024)
addiu	$13,$2,%lo(ff_cropTbl+1024)
move	$14,$0
li	$15,16			# 0x10
$L457:
lbu	$8,1($11)
lbu	$4,0($11)
lbu	$2,4($11)
lbu	$7,2($11)
lbu	$5,3($11)
addu	$3,$8,$4
subu	$2,$0,$2
addu	$4,$7,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addiu	$14,$14,1
sb	$3,0($12)
lbu	$7,1($11)
lbu	$2,5($11)
lbu	$3,2($11)
lbu	$8,0($11)
lbu	$4,3($11)
lbu	$5,4($11)
addu	$3,$3,$7
subu	$2,$0,$2
addu	$4,$4,$8
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$4,0($2)
slt	$10,$14,$24
sb	$4,1($12)
lbu	$2,2($11)
lbu	$3,3($11)
lbu	$8,0($11)
lbu	$6,1($11)
lbu	$4,4($11)
lbu	$9,6($11)
lbu	$5,5($11)
addu	$3,$3,$2
sll	$7,$3,4
addu	$4,$4,$6
subu	$2,$15,$8
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$7
sll	$6,$4,3
subu	$2,$2,$9
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,2($12)
lbu	$3,3($11)
lbu	$4,4($11)
lbu	$7,2($11)
lbu	$2,0($11)
lbu	$5,5($11)
lbu	$8,1($11)
lbu	$9,7($11)
lbu	$6,6($11)
addu	$4,$4,$3
sll	$3,$4,4
addu	$5,$5,$7
subu	$2,$15,$2
sll	$4,$4,2
addu	$6,$6,$8
addu	$4,$4,$3
sll	$7,$5,3
subu	$2,$2,$9
sll	$5,$5,1
subu	$5,$5,$7
addu	$2,$2,$4
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$5
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,3($12)
lbu	$5,4($11)
lbu	$2,8($11)
lbu	$3,5($11)
lbu	$8,1($11)
lbu	$6,3($11)
lbu	$4,6($11)
lbu	$7,2($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,7($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,4($12)
lbu	$5,5($11)
lbu	$2,9($11)
lbu	$3,6($11)
lbu	$8,2($11)
lbu	$6,4($11)
lbu	$4,7($11)
lbu	$7,3($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,8($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,5($12)
lbu	$5,6($11)
lbu	$2,10($11)
lbu	$3,7($11)
lbu	$8,3($11)
lbu	$6,5($11)
lbu	$4,8($11)
lbu	$7,4($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,9($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,6($12)
lbu	$5,7($11)
lbu	$2,11($11)
lbu	$3,8($11)
lbu	$8,4($11)
lbu	$6,6($11)
lbu	$4,9($11)
lbu	$7,5($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,10($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,7($12)
lbu	$5,8($11)
lbu	$2,12($11)
lbu	$3,9($11)
lbu	$8,5($11)
lbu	$6,7($11)
lbu	$4,10($11)
lbu	$7,6($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,11($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,8($12)
lbu	$5,9($11)
lbu	$2,13($11)
lbu	$3,10($11)
lbu	$8,6($11)
lbu	$6,8($11)
lbu	$4,11($11)
lbu	$7,7($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,12($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,9($12)
lbu	$5,10($11)
lbu	$2,14($11)
lbu	$3,11($11)
lbu	$8,7($11)
lbu	$6,9($11)
lbu	$4,12($11)
lbu	$7,8($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,13($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,10($12)
lbu	$5,11($11)
lbu	$2,15($11)
lbu	$3,12($11)
lbu	$8,8($11)
lbu	$6,10($11)
lbu	$4,13($11)
lbu	$7,9($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,14($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,11($12)
lbu	$5,12($11)
lbu	$2,16($11)
lbu	$3,13($11)
lbu	$8,9($11)
lbu	$6,11($11)
lbu	$4,14($11)
lbu	$7,10($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,15($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,12($12)
lbu	$5,13($11)
lbu	$2,10($11)
lbu	$3,14($11)
lbu	$6,16($11)
lbu	$7,12($11)
lbu	$4,15($11)
lbu	$8,11($11)
addu	$3,$3,$5
subu	$2,$0,$2
addu	$4,$4,$7
sll	$5,$3,4
subu	$2,$2,$6
sll	$3,$3,2
addu	$6,$6,$8
addu	$3,$3,$5
addiu	$2,$2,16
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,13($12)
lbu	$7,15($11)
lbu	$2,11($11)
lbu	$3,14($11)
lbu	$8,16($11)
lbu	$4,13($11)
lbu	$5,12($11)
addu	$3,$7,$3
subu	$2,$0,$2
addu	$4,$8,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,14($12)
lbu	$8,15($11)
lbu	$4,16($11)
lbu	$2,12($11)
lbu	$7,14($11)
lbu	$5,13($11)
addu	$3,$4,$8
subu	$2,$0,$2
sll	$6,$3,4
addu	$4,$7,$4
subu	$2,$2,$7
sll	$3,$3,2
addu	$3,$3,$6
addu	$5,$5,$8
sll	$6,$4,3
addiu	$2,$2,16
sll	$4,$4,1
addu	$2,$2,$3
subu	$4,$4,$6
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addu	$11,$11,$16
sb	$3,15($12)
bne	$10,$0,$L457
addu	$12,$12,$25

$L458:
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_mpeg4_qpel16_h_lowpass
.align	2
.ent	put_mpeg4_qpel16_v_lowpass
.type	put_mpeg4_qpel16_v_lowpass, @function
put_mpeg4_qpel16_v_lowpass:
.set	nomips16
.frame	$sp,216,$31		# vars= 168, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-216
sw	$fp,212($sp)
sw	$23,208($sp)
sw	$22,204($sp)
sw	$21,200($sp)
sw	$20,196($sp)
sw	$19,192($sp)
sw	$18,188($sp)
sw	$17,184($sp)
sw	$16,180($sp)
.cprestore	0
sll	$16,$6,2
sll	$14,$6,4
subu	$17,$14,$16
sll	$15,$6,1
sll	$10,$6,3
subu	$25,$17,$6
sw	$5,220($sp)
sll	$12,$7,1
sll	$13,$7,3
sw	$4,216($sp)
sw	$25,96($sp)
subu	$4,$10,$15
lw	$25,220($sp)
addu	$2,$15,$6
sw	$4,108($sp)
subu	$4,$13,$12
sll	$11,$7,4
sll	$18,$7,2
subu	$3,$14,$6
sw	$2,120($sp)
addu	$4,$25,$4
addu	$2,$17,$6
subu	$19,$11,$18
addu	$5,$10,$6
addu	$9,$15,$10
sw	$3,88($sp)
sw	$2,92($sp)
addu	$3,$18,$7
addu	$2,$12,$7
sw	$4,64($sp)
lw	$4,216($sp)
sw	$5,104($sp)
sw	$9,100($sp)
subu	$5,$13,$7
subu	$9,$19,$7
addu	$2,$25,$2
addu	$3,$25,$3
subu	$fp,$10,$6
addu	$5,$25,$5
addu	$9,$25,$9
addu	$10,$4,$10
sw	$2,76($sp)
sw	$3,68($sp)
lw	$2,216($sp)
lw	$3,120($sp)
sw	$5,60($sp)
sw	$9,44($sp)
lw	$5,108($sp)
sw	$10,164($sp)
lw	$9,104($sp)
lw	$10,100($sp)
addu	$20,$12,$13
addu	$21,$19,$7
subu	$22,$11,$12
subu	$23,$11,$7
addu	$24,$16,$6
addu	$8,$13,$7
addu	$2,$2,$3
addu	$20,$25,$20
addu	$5,$4,$5
addu	$fp,$4,$fp
addu	$8,$25,$8
addu	$21,$25,$21
addu	$22,$25,$22
addu	$23,$25,$23
addu	$11,$25,$11
sw	$2,12($sp)
addu	$16,$4,$16
lui	$2,%hi(ff_cropTbl+1024)
addu	$24,$4,$24
addu	$9,$4,$9
addu	$10,$4,$10
sw	$20,48($sp)
sw	$5,156($sp)
sw	$fp,152($sp)
sw	$8,52($sp)
sw	$21,36($sp)
sw	$22,32($sp)
sw	$23,28($sp)
sw	$11,24($sp)
sw	$16,8($sp)
addiu	$25,$2,%lo(ff_cropTbl+1024)
sw	$24,160($sp)
sw	$9,148($sp)
sw	$10,144($sp)
lw	$20,96($sp)
lw	$2,92($sp)
lw	$3,88($sp)
subu	$14,$14,$15
addu	$20,$4,$20
addu	$17,$4,$17
addu	$2,$4,$2
addu	$14,$4,$14
addu	$3,$4,$3
lw	$5,216($sp)
lw	$4,220($sp)
addu	$6,$5,$6
addu	$7,$4,$7
addu	$12,$4,$12
addu	$18,$4,$18
addu	$13,$4,$13
addu	$19,$4,$19
addu	$15,$5,$15
sw	$20,140($sp)
sw	$17,168($sp)
sw	$2,136($sp)
sw	$14,132($sp)
sw	$3,128($sp)
sw	$7,84($sp)
sw	$12,80($sp)
sw	$18,72($sp)
sw	$13,56($sp)
sw	$19,40($sp)
sw	$6,20($sp)
sw	$15,16($sp)
move	$fp,$0
$L461:
lw	$6,72($sp)
lw	$7,84($sp)
lw	$10,220($sp)
lw	$20,80($sp)
lbu	$16,0($6)
lbu	$13,0($7)
lbu	$9,0($10)
lw	$2,76($sp)
lbu	$14,0($20)
lw	$4,68($sp)
lbu	$15,0($2)
addu	$3,$13,$9
subu	$2,$0,$16
lbu	$18,0($4)
sll	$5,$3,4
addu	$4,$14,$9
subu	$2,$2,$14
sll	$3,$3,2
addu	$7,$15,$13
addu	$3,$3,$5
addiu	$2,$2,16
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$5,$7,1
addu	$5,$5,$7
addu	$2,$2,$4
addu	$4,$15,$9
addu	$6,$14,$13
addu	$2,$2,$5
subu	$3,$0,$18
sll	$5,$4,3
sll	$4,$4,1
sll	$7,$6,4
subu	$4,$4,$5
subu	$3,$3,$13
lw	$5,64($sp)
sll	$6,$6,2
sra	$2,$2,5
addu	$6,$6,$7
addiu	$3,$3,16
addu	$7,$16,$9
addu	$2,$25,$2
lbu	$17,0($5)
lbu	$2,0($2)
addu	$3,$3,$6
sll	$5,$7,1
addu	$6,$15,$14
li	$10,16			# 0x10
subu	$8,$10,$9
addu	$5,$5,$7
addu	$9,$18,$9
sll	$7,$6,4
addu	$3,$3,$4
sll	$6,$6,2
addu	$4,$16,$13
sb	$2,124($sp)
addu	$6,$6,$7
sll	$2,$4,3
addu	$3,$3,$5
subu	$7,$8,$17
sll	$5,$9,1
sll	$4,$4,1
subu	$4,$4,$2
addu	$5,$5,$9
addu	$7,$7,$6
lw	$9,52($sp)
addu	$7,$7,$4
lw	$4,56($sp)
lbu	$12,0($9)
lw	$9,44($sp)
lbu	$11,0($4)
lw	$4,48($sp)
lbu	$22,0($9)
lw	$9,36($sp)
lbu	$21,0($4)
lw	$4,40($sp)
lw	$20,60($sp)
lbu	$9,0($9)
lbu	$24,0($4)
lw	$4,32($sp)
lbu	$10,0($20)
sw	$9,116($sp)
lbu	$4,0($4)
lw	$2,216($sp)
sw	$4,112($sp)
lw	$9,28($sp)
lw	$4,24($sp)
lbu	$23,0($9)
lbu	$9,124($sp)
addu	$20,$2,$fp
sra	$3,$3,5
addu	$2,$16,$15
lbu	$19,0($4)
sll	$6,$2,4
sb	$9,0($20)
addu	$4,$18,$14
addu	$3,$25,$3
sll	$2,$2,2
lbu	$9,0($3)
addu	$2,$2,$6
sll	$3,$4,3
addu	$6,$17,$13
subu	$8,$8,$10
sll	$4,$4,1
lw	$20,20($sp)
subu	$4,$4,$3
addu	$7,$7,$5
addu	$8,$8,$2
addu	$5,$18,$16
sll	$3,$6,1
subu	$2,$0,$11
addu	$3,$3,$6
subu	$2,$2,$13
sll	$6,$5,4
sra	$7,$7,5
sll	$5,$5,2
sb	$9,0($20)
addu	$5,$5,$6
addu	$8,$8,$4
addu	$7,$25,$7
addu	$4,$17,$15
addiu	$2,$2,16
lbu	$13,0($7)
addu	$9,$10,$14
addu	$8,$8,$3
addu	$2,$2,$5
sll	$3,$4,3
lw	$5,16($sp)
sll	$4,$4,1
subu	$4,$4,$3
sll	$6,$9,1
sra	$8,$8,5
sb	$13,0($5)
addu	$6,$6,$9
addu	$7,$17,$18
subu	$3,$0,$12
addu	$2,$2,$4
addu	$8,$25,$8
lbu	$9,0($8)
lw	$13,12($sp)
sll	$4,$7,4
addu	$5,$10,$16
subu	$3,$3,$14
addu	$2,$2,$6
sll	$7,$7,2
addu	$6,$11,$15
addu	$7,$7,$4
addiu	$3,$3,16
sll	$4,$5,3
sra	$2,$2,5
sll	$5,$5,1
sb	$9,0($13)
subu	$5,$5,$4
addu	$8,$10,$17
addu	$3,$3,$7
addu	$2,$25,$2
sll	$7,$6,1
subu	$4,$0,$21
lbu	$13,0($2)
lw	$14,8($sp)
addu	$7,$7,$6
addu	$3,$3,$5
addu	$6,$11,$18
sll	$5,$8,4
subu	$4,$4,$15
sll	$8,$8,2
addu	$8,$8,$5
sll	$2,$6,3
addu	$3,$3,$7
addiu	$4,$4,16
sll	$6,$6,1
sb	$13,0($14)
addu	$9,$12,$16
subu	$6,$6,$2
addu	$4,$4,$8
sra	$3,$3,5
addu	$8,$11,$10
subu	$5,$0,$22
lw	$20,160($sp)
sll	$7,$9,1
addu	$4,$4,$6
addu	$3,$25,$3
sll	$6,$8,4
subu	$5,$5,$16
sll	$8,$8,2
lbu	$13,0($3)
addu	$7,$7,$9
addu	$2,$12,$17
addu	$8,$8,$6
addiu	$5,$5,16
sll	$3,$2,3
addu	$9,$21,$18
addu	$4,$4,$7
addu	$5,$5,$8
sll	$2,$2,1
addu	$8,$20,$fp
sb	$13,0($8)
addu	$7,$12,$11
subu	$2,$2,$3
sll	$6,$9,1
sra	$4,$4,5
subu	$3,$0,$24
lw	$20,156($sp)
addu	$6,$6,$9
addu	$5,$5,$2
addu	$4,$25,$4
sll	$2,$7,4
subu	$3,$3,$18
sll	$7,$7,2
lbu	$15,0($4)
addu	$7,$7,$2
addu	$5,$5,$6
addiu	$3,$3,16
lw	$6,116($sp)
addu	$14,$22,$17
addu	$3,$3,$7
sra	$5,$5,5
addu	$7,$20,$fp
sb	$15,0($7)
addu	$8,$21,$10
addu	$9,$21,$12
subu	$2,$0,$6
addu	$5,$25,$5
sll	$6,$14,1
sll	$4,$8,3
sll	$13,$9,4
addu	$6,$6,$14
sll	$8,$8,1
lbu	$14,0($5)
sll	$9,$9,2
lw	$5,112($sp)
subu	$8,$8,$4
addu	$9,$9,$13
addu	$13,$24,$10
addu	$3,$3,$8
subu	$8,$0,$5
sll	$5,$13,1
addu	$4,$22,$11
addu	$5,$5,$13
lw	$13,152($sp)
sll	$7,$4,3
sll	$4,$4,1
subu	$4,$4,$7
subu	$2,$2,$17
addu	$7,$13,$fp
sb	$14,0($7)
addu	$3,$3,$6
addiu	$2,$2,16
lw	$14,116($sp)
addu	$2,$2,$9
addu	$6,$22,$21
sra	$3,$3,5
lw	$20,164($sp)
sll	$9,$6,4
addu	$2,$2,$4
subu	$10,$8,$10
addu	$4,$24,$12
addu	$3,$25,$3
sll	$6,$6,2
lbu	$13,0($3)
addu	$6,$6,$9
addu	$2,$2,$5
addu	$9,$14,$11
sll	$5,$4,3
addiu	$10,$10,16
sll	$4,$4,1
subu	$4,$4,$5
subu	$7,$0,$23
addu	$10,$10,$6
addu	$5,$24,$22
addu	$6,$20,$fp
sll	$3,$9,1
sb	$13,0($6)
addu	$3,$3,$9
addu	$10,$10,$4
sll	$9,$5,4
subu	$11,$7,$11
sll	$5,$5,2
addu	$5,$5,$9
addu	$10,$10,$3
sra	$2,$2,5
lw	$3,112($sp)
addiu	$11,$11,16
addu	$4,$14,$21
addu	$2,$25,$2
addu	$11,$11,$5
lw	$5,148($sp)
addu	$9,$3,$12
lbu	$13,0($2)
sll	$2,$4,3
sll	$4,$4,1
addu	$6,$5,$fp
subu	$4,$4,$2
sll	$2,$9,1
sb	$13,0($6)
addu	$2,$2,$9
lw	$9,112($sp)
subu	$3,$0,$19
addu	$5,$14,$24
sra	$10,$10,5
sll	$6,$5,4
addu	$11,$11,$4
addu	$10,$25,$10
addu	$4,$9,$22
subu	$12,$3,$12
sll	$5,$5,2
lbu	$13,0($10)
addu	$9,$23,$21
lw	$10,144($sp)
addu	$5,$5,$6
addu	$11,$11,$2
addiu	$12,$12,16
sll	$2,$4,3
sll	$4,$4,1
lw	$20,112($sp)
subu	$4,$4,$2
addu	$12,$12,$5
sll	$2,$9,1
addu	$6,$10,$fp
addu	$2,$2,$9
addu	$12,$12,$4
addu	$4,$23,$24
sb	$13,0($6)
addu	$5,$20,$14
addu	$12,$12,$2
sra	$11,$11,5
sll	$2,$4,3
sll	$4,$4,1
sll	$6,$5,4
subu	$4,$4,$2
subu	$3,$3,$21
lw	$2,140($sp)
addu	$11,$25,$11
sll	$5,$5,2
lbu	$10,0($11)
addu	$5,$5,$6
addiu	$3,$3,16
addu	$6,$2,$fp
addu	$3,$3,$5
addu	$5,$23,$20
sb	$10,0($6)
subu	$7,$7,$22
sll	$6,$5,4
sll	$5,$5,2
addu	$9,$19,$22
addu	$5,$5,$6
sra	$12,$12,5
addiu	$7,$7,16
sll	$2,$9,1
addu	$7,$7,$5
addu	$12,$25,$12
lw	$5,168($sp)
lbu	$10,0($12)
addu	$2,$2,$9
addu	$3,$3,$4
addu	$4,$19,$14
addu	$9,$19,$24
addu	$6,$5,$fp
addu	$3,$3,$2
sll	$2,$4,3
sll	$4,$4,1
sb	$10,0($6)
subu	$4,$4,$2
sll	$5,$9,1
sra	$3,$3,5
lw	$6,136($sp)
addu	$2,$19,$23
addu	$5,$5,$9
addu	$19,$19,$20
addu	$7,$7,$4
addu	$3,$25,$3
addu	$7,$7,$5
lbu	$5,0($3)
sll	$3,$19,3
sll	$19,$19,1
sll	$4,$2,4
subu	$19,$19,$3
subu	$8,$8,$24
addu	$3,$6,$fp
sll	$2,$2,2
sra	$7,$7,5
sb	$5,0($3)
addu	$23,$23,$14
addu	$2,$2,$4
addu	$7,$25,$7
addiu	$8,$8,16
lbu	$3,0($7)
addu	$8,$8,$2
lw	$7,132($sp)
sll	$2,$23,1
addu	$2,$2,$23
addu	$8,$8,$19
addu	$8,$8,$2
addu	$2,$7,$fp
sb	$3,0($2)
sra	$8,$8,5
lw	$9,128($sp)
addu	$8,$25,$8
lbu	$3,0($8)
addu	$2,$9,$fp
sb	$3,0($2)
lw	$10,220($sp)
lw	$13,84($sp)
lw	$14,80($sp)
lw	$20,76($sp)
lw	$2,72($sp)
lw	$3,68($sp)
lw	$4,64($sp)
addiu	$10,$10,1
addiu	$13,$13,1
addiu	$14,$14,1
addiu	$20,$20,1
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
sw	$10,220($sp)
sw	$13,84($sp)
sw	$14,80($sp)
sw	$20,76($sp)
sw	$2,72($sp)
sw	$3,68($sp)
sw	$4,64($sp)
lw	$5,60($sp)
lw	$6,56($sp)
lw	$7,52($sp)
addiu	$5,$5,1
addiu	$6,$6,1
addiu	$7,$7,1
lw	$9,48($sp)
lw	$10,44($sp)
lw	$13,40($sp)
lw	$14,36($sp)
lw	$20,32($sp)
lw	$2,28($sp)
lw	$3,24($sp)
lw	$4,20($sp)
sw	$5,60($sp)
sw	$6,56($sp)
lw	$5,16($sp)
lw	$6,12($sp)
sw	$7,52($sp)
lw	$7,8($sp)
addiu	$9,$9,1
sw	$9,48($sp)
addiu	$10,$10,1
addiu	$13,$13,1
addiu	$14,$14,1
addiu	$20,$20,1
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
addiu	$6,$6,1
addiu	$7,$7,1
addiu	$fp,$fp,1
li	$9,16			# 0x10
sw	$10,44($sp)
sw	$13,40($sp)
sw	$14,36($sp)
sw	$20,32($sp)
sw	$2,28($sp)
sw	$3,24($sp)
sw	$4,20($sp)
sw	$5,16($sp)
sw	$6,12($sp)
bne	$fp,$9,$L461
sw	$7,8($sp)

lw	$fp,212($sp)
lw	$23,208($sp)
lw	$22,204($sp)
lw	$21,200($sp)
lw	$20,196($sp)
lw	$19,192($sp)
lw	$18,188($sp)
lw	$17,184($sp)
lw	$16,180($sp)
j	$31
addiu	$sp,$sp,216

.set	macro
.set	reorder
.end	put_mpeg4_qpel16_v_lowpass
.align	2
.ent	put_qpel8_mc00_c
.type	put_qpel8_mc00_c, @function
put_qpel8_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$0
li	$8,8			# 0x8
$L465:
lwl	$2,3($5)
addiu	$7,$7,1
lwr	$2,0($5)
sw	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($4)
bne	$7,$8,$L465
addu	$4,$4,$6

j	$31
nop

.set	macro
.set	reorder
.end	put_qpel8_mc00_c
.align	2
.ent	put_qpel8_mc20_c
.type	put_qpel8_mc20_c, @function
put_qpel8_mc20_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 24, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
sw	$31,36($sp)
.cprestore	24
move	$7,$6
li	$2,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

lw	$31,36($sp)
lw	$28,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_qpel8_mc20_c
.align	2
.ent	put_qpel8_mc02_c
.type	put_qpel8_mc02_c, @function
put_qpel8_mc02_c:
.set	nomips16
.frame	$sp,176,$31		# vars= 144, regs= 1/0, args= 16, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-176
sw	$31,172($sp)
.cprestore	16
addiu	$9,$sp,24
move	$7,$9
addiu	$8,$sp,168
$L471:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($7)
swr	$2,0($7)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($7)
swr	$3,4($7)
lbu	$2,8($5)
sb	$2,8($7)
addiu	$7,$7,16
bne	$7,$8,$L471
addu	$5,$5,$6

move	$5,$9
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,172($sp)
lw	$28,16($sp)
j	$31
addiu	$sp,$sp,176

.set	macro
.set	reorder
.end	put_qpel8_mc02_c
.align	2
.ent	put_qpel8_mc22_c
.type	put_qpel8_mc22_c, @function
put_qpel8_mc22_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 72, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$18,112($sp)
sw	$17,108($sp)
sw	$16,104($sp)
.cprestore	24
move	$17,$6
addiu	$16,$sp,32
move	$18,$4
move	$7,$17
move	$4,$16
li	$2,9			# 0x9
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$4,$18
move	$5,$16
move	$6,$17
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,116($sp)
lw	$28,24($sp)
lw	$18,112($sp)
lw	$17,108($sp)
lw	$16,104($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_qpel8_mc22_c
.align	2
.ent	put_qpel16_mc00_c
.type	put_qpel16_mc00_c, @function
put_qpel16_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	put_pixels16_c
.option	pic2
li	$7,16			# 0x10

.set	macro
.set	reorder
.end	put_qpel16_mc00_c
.align	2
.ent	put_qpel16_mc20_c
.type	put_qpel16_mc20_c, @function
put_qpel16_mc20_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 24, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
sw	$31,36($sp)
.cprestore	24
move	$7,$6
li	$2,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

lw	$31,36($sp)
lw	$28,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_qpel16_mc20_c
.align	2
.ent	put_qpel16_mc22_c
.type	put_qpel16_mc22_c, @function
put_qpel16_mc22_c:
.set	nomips16
.frame	$sp,320,$31		# vars= 272, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-320
sw	$31,316($sp)
sw	$18,312($sp)
sw	$17,308($sp)
sw	$16,304($sp)
.cprestore	24
move	$17,$6
addiu	$16,$sp,32
move	$18,$4
move	$7,$17
move	$4,$16
li	$2,17			# 0x11
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$4,$18
move	$5,$16
move	$6,$17
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,316($sp)
lw	$28,24($sp)
lw	$18,312($sp)
lw	$17,308($sp)
lw	$16,304($sp)
j	$31
addiu	$sp,$sp,320

.set	macro
.set	reorder
.end	put_qpel16_mc22_c
.align	2
.ent	put_no_rnd_mpeg4_qpel8_h_lowpass
.type	put_no_rnd_mpeg4_qpel8_h_lowpass, @function
put_no_rnd_mpeg4_qpel8_h_lowpass:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
.mask	0x00010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$24,24($sp)
sw	$16,4($sp)
move	$12,$4
move	$11,$5
move	$25,$6
blez	$24,$L485
move	$16,$7

lui	$2,%hi(ff_cropTbl+1024)
addiu	$13,$2,%lo(ff_cropTbl+1024)
move	$14,$0
li	$15,15			# 0xf
$L484:
lbu	$8,1($11)
lbu	$4,0($11)
lbu	$2,4($11)
lbu	$7,2($11)
lbu	$5,3($11)
addu	$3,$8,$4
subu	$2,$0,$2
addu	$4,$7,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addiu	$14,$14,1
sb	$3,0($12)
lbu	$7,1($11)
lbu	$2,5($11)
lbu	$3,2($11)
lbu	$8,0($11)
lbu	$4,3($11)
lbu	$5,4($11)
addu	$3,$3,$7
subu	$2,$0,$2
addu	$4,$4,$8
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$4,0($2)
slt	$10,$14,$24
sb	$4,1($12)
lbu	$2,2($11)
lbu	$3,3($11)
lbu	$8,0($11)
lbu	$6,1($11)
lbu	$4,4($11)
lbu	$9,6($11)
lbu	$5,5($11)
addu	$3,$3,$2
sll	$7,$3,4
addu	$4,$4,$6
subu	$2,$15,$8
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$7
sll	$6,$4,3
subu	$2,$2,$9
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,2($12)
lbu	$3,3($11)
lbu	$4,4($11)
lbu	$7,2($11)
lbu	$2,0($11)
lbu	$5,5($11)
lbu	$8,1($11)
lbu	$9,7($11)
lbu	$6,6($11)
addu	$4,$4,$3
sll	$3,$4,4
addu	$5,$5,$7
subu	$2,$15,$2
sll	$4,$4,2
addu	$6,$6,$8
addu	$4,$4,$3
sll	$7,$5,3
subu	$2,$2,$9
sll	$5,$5,1
subu	$5,$5,$7
addu	$2,$2,$4
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$5
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,3($12)
lbu	$5,4($11)
lbu	$2,8($11)
lbu	$3,5($11)
lbu	$8,1($11)
lbu	$6,3($11)
lbu	$4,6($11)
lbu	$7,2($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,7($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,4($12)
lbu	$5,5($11)
lbu	$2,2($11)
lbu	$3,6($11)
lbu	$6,8($11)
lbu	$7,4($11)
lbu	$4,7($11)
lbu	$8,3($11)
addu	$3,$3,$5
subu	$2,$0,$2
addu	$4,$4,$7
sll	$5,$3,4
subu	$2,$2,$6
sll	$3,$3,2
addu	$6,$6,$8
addu	$3,$3,$5
addiu	$2,$2,15
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,5($12)
lbu	$7,7($11)
lbu	$2,3($11)
lbu	$3,6($11)
lbu	$8,8($11)
lbu	$4,5($11)
lbu	$5,4($11)
addu	$3,$7,$3
subu	$2,$0,$2
addu	$4,$8,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,6($12)
lbu	$8,7($11)
lbu	$4,8($11)
lbu	$2,4($11)
lbu	$7,6($11)
lbu	$5,5($11)
addu	$3,$4,$8
subu	$2,$0,$2
sll	$6,$3,4
addu	$4,$7,$4
subu	$2,$2,$7
sll	$3,$3,2
addu	$3,$3,$6
addu	$5,$5,$8
sll	$6,$4,3
addiu	$2,$2,15
sll	$4,$4,1
addu	$2,$2,$3
subu	$4,$4,$6
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addu	$11,$11,$16
sb	$3,7($12)
bne	$10,$0,$L484
addu	$12,$12,$25

$L485:
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_no_rnd_mpeg4_qpel8_h_lowpass
.align	2
.ent	put_no_rnd_mpeg4_qpel8_v_lowpass
.type	put_no_rnd_mpeg4_qpel8_v_lowpass, @function
put_no_rnd_mpeg4_qpel8_v_lowpass:
.set	nomips16
.frame	$sp,96,$31		# vars= 48, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-96
sw	$fp,92($sp)
sw	$23,88($sp)
sw	$22,84($sp)
sw	$21,80($sp)
sw	$20,76($sp)
sw	$19,72($sp)
sw	$18,68($sp)
sw	$17,64($sp)
sw	$16,60($sp)
.cprestore	0
sll	$9,$7,1
move	$25,$5
sll	$8,$7,3
sll	$10,$6,1
sll	$14,$7,2
addu	$2,$9,$7
sll	$16,$6,2
sll	$3,$6,3
move	$19,$4
subu	$11,$8,$9
subu	$12,$8,$7
subu	$15,$3,$6
addu	$5,$14,$7
addu	$2,$25,$2
addu	$13,$16,$6
subu	$3,$3,$10
addu	$4,$10,$6
sw	$2,40($sp)
addu	$5,$25,$5
addu	$11,$25,$11
addu	$12,$25,$12
addu	$8,$25,$8
addu	$4,$19,$4
addu	$13,$19,$13
addu	$3,$19,$3
addu	$15,$19,$15
lui	$2,%hi(ff_cropTbl+1024)
addu	$7,$25,$7
addu	$9,$25,$9
sw	$5,36($sp)
sw	$11,32($sp)
sw	$12,28($sp)
sw	$8,24($sp)
sw	$4,20($sp)
sw	$13,16($sp)
sw	$3,12($sp)
sw	$15,8($sp)
addiu	$24,$2,%lo(ff_cropTbl+1024)
sw	$7,48($sp)
sw	$9,44($sp)
addu	$fp,$25,$14
addu	$23,$19,$6
addu	$22,$19,$10
addu	$21,$19,$16
move	$20,$0
$L488:
lw	$2,48($sp)
lw	$3,44($sp)
lbu	$16,0($fp)
lbu	$8,0($2)
lbu	$10,0($25)
lw	$4,40($sp)
lbu	$13,0($3)
lbu	$15,0($4)
lw	$6,36($sp)
addu	$3,$8,$10
subu	$2,$0,$16
sll	$5,$3,4
addu	$4,$13,$10
subu	$2,$2,$13
sll	$3,$3,2
lbu	$18,0($6)
addu	$7,$15,$8
addu	$3,$3,$5
addiu	$2,$2,15
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$5,$7,1
addu	$6,$13,$8
addu	$5,$5,$7
addu	$2,$2,$4
subu	$3,$0,$18
addu	$4,$15,$10
sll	$7,$6,4
subu	$3,$3,$8
addu	$2,$2,$5
sll	$6,$6,2
sll	$5,$4,3
sll	$4,$4,1
addu	$6,$6,$7
subu	$4,$4,$5
addiu	$3,$3,15
lw	$5,32($sp)
addu	$7,$16,$10
addu	$3,$3,$6
lbu	$14,0($5)
addu	$6,$15,$13
sll	$5,$7,1
addu	$3,$3,$4
li	$4,15			# 0xf
subu	$9,$4,$10
addu	$5,$5,$7
sll	$7,$6,4
sll	$6,$6,2
addu	$6,$6,$7
addu	$3,$3,$5
subu	$5,$9,$14
addu	$5,$5,$6
sra	$2,$2,5
lw	$6,28($sp)
addu	$4,$16,$8
addu	$2,$24,$2
lbu	$11,0($6)
lbu	$12,0($2)
lw	$6,24($sp)
addu	$10,$18,$10
sll	$2,$4,3
sll	$4,$4,1
subu	$4,$4,$2
addu	$7,$16,$15
sll	$2,$10,1
addu	$2,$2,$10
addu	$5,$5,$4
lbu	$10,0($6)
sll	$4,$7,4
addu	$6,$18,$13
sra	$3,$3,5
sll	$7,$7,2
sb	$12,0($19)
addu	$7,$7,$4
addu	$12,$14,$8
addu	$3,$24,$3
addu	$5,$5,$2
subu	$9,$9,$11
sll	$2,$6,3
sll	$6,$6,1
lbu	$17,0($3)
subu	$6,$6,$2
addu	$9,$9,$7
sll	$4,$12,1
addu	$7,$18,$16
subu	$3,$0,$10
addu	$4,$4,$12
addu	$9,$9,$6
addu	$2,$14,$15
sll	$6,$7,4
sra	$5,$5,5
sll	$7,$7,2
sb	$17,0($23)
addu	$7,$7,$6
addu	$5,$24,$5
addu	$6,$11,$13
subu	$8,$3,$8
addu	$9,$9,$4
sll	$4,$2,3
sll	$2,$2,1
lbu	$12,0($5)
subu	$2,$2,$4
addu	$5,$14,$18
sll	$4,$6,1
addiu	$8,$8,15
addu	$4,$4,$6
addu	$8,$8,$7
sll	$6,$5,4
sra	$9,$9,5
subu	$3,$3,$13
sll	$5,$5,2
sb	$12,0($22)
addu	$5,$5,$6
addu	$8,$8,$2
addu	$9,$24,$9
addu	$2,$11,$16
addiu	$3,$3,15
lbu	$12,0($9)
addu	$8,$8,$4
addu	$3,$3,$5
sll	$4,$2,3
lw	$5,20($sp)
sll	$2,$2,1
addu	$9,$10,$15
subu	$2,$2,$4
addu	$7,$11,$14
subu	$4,$0,$11
sb	$12,0($5)
sll	$6,$9,1
addu	$5,$10,$18
addu	$3,$3,$2
sra	$8,$8,5
sll	$2,$7,4
subu	$4,$4,$15
sll	$7,$7,2
addu	$6,$6,$9
addu	$7,$7,$2
addu	$8,$24,$8
sll	$2,$5,3
addiu	$4,$4,15
sll	$5,$5,1
lbu	$9,0($8)
subu	$5,$5,$2
addu	$8,$10,$16
addu	$3,$3,$6
addu	$4,$4,$7
addu	$6,$10,$11
subu	$2,$0,$14
addu	$4,$4,$5
sra	$3,$3,5
sll	$5,$6,4
sll	$7,$8,1
subu	$2,$2,$16
sll	$6,$6,2
sb	$9,0($21)
addu	$6,$6,$5
addu	$10,$10,$14
addu	$7,$7,$8
addu	$3,$24,$3
addiu	$2,$2,15
addu	$11,$11,$18
addu	$4,$4,$7
addu	$2,$2,$6
lbu	$7,0($3)
lw	$6,16($sp)
sll	$3,$10,3
sll	$10,$10,1
subu	$10,$10,$3
sra	$4,$4,5
sll	$3,$11,1
sb	$7,0($6)
addu	$3,$3,$11
addu	$4,$24,$4
addu	$2,$2,$10
lbu	$5,0($4)
addu	$2,$2,$3
lw	$3,12($sp)
sra	$2,$2,5
sb	$5,0($3)
addu	$2,$24,$2
lbu	$3,0($2)
lw	$4,8($sp)
addiu	$20,$20,1
sb	$3,0($4)
lw	$5,48($sp)
lw	$6,44($sp)
addiu	$5,$5,1
lw	$2,40($sp)
lw	$3,36($sp)
lw	$4,32($sp)
sw	$5,48($sp)
lw	$5,28($sp)
addiu	$6,$6,1
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
sw	$6,44($sp)
lw	$6,24($sp)
sw	$2,40($sp)
sw	$3,36($sp)
lw	$2,20($sp)
lw	$3,16($sp)
sw	$4,32($sp)
sw	$5,28($sp)
lw	$4,12($sp)
lw	$5,8($sp)
addiu	$6,$6,1
sw	$6,24($sp)
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
li	$6,8			# 0x8
addiu	$19,$19,1
addiu	$25,$25,1
addiu	$fp,$fp,1
addiu	$23,$23,1
addiu	$22,$22,1
sw	$2,20($sp)
addiu	$21,$21,1
sw	$3,16($sp)
sw	$4,12($sp)
bne	$20,$6,$L488
sw	$5,8($sp)

lw	$fp,92($sp)
lw	$23,88($sp)
lw	$22,84($sp)
lw	$21,80($sp)
lw	$20,76($sp)
lw	$19,72($sp)
lw	$18,68($sp)
lw	$17,64($sp)
lw	$16,60($sp)
j	$31
addiu	$sp,$sp,96

.set	macro
.set	reorder
.end	put_no_rnd_mpeg4_qpel8_v_lowpass
.align	2
.ent	put_no_rnd_mpeg4_qpel16_h_lowpass
.type	put_no_rnd_mpeg4_qpel16_h_lowpass, @function
put_no_rnd_mpeg4_qpel16_h_lowpass:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
.mask	0x00010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
lw	$24,24($sp)
sw	$16,4($sp)
move	$12,$4
move	$11,$5
move	$25,$6
blez	$24,$L494
move	$16,$7

lui	$2,%hi(ff_cropTbl+1024)
addiu	$13,$2,%lo(ff_cropTbl+1024)
move	$14,$0
li	$15,15			# 0xf
$L493:
lbu	$8,1($11)
lbu	$4,0($11)
lbu	$2,4($11)
lbu	$7,2($11)
lbu	$5,3($11)
addu	$3,$8,$4
subu	$2,$0,$2
addu	$4,$7,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addiu	$14,$14,1
sb	$3,0($12)
lbu	$7,1($11)
lbu	$2,5($11)
lbu	$3,2($11)
lbu	$8,0($11)
lbu	$4,3($11)
lbu	$5,4($11)
addu	$3,$3,$7
subu	$2,$0,$2
addu	$4,$4,$8
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$4,0($2)
slt	$10,$14,$24
sb	$4,1($12)
lbu	$2,2($11)
lbu	$3,3($11)
lbu	$8,0($11)
lbu	$6,1($11)
lbu	$4,4($11)
lbu	$9,6($11)
lbu	$5,5($11)
addu	$3,$3,$2
sll	$7,$3,4
addu	$4,$4,$6
subu	$2,$15,$8
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$7
sll	$6,$4,3
subu	$2,$2,$9
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,2($12)
lbu	$3,3($11)
lbu	$4,4($11)
lbu	$7,2($11)
lbu	$2,0($11)
lbu	$5,5($11)
lbu	$8,1($11)
lbu	$9,7($11)
lbu	$6,6($11)
addu	$4,$4,$3
sll	$3,$4,4
addu	$5,$5,$7
subu	$2,$15,$2
sll	$4,$4,2
addu	$6,$6,$8
addu	$4,$4,$3
sll	$7,$5,3
subu	$2,$2,$9
sll	$5,$5,1
subu	$5,$5,$7
addu	$2,$2,$4
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$5
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,3($12)
lbu	$5,4($11)
lbu	$2,8($11)
lbu	$3,5($11)
lbu	$8,1($11)
lbu	$6,3($11)
lbu	$4,6($11)
lbu	$7,2($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,7($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,4($12)
lbu	$5,5($11)
lbu	$2,9($11)
lbu	$3,6($11)
lbu	$8,2($11)
lbu	$6,4($11)
lbu	$4,7($11)
lbu	$7,3($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,8($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,5($12)
lbu	$5,6($11)
lbu	$2,10($11)
lbu	$3,7($11)
lbu	$8,3($11)
lbu	$6,5($11)
lbu	$4,8($11)
lbu	$7,4($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,9($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,6($12)
lbu	$5,7($11)
lbu	$2,11($11)
lbu	$3,8($11)
lbu	$8,4($11)
lbu	$6,6($11)
lbu	$4,9($11)
lbu	$7,5($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,10($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,7($12)
lbu	$5,8($11)
lbu	$2,12($11)
lbu	$3,9($11)
lbu	$8,5($11)
lbu	$6,7($11)
lbu	$4,10($11)
lbu	$7,6($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,11($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,8($12)
lbu	$5,9($11)
lbu	$2,13($11)
lbu	$3,10($11)
lbu	$8,6($11)
lbu	$6,8($11)
lbu	$4,11($11)
lbu	$7,7($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,12($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,9($12)
lbu	$5,10($11)
lbu	$2,14($11)
lbu	$3,11($11)
lbu	$8,7($11)
lbu	$6,9($11)
lbu	$4,12($11)
lbu	$7,8($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,13($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,10($12)
lbu	$5,11($11)
lbu	$2,15($11)
lbu	$3,12($11)
lbu	$8,8($11)
lbu	$6,10($11)
lbu	$4,13($11)
lbu	$7,9($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,14($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,11($12)
lbu	$5,12($11)
lbu	$2,16($11)
lbu	$3,13($11)
lbu	$8,9($11)
lbu	$6,11($11)
lbu	$4,14($11)
lbu	$7,10($11)
addu	$3,$3,$5
subu	$2,$0,$2
lbu	$5,15($11)
addu	$4,$4,$6
subu	$2,$2,$8
sll	$6,$3,4
sll	$3,$3,2
addu	$5,$5,$7
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,12($12)
lbu	$5,13($11)
lbu	$2,10($11)
lbu	$3,14($11)
lbu	$6,16($11)
lbu	$7,12($11)
lbu	$4,15($11)
lbu	$8,11($11)
addu	$3,$3,$5
subu	$2,$0,$2
addu	$4,$4,$7
sll	$5,$3,4
subu	$2,$2,$6
sll	$3,$3,2
addu	$6,$6,$8
addu	$3,$3,$5
addiu	$2,$2,15
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,13($12)
lbu	$7,15($11)
lbu	$2,11($11)
lbu	$3,14($11)
lbu	$8,16($11)
lbu	$4,13($11)
lbu	$5,12($11)
addu	$3,$7,$3
subu	$2,$0,$2
addu	$4,$8,$4
sll	$6,$3,4
subu	$2,$2,$7
sll	$3,$3,2
addu	$5,$5,$8
addu	$3,$3,$6
addiu	$2,$2,15
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$2,$2,$3
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
sb	$3,14($12)
lbu	$8,15($11)
lbu	$4,16($11)
lbu	$2,12($11)
lbu	$7,14($11)
lbu	$5,13($11)
addu	$3,$4,$8
subu	$2,$0,$2
sll	$6,$3,4
addu	$4,$7,$4
subu	$2,$2,$7
sll	$3,$3,2
addu	$3,$3,$6
addu	$5,$5,$8
sll	$6,$4,3
addiu	$2,$2,15
sll	$4,$4,1
addu	$2,$2,$3
subu	$4,$4,$6
sll	$3,$5,1
addu	$3,$3,$5
addu	$2,$2,$4
addu	$2,$2,$3
sra	$2,$2,5
addu	$2,$13,$2
lbu	$3,0($2)
addu	$11,$11,$16
sb	$3,15($12)
bne	$10,$0,$L493
addu	$12,$12,$25

$L494:
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,8

.set	macro
.set	reorder
.end	put_no_rnd_mpeg4_qpel16_h_lowpass
.align	2
.ent	put_no_rnd_mpeg4_qpel16_v_lowpass
.type	put_no_rnd_mpeg4_qpel16_v_lowpass, @function
put_no_rnd_mpeg4_qpel16_v_lowpass:
.set	nomips16
.frame	$sp,216,$31		# vars= 168, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-216
sw	$fp,212($sp)
sw	$23,208($sp)
sw	$22,204($sp)
sw	$21,200($sp)
sw	$20,196($sp)
sw	$19,192($sp)
sw	$18,188($sp)
sw	$17,184($sp)
sw	$16,180($sp)
.cprestore	0
sll	$16,$6,2
sll	$14,$6,4
subu	$17,$14,$16
sll	$15,$6,1
sll	$10,$6,3
subu	$25,$17,$6
sw	$5,220($sp)
sll	$12,$7,1
sll	$13,$7,3
sw	$4,216($sp)
sw	$25,96($sp)
subu	$4,$10,$15
lw	$25,220($sp)
addu	$2,$15,$6
sw	$4,108($sp)
subu	$4,$13,$12
sll	$11,$7,4
sll	$18,$7,2
subu	$3,$14,$6
sw	$2,120($sp)
addu	$4,$25,$4
addu	$2,$17,$6
subu	$19,$11,$18
addu	$5,$10,$6
addu	$9,$15,$10
sw	$3,88($sp)
sw	$2,92($sp)
addu	$3,$18,$7
addu	$2,$12,$7
sw	$4,64($sp)
lw	$4,216($sp)
sw	$5,104($sp)
sw	$9,100($sp)
subu	$5,$13,$7
subu	$9,$19,$7
addu	$2,$25,$2
addu	$3,$25,$3
subu	$fp,$10,$6
addu	$5,$25,$5
addu	$9,$25,$9
addu	$10,$4,$10
sw	$2,76($sp)
sw	$3,68($sp)
lw	$2,216($sp)
lw	$3,120($sp)
sw	$5,60($sp)
sw	$9,44($sp)
lw	$5,108($sp)
sw	$10,164($sp)
lw	$9,104($sp)
lw	$10,100($sp)
addu	$20,$12,$13
addu	$21,$19,$7
subu	$22,$11,$12
subu	$23,$11,$7
addu	$24,$16,$6
addu	$8,$13,$7
addu	$2,$2,$3
addu	$20,$25,$20
addu	$5,$4,$5
addu	$fp,$4,$fp
addu	$8,$25,$8
addu	$21,$25,$21
addu	$22,$25,$22
addu	$23,$25,$23
addu	$11,$25,$11
sw	$2,12($sp)
addu	$16,$4,$16
lui	$2,%hi(ff_cropTbl+1024)
addu	$24,$4,$24
addu	$9,$4,$9
addu	$10,$4,$10
sw	$20,48($sp)
sw	$5,156($sp)
sw	$fp,152($sp)
sw	$8,52($sp)
sw	$21,36($sp)
sw	$22,32($sp)
sw	$23,28($sp)
sw	$11,24($sp)
sw	$16,8($sp)
addiu	$25,$2,%lo(ff_cropTbl+1024)
sw	$24,160($sp)
sw	$9,148($sp)
sw	$10,144($sp)
lw	$20,96($sp)
lw	$2,92($sp)
lw	$3,88($sp)
subu	$14,$14,$15
addu	$20,$4,$20
addu	$17,$4,$17
addu	$2,$4,$2
addu	$14,$4,$14
addu	$3,$4,$3
lw	$5,216($sp)
lw	$4,220($sp)
addu	$6,$5,$6
addu	$7,$4,$7
addu	$12,$4,$12
addu	$18,$4,$18
addu	$13,$4,$13
addu	$19,$4,$19
addu	$15,$5,$15
sw	$20,140($sp)
sw	$17,168($sp)
sw	$2,136($sp)
sw	$14,132($sp)
sw	$3,128($sp)
sw	$7,84($sp)
sw	$12,80($sp)
sw	$18,72($sp)
sw	$13,56($sp)
sw	$19,40($sp)
sw	$6,20($sp)
sw	$15,16($sp)
move	$fp,$0
$L497:
lw	$6,72($sp)
lw	$7,84($sp)
lw	$10,220($sp)
lw	$20,80($sp)
lbu	$16,0($6)
lbu	$13,0($7)
lbu	$9,0($10)
lw	$2,76($sp)
lbu	$14,0($20)
lw	$4,68($sp)
lbu	$15,0($2)
addu	$3,$13,$9
subu	$2,$0,$16
lbu	$18,0($4)
sll	$5,$3,4
addu	$4,$14,$9
subu	$2,$2,$14
sll	$3,$3,2
addu	$7,$15,$13
addu	$3,$3,$5
addiu	$2,$2,15
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
sll	$5,$7,1
addu	$5,$5,$7
addu	$2,$2,$4
addu	$4,$15,$9
addu	$6,$14,$13
addu	$2,$2,$5
subu	$3,$0,$18
sll	$5,$4,3
sll	$4,$4,1
sll	$7,$6,4
subu	$4,$4,$5
subu	$3,$3,$13
lw	$5,64($sp)
sll	$6,$6,2
sra	$2,$2,5
addu	$6,$6,$7
addiu	$3,$3,15
addu	$7,$16,$9
addu	$2,$25,$2
lbu	$17,0($5)
lbu	$2,0($2)
addu	$3,$3,$6
sll	$5,$7,1
addu	$6,$15,$14
li	$10,15			# 0xf
subu	$8,$10,$9
addu	$5,$5,$7
addu	$9,$18,$9
sll	$7,$6,4
addu	$3,$3,$4
sll	$6,$6,2
addu	$4,$16,$13
sb	$2,124($sp)
addu	$6,$6,$7
sll	$2,$4,3
addu	$3,$3,$5
subu	$7,$8,$17
sll	$5,$9,1
sll	$4,$4,1
subu	$4,$4,$2
addu	$5,$5,$9
addu	$7,$7,$6
lw	$9,52($sp)
addu	$7,$7,$4
lw	$4,56($sp)
lbu	$12,0($9)
lw	$9,44($sp)
lbu	$11,0($4)
lw	$4,48($sp)
lbu	$22,0($9)
lw	$9,36($sp)
lbu	$21,0($4)
lw	$4,40($sp)
lw	$20,60($sp)
lbu	$9,0($9)
lbu	$24,0($4)
lw	$4,32($sp)
lbu	$10,0($20)
sw	$9,116($sp)
lbu	$4,0($4)
lw	$2,216($sp)
sw	$4,112($sp)
lw	$9,28($sp)
lw	$4,24($sp)
lbu	$23,0($9)
lbu	$9,124($sp)
addu	$20,$2,$fp
sra	$3,$3,5
addu	$2,$16,$15
lbu	$19,0($4)
sll	$6,$2,4
sb	$9,0($20)
addu	$4,$18,$14
addu	$3,$25,$3
sll	$2,$2,2
lbu	$9,0($3)
addu	$2,$2,$6
sll	$3,$4,3
addu	$6,$17,$13
subu	$8,$8,$10
sll	$4,$4,1
lw	$20,20($sp)
subu	$4,$4,$3
addu	$7,$7,$5
addu	$8,$8,$2
addu	$5,$18,$16
sll	$3,$6,1
subu	$2,$0,$11
addu	$3,$3,$6
subu	$2,$2,$13
sll	$6,$5,4
sra	$7,$7,5
sll	$5,$5,2
sb	$9,0($20)
addu	$5,$5,$6
addu	$8,$8,$4
addu	$7,$25,$7
addu	$4,$17,$15
addiu	$2,$2,15
lbu	$13,0($7)
addu	$9,$10,$14
addu	$8,$8,$3
addu	$2,$2,$5
sll	$3,$4,3
lw	$5,16($sp)
sll	$4,$4,1
subu	$4,$4,$3
sll	$6,$9,1
sra	$8,$8,5
sb	$13,0($5)
addu	$6,$6,$9
addu	$7,$17,$18
subu	$3,$0,$12
addu	$2,$2,$4
addu	$8,$25,$8
lbu	$9,0($8)
lw	$13,12($sp)
sll	$4,$7,4
addu	$5,$10,$16
subu	$3,$3,$14
addu	$2,$2,$6
sll	$7,$7,2
addu	$6,$11,$15
addu	$7,$7,$4
addiu	$3,$3,15
sll	$4,$5,3
sra	$2,$2,5
sll	$5,$5,1
sb	$9,0($13)
subu	$5,$5,$4
addu	$8,$10,$17
addu	$3,$3,$7
addu	$2,$25,$2
sll	$7,$6,1
subu	$4,$0,$21
lbu	$13,0($2)
lw	$14,8($sp)
addu	$7,$7,$6
addu	$3,$3,$5
addu	$6,$11,$18
sll	$5,$8,4
subu	$4,$4,$15
sll	$8,$8,2
addu	$8,$8,$5
sll	$2,$6,3
addu	$3,$3,$7
addiu	$4,$4,15
sll	$6,$6,1
sb	$13,0($14)
addu	$9,$12,$16
subu	$6,$6,$2
addu	$4,$4,$8
sra	$3,$3,5
addu	$8,$11,$10
subu	$5,$0,$22
lw	$20,160($sp)
sll	$7,$9,1
addu	$4,$4,$6
addu	$3,$25,$3
sll	$6,$8,4
subu	$5,$5,$16
sll	$8,$8,2
lbu	$13,0($3)
addu	$7,$7,$9
addu	$2,$12,$17
addu	$8,$8,$6
addiu	$5,$5,15
sll	$3,$2,3
addu	$9,$21,$18
addu	$4,$4,$7
addu	$5,$5,$8
sll	$2,$2,1
addu	$8,$20,$fp
sb	$13,0($8)
addu	$7,$12,$11
subu	$2,$2,$3
sll	$6,$9,1
sra	$4,$4,5
subu	$3,$0,$24
lw	$20,156($sp)
addu	$6,$6,$9
addu	$5,$5,$2
addu	$4,$25,$4
sll	$2,$7,4
subu	$3,$3,$18
sll	$7,$7,2
lbu	$15,0($4)
addu	$7,$7,$2
addu	$5,$5,$6
addiu	$3,$3,15
lw	$6,116($sp)
addu	$14,$22,$17
addu	$3,$3,$7
sra	$5,$5,5
addu	$7,$20,$fp
sb	$15,0($7)
addu	$8,$21,$10
addu	$9,$21,$12
subu	$2,$0,$6
addu	$5,$25,$5
sll	$6,$14,1
sll	$4,$8,3
sll	$13,$9,4
addu	$6,$6,$14
sll	$8,$8,1
lbu	$14,0($5)
sll	$9,$9,2
lw	$5,112($sp)
subu	$8,$8,$4
addu	$9,$9,$13
addu	$13,$24,$10
addu	$3,$3,$8
subu	$8,$0,$5
sll	$5,$13,1
addu	$4,$22,$11
addu	$5,$5,$13
lw	$13,152($sp)
sll	$7,$4,3
sll	$4,$4,1
subu	$4,$4,$7
subu	$2,$2,$17
addu	$7,$13,$fp
sb	$14,0($7)
addu	$3,$3,$6
addiu	$2,$2,15
lw	$14,116($sp)
addu	$2,$2,$9
addu	$6,$22,$21
sra	$3,$3,5
lw	$20,164($sp)
sll	$9,$6,4
addu	$2,$2,$4
subu	$10,$8,$10
addu	$4,$24,$12
addu	$3,$25,$3
sll	$6,$6,2
lbu	$13,0($3)
addu	$6,$6,$9
addu	$2,$2,$5
addu	$9,$14,$11
sll	$5,$4,3
addiu	$10,$10,15
sll	$4,$4,1
subu	$4,$4,$5
subu	$7,$0,$23
addu	$10,$10,$6
addu	$5,$24,$22
addu	$6,$20,$fp
sll	$3,$9,1
sb	$13,0($6)
addu	$3,$3,$9
addu	$10,$10,$4
sll	$9,$5,4
subu	$11,$7,$11
sll	$5,$5,2
addu	$5,$5,$9
addu	$10,$10,$3
sra	$2,$2,5
lw	$3,112($sp)
addiu	$11,$11,15
addu	$4,$14,$21
addu	$2,$25,$2
addu	$11,$11,$5
lw	$5,148($sp)
addu	$9,$3,$12
lbu	$13,0($2)
sll	$2,$4,3
sll	$4,$4,1
addu	$6,$5,$fp
subu	$4,$4,$2
sll	$2,$9,1
sb	$13,0($6)
addu	$2,$2,$9
lw	$9,112($sp)
subu	$3,$0,$19
addu	$5,$14,$24
sra	$10,$10,5
sll	$6,$5,4
addu	$11,$11,$4
addu	$10,$25,$10
addu	$4,$9,$22
subu	$12,$3,$12
sll	$5,$5,2
lbu	$13,0($10)
addu	$9,$23,$21
lw	$10,144($sp)
addu	$5,$5,$6
addu	$11,$11,$2
addiu	$12,$12,15
sll	$2,$4,3
sll	$4,$4,1
lw	$20,112($sp)
subu	$4,$4,$2
addu	$12,$12,$5
sll	$2,$9,1
addu	$6,$10,$fp
addu	$2,$2,$9
addu	$12,$12,$4
addu	$4,$23,$24
sb	$13,0($6)
addu	$5,$20,$14
addu	$12,$12,$2
sra	$11,$11,5
sll	$2,$4,3
sll	$4,$4,1
sll	$6,$5,4
subu	$4,$4,$2
subu	$3,$3,$21
lw	$2,140($sp)
addu	$11,$25,$11
sll	$5,$5,2
lbu	$10,0($11)
addu	$5,$5,$6
addiu	$3,$3,15
addu	$6,$2,$fp
addu	$3,$3,$5
addu	$5,$23,$20
sb	$10,0($6)
subu	$7,$7,$22
sll	$6,$5,4
sll	$5,$5,2
addu	$9,$19,$22
addu	$5,$5,$6
sra	$12,$12,5
addiu	$7,$7,15
sll	$2,$9,1
addu	$7,$7,$5
addu	$12,$25,$12
lw	$5,168($sp)
lbu	$10,0($12)
addu	$2,$2,$9
addu	$3,$3,$4
addu	$4,$19,$14
addu	$9,$19,$24
addu	$6,$5,$fp
addu	$3,$3,$2
sll	$2,$4,3
sll	$4,$4,1
sb	$10,0($6)
subu	$4,$4,$2
sll	$5,$9,1
sra	$3,$3,5
lw	$6,136($sp)
addu	$2,$19,$23
addu	$5,$5,$9
addu	$19,$19,$20
addu	$7,$7,$4
addu	$3,$25,$3
addu	$7,$7,$5
lbu	$5,0($3)
sll	$3,$19,3
sll	$19,$19,1
sll	$4,$2,4
subu	$19,$19,$3
subu	$8,$8,$24
addu	$3,$6,$fp
sll	$2,$2,2
sra	$7,$7,5
sb	$5,0($3)
addu	$23,$23,$14
addu	$2,$2,$4
addu	$7,$25,$7
addiu	$8,$8,15
lbu	$3,0($7)
addu	$8,$8,$2
lw	$7,132($sp)
sll	$2,$23,1
addu	$2,$2,$23
addu	$8,$8,$19
addu	$8,$8,$2
addu	$2,$7,$fp
sb	$3,0($2)
sra	$8,$8,5
lw	$9,128($sp)
addu	$8,$25,$8
lbu	$3,0($8)
addu	$2,$9,$fp
sb	$3,0($2)
lw	$10,220($sp)
lw	$13,84($sp)
lw	$14,80($sp)
lw	$20,76($sp)
lw	$2,72($sp)
lw	$3,68($sp)
lw	$4,64($sp)
addiu	$10,$10,1
addiu	$13,$13,1
addiu	$14,$14,1
addiu	$20,$20,1
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
sw	$10,220($sp)
sw	$13,84($sp)
sw	$14,80($sp)
sw	$20,76($sp)
sw	$2,72($sp)
sw	$3,68($sp)
sw	$4,64($sp)
lw	$5,60($sp)
lw	$6,56($sp)
lw	$7,52($sp)
addiu	$5,$5,1
addiu	$6,$6,1
addiu	$7,$7,1
lw	$9,48($sp)
lw	$10,44($sp)
lw	$13,40($sp)
lw	$14,36($sp)
lw	$20,32($sp)
lw	$2,28($sp)
lw	$3,24($sp)
lw	$4,20($sp)
sw	$5,60($sp)
sw	$6,56($sp)
lw	$5,16($sp)
lw	$6,12($sp)
sw	$7,52($sp)
lw	$7,8($sp)
addiu	$9,$9,1
sw	$9,48($sp)
addiu	$10,$10,1
addiu	$13,$13,1
addiu	$14,$14,1
addiu	$20,$20,1
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
addiu	$6,$6,1
addiu	$7,$7,1
addiu	$fp,$fp,1
li	$9,16			# 0x10
sw	$10,44($sp)
sw	$13,40($sp)
sw	$14,36($sp)
sw	$20,32($sp)
sw	$2,28($sp)
sw	$3,24($sp)
sw	$4,20($sp)
sw	$5,16($sp)
sw	$6,12($sp)
bne	$fp,$9,$L497
sw	$7,8($sp)

lw	$fp,212($sp)
lw	$23,208($sp)
lw	$22,204($sp)
lw	$21,200($sp)
lw	$20,196($sp)
lw	$19,192($sp)
lw	$18,188($sp)
lw	$17,184($sp)
lw	$16,180($sp)
j	$31
addiu	$sp,$sp,216

.set	macro
.set	reorder
.end	put_no_rnd_mpeg4_qpel16_v_lowpass
.align	2
.ent	put_no_rnd_qpel8_mc00_c
.type	put_no_rnd_qpel8_mc00_c, @function
put_no_rnd_qpel8_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$0
li	$8,8			# 0x8
$L501:
lwl	$2,3($5)
addiu	$7,$7,1
lwr	$2,0($5)
sw	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($4)
bne	$7,$8,$L501
addu	$4,$4,$6

j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc00_c
.align	2
.ent	put_no_rnd_qpel8_mc20_c
.type	put_no_rnd_qpel8_mc20_c, @function
put_no_rnd_qpel8_mc20_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 24, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
sw	$31,36($sp)
.cprestore	24
move	$7,$6
li	$2,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

lw	$31,36($sp)
lw	$28,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc20_c
.align	2
.ent	put_no_rnd_qpel8_mc02_c
.type	put_no_rnd_qpel8_mc02_c, @function
put_no_rnd_qpel8_mc02_c:
.set	nomips16
.frame	$sp,176,$31		# vars= 144, regs= 1/0, args= 16, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-176
sw	$31,172($sp)
.cprestore	16
addiu	$9,$sp,24
move	$7,$9
addiu	$8,$sp,168
$L507:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($7)
swr	$2,0($7)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($7)
swr	$3,4($7)
lbu	$2,8($5)
sb	$2,8($7)
addiu	$7,$7,16
bne	$7,$8,$L507
addu	$5,$5,$6

move	$5,$9
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,172($sp)
lw	$28,16($sp)
j	$31
addiu	$sp,$sp,176

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc02_c
.align	2
.ent	put_no_rnd_qpel8_mc22_c
.type	put_no_rnd_qpel8_mc22_c, @function
put_no_rnd_qpel8_mc22_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 72, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$18,112($sp)
sw	$17,108($sp)
sw	$16,104($sp)
.cprestore	24
move	$17,$6
addiu	$16,$sp,32
move	$18,$4
move	$7,$17
move	$4,$16
li	$2,9			# 0x9
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$4,$18
move	$5,$16
move	$6,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,116($sp)
lw	$28,24($sp)
lw	$18,112($sp)
lw	$17,108($sp)
lw	$16,104($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc22_c
.align	2
.ent	put_no_rnd_qpel16_mc00_c
.type	put_no_rnd_qpel16_mc00_c, @function
put_no_rnd_qpel16_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	put_no_rnd_pixels16_c
.option	pic2
li	$7,16			# 0x10

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc00_c
.align	2
.ent	put_no_rnd_qpel16_mc20_c
.type	put_no_rnd_qpel16_mc20_c, @function
put_no_rnd_qpel16_mc20_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 24, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
sw	$31,36($sp)
.cprestore	24
move	$7,$6
li	$2,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

lw	$31,36($sp)
lw	$28,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc20_c
.align	2
.ent	put_no_rnd_qpel16_mc22_c
.type	put_no_rnd_qpel16_mc22_c, @function
put_no_rnd_qpel16_mc22_c:
.set	nomips16
.frame	$sp,320,$31		# vars= 272, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-320
sw	$31,316($sp)
sw	$18,312($sp)
sw	$17,308($sp)
sw	$16,304($sp)
.cprestore	24
move	$17,$6
addiu	$16,$sp,32
move	$18,$4
move	$7,$17
move	$4,$16
li	$2,17			# 0x11
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$4,$18
move	$5,$16
move	$6,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,316($sp)
lw	$28,24($sp)
lw	$18,312($sp)
lw	$17,308($sp)
lw	$16,304($sp)
j	$31
addiu	$sp,$sp,320

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc22_c
.align	2
.ent	avg_mpeg4_qpel8_v_lowpass
.type	avg_mpeg4_qpel8_v_lowpass, @function
avg_mpeg4_qpel8_v_lowpass:
.set	nomips16
.frame	$sp,88,$31		# vars= 40, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-88
sw	$fp,84($sp)
sw	$23,80($sp)
sw	$22,76($sp)
sw	$21,72($sp)
sw	$20,68($sp)
sw	$19,64($sp)
sw	$18,60($sp)
sw	$17,56($sp)
sw	$16,52($sp)
.cprestore	0
sll	$9,$7,1
move	$18,$5
sll	$8,$7,3
sll	$10,$6,1
sll	$14,$7,2
addu	$2,$9,$7
move	$24,$4
addu	$5,$14,$7
subu	$11,$8,$9
subu	$12,$8,$7
sll	$16,$6,2
sll	$3,$6,3
addu	$2,$18,$2
addu	$4,$10,$6
subu	$15,$3,$6
addu	$13,$16,$6
subu	$3,$3,$10
sw	$2,32($sp)
addu	$5,$18,$5
addu	$11,$18,$11
addu	$12,$18,$12
addu	$8,$18,$8
addu	$4,$24,$4
lui	$2,%hi(ff_cropTbl+1024)
addu	$7,$18,$7
addu	$9,$18,$9
addu	$14,$18,$14
sw	$5,24($sp)
sw	$11,20($sp)
sw	$12,16($sp)
sw	$8,12($sp)
sw	$4,8($sp)
addu	$fp,$24,$13
addu	$23,$24,$3
addu	$22,$24,$15
addiu	$25,$2,%lo(ff_cropTbl+1024)
sw	$7,40($sp)
sw	$9,36($sp)
sw	$14,28($sp)
addu	$21,$24,$6
addu	$20,$24,$10
addu	$19,$24,$16
sw	$0,44($sp)
$L519:
lw	$2,28($sp)
lw	$3,40($sp)
lw	$4,36($sp)
lbu	$16,0($2)
lbu	$7,0($3)
lbu	$9,0($18)
lbu	$13,0($4)
lw	$5,32($sp)
addu	$3,$7,$9
subu	$2,$0,$16
lbu	$15,0($5)
addu	$4,$13,$9
sll	$5,$3,4
subu	$2,$2,$13
sll	$3,$3,2
addu	$3,$3,$5
addiu	$2,$2,16
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$2,$2,$3
addu	$6,$15,$7
addu	$2,$2,$4
lw	$4,24($sp)
sll	$3,$6,1
lbu	$17,0($4)
addu	$3,$3,$6
addu	$2,$2,$3
addu	$6,$13,$7
sra	$2,$2,5
subu	$3,$0,$17
sll	$8,$6,4
addu	$5,$15,$9
addu	$2,$25,$2
subu	$3,$3,$7
sll	$6,$6,2
lbu	$10,0($2)
addu	$6,$6,$8
sll	$2,$5,3
addiu	$3,$3,16
sll	$5,$5,1
lbu	$4,0($24)
addu	$8,$16,$9
subu	$5,$5,$2
addu	$3,$3,$6
sll	$2,$8,1
addu	$3,$3,$5
lw	$5,20($sp)
addu	$2,$2,$8
addiu	$4,$4,1
lbu	$14,0($5)
addu	$4,$4,$10
lw	$5,12($sp)
addu	$3,$3,$2
lw	$2,16($sp)
sra	$4,$4,1
lbu	$11,0($2)
lbu	$10,0($5)
addu	$2,$15,$13
sb	$4,0($24)
li	$5,16			# 0x10
sra	$3,$3,5
lbu	$4,0($21)
subu	$6,$5,$9
sll	$8,$2,4
addu	$5,$16,$7
addu	$3,$25,$3
sll	$2,$2,2
lbu	$12,0($3)
addu	$2,$2,$8
addu	$9,$17,$9
sll	$8,$5,3
subu	$3,$6,$14
sll	$5,$5,1
subu	$5,$5,$8
addu	$3,$3,$2
addiu	$4,$4,1
sll	$2,$9,1
addu	$2,$2,$9
addu	$3,$3,$5
addu	$4,$4,$12
addu	$3,$3,$2
sra	$4,$4,1
sb	$4,0($21)
sra	$3,$3,5
lbu	$4,0($20)
addu	$3,$25,$3
lbu	$9,0($3)
addu	$2,$16,$15
sll	$8,$2,4
addu	$5,$17,$13
sll	$2,$2,2
addiu	$4,$4,1
addu	$2,$2,$8
sll	$3,$5,3
addu	$8,$14,$7
subu	$6,$6,$11
addu	$4,$4,$9
sll	$5,$5,1
subu	$5,$5,$3
addu	$6,$6,$2
sra	$4,$4,1
sll	$2,$8,1
sb	$4,0($20)
addu	$2,$2,$8
addu	$6,$6,$5
lw	$4,8($sp)
addu	$6,$6,$2
subu	$5,$0,$10
addu	$2,$17,$16
sra	$6,$6,5
lbu	$3,0($4)
sll	$8,$2,4
addu	$6,$25,$6
subu	$7,$5,$7
addu	$4,$14,$15
sll	$2,$2,2
lbu	$9,0($6)
addu	$2,$2,$8
sll	$6,$4,3
addu	$8,$11,$13
addiu	$7,$7,16
sll	$4,$4,1
subu	$4,$4,$6
addu	$7,$7,$2
sll	$2,$8,1
addu	$2,$2,$8
addu	$7,$7,$4
addiu	$3,$3,1
addu	$7,$7,$2
addu	$3,$3,$9
lw	$2,8($sp)
sra	$3,$3,1
sb	$3,0($2)
sra	$7,$7,5
addu	$2,$14,$17
sll	$6,$2,4
addu	$4,$11,$16
addu	$7,$25,$7
subu	$5,$5,$13
sll	$2,$2,2
lbu	$8,0($7)
lbu	$3,0($19)
addu	$7,$10,$15
addu	$2,$2,$6
addiu	$5,$5,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$5,$5,$2
sll	$2,$7,1
addu	$2,$2,$7
addu	$5,$5,$4
addiu	$3,$3,1
addu	$3,$3,$8
addu	$5,$5,$2
sra	$3,$3,1
addu	$2,$11,$14
subu	$4,$0,$11
sra	$5,$5,5
sb	$3,0($19)
sll	$7,$2,4
lbu	$3,0($fp)
addu	$6,$10,$17
addu	$5,$25,$5
subu	$4,$4,$15
sll	$2,$2,2
lbu	$8,0($5)
addu	$2,$2,$7
sll	$5,$6,3
addu	$7,$10,$16
addiu	$4,$4,16
sll	$6,$6,1
subu	$6,$6,$5
addu	$4,$4,$2
addiu	$3,$3,1
sll	$2,$7,1
addu	$2,$2,$7
addu	$4,$4,$6
addu	$3,$3,$8
addu	$4,$4,$2
sra	$3,$3,1
sb	$3,0($fp)
addu	$2,$10,$11
sra	$4,$4,5
subu	$3,$0,$14
lbu	$5,0($23)
addu	$10,$10,$14
addu	$4,$25,$4
sll	$6,$2,4
subu	$3,$3,$16
sll	$2,$2,2
lbu	$7,0($4)
addu	$11,$11,$17
sll	$4,$10,3
addu	$2,$2,$6
addiu	$3,$3,16
sll	$10,$10,1
addu	$3,$3,$2
subu	$10,$10,$4
addiu	$5,$5,1
sll	$2,$11,1
addu	$2,$2,$11
addu	$5,$5,$7
addu	$3,$3,$10
addu	$3,$3,$2
sra	$5,$5,1
sb	$5,0($23)
sra	$3,$3,5
lbu	$2,0($22)
addu	$3,$25,$3
lbu	$4,0($3)
addiu	$2,$2,1
lw	$3,44($sp)
addu	$2,$2,$4
sra	$2,$2,1
addiu	$3,$3,1
sw	$3,44($sp)
sb	$2,0($22)
lw	$4,40($sp)
lw	$5,36($sp)
addiu	$4,$4,1
lw	$2,32($sp)
addiu	$5,$5,1
lw	$3,28($sp)
sw	$4,40($sp)
lw	$4,24($sp)
addiu	$2,$2,1
sw	$5,36($sp)
lw	$5,20($sp)
addiu	$3,$3,1
addiu	$4,$4,1
sw	$2,32($sp)
lw	$2,16($sp)
addiu	$5,$5,1
sw	$3,28($sp)
sw	$4,24($sp)
lw	$3,12($sp)
lw	$4,8($sp)
addiu	$2,$2,1
sw	$5,20($sp)
lw	$5,44($sp)
sw	$2,16($sp)
addiu	$3,$3,1
addiu	$4,$4,1
li	$2,8			# 0x8
addiu	$24,$24,1
addiu	$18,$18,1
sw	$3,12($sp)
addiu	$21,$21,1
addiu	$20,$20,1
sw	$4,8($sp)
addiu	$19,$19,1
addiu	$fp,$fp,1
addiu	$23,$23,1
bne	$5,$2,$L519
addiu	$22,$22,1

lw	$fp,84($sp)
lw	$23,80($sp)
lw	$22,76($sp)
lw	$21,72($sp)
lw	$20,68($sp)
lw	$19,64($sp)
lw	$18,60($sp)
lw	$17,56($sp)
lw	$16,52($sp)
j	$31
addiu	$sp,$sp,88

.set	macro
.set	reorder
.end	avg_mpeg4_qpel8_v_lowpass
.align	2
.ent	avg_mpeg4_qpel16_v_lowpass
.type	avg_mpeg4_qpel16_v_lowpass, @function
avg_mpeg4_qpel16_v_lowpass:
.set	nomips16
.frame	$sp,224,$31		# vars= 176, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-224
sw	$fp,220($sp)
sw	$23,216($sp)
sw	$22,212($sp)
sw	$21,208($sp)
sw	$20,204($sp)
sw	$19,200($sp)
sw	$18,196($sp)
sw	$17,192($sp)
sw	$16,188($sp)
.cprestore	0
sll	$fp,$6,2
sll	$2,$6,4
subu	$3,$2,$fp
sll	$11,$7,1
sw	$3,124($sp)
sll	$3,$7,3
addu	$19,$11,$3
sll	$16,$7,4
sll	$17,$7,2
sw	$19,104($sp)
lw	$19,124($sp)
subu	$15,$16,$17
sw	$5,228($sp)
move	$18,$4
sll	$12,$6,1
subu	$4,$15,$7
addu	$5,$15,$7
subu	$13,$19,$6
lw	$19,228($sp)
subu	$8,$2,$6
addu	$10,$3,$7
lw	$9,124($sp)
sw	$4,100($sp)
subu	$2,$2,$12
addu	$4,$12,$6
sw	$5,96($sp)
addu	$5,$fp,$6
sw	$8,128($sp)
subu	$24,$3,$11
subu	$25,$3,$7
sw	$10,108($sp)
addu	$3,$19,$3
addu	$4,$18,$4
addu	$5,$18,$5
addu	$2,$18,$2
sll	$14,$6,3
subu	$8,$16,$11
addu	$23,$9,$6
sw	$4,56($sp)
subu	$9,$16,$7
sw	$5,48($sp)
sw	$2,12($sp)
sw	$3,172($sp)
lw	$2,128($sp)
lw	$3,108($sp)
lw	$4,104($sp)
lw	$5,100($sp)
addu	$21,$17,$7
addu	$20,$11,$7
addu	$22,$12,$14
addu	$10,$14,$6
sw	$8,92($sp)
sw	$9,88($sp)
subu	$8,$14,$12
subu	$9,$14,$6
addu	$3,$19,$3
addu	$20,$19,$20
addu	$21,$19,$21
addu	$8,$18,$8
addu	$9,$18,$9
addu	$10,$18,$10
addu	$2,$18,$2
addu	$24,$19,$24
addu	$25,$19,$25
addu	$4,$19,$4
addu	$5,$19,$5
addu	$22,$18,$22
addu	$13,$18,$13
addu	$23,$18,$23
sw	$8,44($sp)
sw	$9,40($sp)
sw	$10,32($sp)
sw	$2,8($sp)
sw	$3,160($sp)
sw	$20,76($sp)
sw	$21,68($sp)
sw	$22,28($sp)
sw	$13,24($sp)
sw	$23,16($sp)
sw	$24,168($sp)
sw	$25,164($sp)
sw	$4,156($sp)
sw	$5,152($sp)
lw	$8,96($sp)
lw	$9,92($sp)
lw	$10,88($sp)
lui	$2,%hi(ff_cropTbl+1024)
addu	$15,$19,$15
addu	$8,$19,$8
addu	$9,$19,$9
addu	$10,$19,$10
addu	$16,$19,$16
lw	$3,124($sp)
addiu	$19,$2,%lo(ff_cropTbl+1024)
lw	$2,228($sp)
addu	$fp,$18,$fp
addu	$7,$2,$7
addu	$11,$2,$11
addu	$17,$2,$17
addu	$6,$18,$6
addu	$12,$18,$12
addu	$14,$18,$14
addu	$3,$18,$3
sw	$fp,52($sp)
sw	$15,180($sp)
sw	$8,148($sp)
sw	$9,144($sp)
sw	$10,140($sp)
sw	$16,176($sp)
sw	$7,84($sp)
sw	$11,80($sp)
sw	$17,72($sp)
sw	$6,64($sp)
sw	$12,60($sp)
sw	$14,36($sp)
sw	$3,20($sp)
move	$fp,$0
$L523:
lw	$4,228($sp)
lw	$5,72($sp)
lw	$6,84($sp)
addu	$2,$4,$fp
lw	$7,80($sp)
lbu	$23,0($5)
lbu	$8,0($2)
lbu	$13,0($6)
lw	$9,76($sp)
lbu	$20,0($7)
lbu	$21,0($9)
addu	$3,$13,$8
subu	$2,$0,$23
sll	$5,$3,4
addu	$4,$20,$8
subu	$2,$2,$20
sll	$3,$3,2
addu	$3,$3,$5
addu	$6,$21,$13
sll	$5,$4,3
addiu	$2,$2,16
sll	$4,$4,1
subu	$4,$4,$5
lw	$10,68($sp)
addu	$2,$2,$3
sll	$3,$6,1
addu	$3,$3,$6
addu	$2,$2,$4
lbu	$24,0($10)
addu	$2,$2,$3
addu	$5,$20,$13
sra	$2,$2,5
lbu	$6,0($18)
sll	$7,$5,4
addu	$4,$21,$8
addu	$2,$19,$2
subu	$3,$0,$24
sll	$5,$5,2
lbu	$9,0($2)
addu	$5,$5,$7
sll	$2,$4,3
addu	$7,$23,$8
subu	$3,$3,$13
sll	$4,$4,1
subu	$4,$4,$2
addiu	$3,$3,16
sll	$2,$7,1
addiu	$6,$6,1
addu	$2,$2,$7
lw	$11,168($sp)
lw	$7,172($sp)
lw	$10,156($sp)
addu	$3,$3,$5
addu	$6,$6,$9
lw	$5,164($sp)
lw	$9,160($sp)
addu	$3,$3,$4
addu	$3,$3,$2
addu	$4,$5,$fp
addu	$2,$11,$fp
addu	$5,$7,$fp
lw	$11,152($sp)
addu	$7,$9,$fp
addu	$9,$10,$fp
lw	$10,180($sp)
addu	$14,$11,$fp
addu	$15,$10,$fp
lw	$11,148($sp)
lw	$10,144($sp)
addu	$16,$11,$fp
addu	$17,$10,$fp
lw	$11,140($sp)
lw	$10,176($sp)
addu	$11,$11,$fp
addu	$10,$10,$fp
sw	$11,132($sp)
sw	$10,136($sp)
lbu	$14,0($14)
lbu	$22,0($2)
lbu	$10,0($4)
lbu	$11,0($5)
lbu	$12,0($7)
lbu	$25,0($9)
sw	$14,120($sp)
lbu	$15,0($15)
lw	$2,132($sp)
sw	$15,116($sp)
lbu	$16,0($16)
lw	$4,136($sp)
sw	$16,112($sp)
sra	$6,$6,1
lbu	$15,0($2)
lbu	$14,0($4)
lbu	$16,0($17)
sb	$6,0($18)
lw	$5,64($sp)
addu	$2,$21,$20
li	$9,16			# 0x10
sra	$3,$3,5
lbu	$4,0($5)
subu	$6,$9,$8
sll	$7,$2,4
addu	$3,$19,$3
addu	$5,$23,$13
sll	$2,$2,2
lbu	$9,0($3)
addu	$2,$2,$7
addu	$8,$24,$8
sll	$7,$5,3
subu	$3,$6,$22
sll	$5,$5,1
subu	$5,$5,$7
addu	$3,$3,$2
sll	$2,$8,1
addu	$2,$2,$8
addu	$3,$3,$5
addiu	$4,$4,1
addu	$4,$4,$9
addu	$3,$3,$2
lw	$2,64($sp)
sra	$4,$4,1
sb	$4,0($2)
lw	$5,60($sp)
addu	$2,$23,$21
sra	$3,$3,5
lbu	$4,0($5)
sll	$7,$2,4
addu	$3,$19,$3
sll	$2,$2,2
lbu	$8,0($3)
addu	$2,$2,$7
subu	$6,$6,$10
addu	$7,$22,$13
addu	$5,$24,$20
addu	$6,$6,$2
addiu	$4,$4,1
sll	$2,$7,1
sll	$3,$5,3
addu	$2,$2,$7
addu	$4,$4,$8
lw	$7,60($sp)
sll	$5,$5,1
subu	$5,$5,$3
sra	$4,$4,1
sb	$4,0($7)
addu	$6,$6,$5
lw	$8,56($sp)
addu	$6,$6,$2
sra	$6,$6,5
lbu	$4,0($8)
addu	$6,$19,$6
lbu	$8,0($6)
addu	$2,$24,$23
subu	$3,$0,$11
sll	$7,$2,4
addu	$5,$22,$21
subu	$3,$3,$13
sll	$2,$2,2
addiu	$4,$4,1
lw	$9,56($sp)
addu	$2,$2,$7
sll	$6,$5,3
addu	$7,$10,$20
addu	$4,$4,$8
addiu	$3,$3,16
sll	$5,$5,1
subu	$5,$5,$6
addu	$3,$3,$2
sra	$4,$4,1
sll	$2,$7,1
sb	$4,0($9)
addu	$2,$2,$7
addu	$3,$3,$5
lw	$6,52($sp)
addu	$3,$3,$2
subu	$4,$0,$12
addu	$2,$22,$24
sra	$3,$3,5
lbu	$5,0($6)
sll	$7,$2,4
addu	$3,$19,$3
subu	$4,$4,$20
sll	$2,$2,2
lbu	$8,0($3)
addu	$2,$2,$7
addiu	$4,$4,16
addu	$7,$11,$21
addu	$6,$10,$23
addu	$4,$4,$2
addiu	$5,$5,1
sll	$2,$7,1
sll	$3,$6,3
addu	$2,$2,$7
addu	$5,$5,$8
lw	$7,52($sp)
sll	$6,$6,1
subu	$6,$6,$3
sra	$5,$5,1
sb	$5,0($7)
addu	$4,$4,$6
addu	$3,$10,$22
lw	$9,48($sp)
addu	$4,$4,$2
sll	$5,$3,4
subu	$2,$0,$25
sra	$4,$4,5
sll	$3,$3,2
addu	$3,$3,$5
addu	$4,$19,$4
lbu	$5,0($9)
subu	$2,$2,$21
addu	$7,$12,$23
lbu	$9,0($4)
addu	$6,$11,$24
addiu	$2,$2,16
sll	$8,$6,3
addu	$2,$2,$3
sll	$6,$6,1
sll	$3,$7,1
addiu	$5,$5,1
subu	$6,$6,$8
addu	$3,$3,$7
addu	$5,$5,$9
lw	$7,48($sp)
addu	$2,$2,$6
sra	$5,$5,1
addu	$2,$2,$3
lw	$3,120($sp)
sb	$5,0($7)
lw	$8,44($sp)
sra	$2,$2,5
subu	$4,$0,$3
addu	$2,$19,$2
lbu	$3,0($8)
lbu	$8,0($2)
addu	$6,$11,$10
addiu	$3,$3,1
lw	$9,44($sp)
sll	$7,$6,4
addu	$5,$12,$22
addu	$3,$3,$8
subu	$4,$4,$23
sll	$6,$6,2
addu	$6,$6,$7
sll	$2,$5,3
addu	$7,$25,$24
sra	$3,$3,1
addiu	$4,$4,16
sll	$5,$5,1
sb	$3,0($9)
subu	$5,$5,$2
addu	$4,$4,$6
sll	$2,$7,1
addu	$2,$2,$7
addu	$4,$4,$5
lw	$5,116($sp)
lw	$6,40($sp)
addu	$4,$4,$2
lw	$9,120($sp)
addu	$2,$12,$11
subu	$3,$0,$5
sra	$4,$4,5
lbu	$5,0($6)
sll	$7,$2,4
addu	$6,$25,$10
addu	$4,$19,$4
subu	$3,$3,$24
sll	$2,$2,2
lbu	$8,0($4)
addu	$2,$2,$7
sll	$4,$6,3
addu	$7,$9,$22
addiu	$3,$3,16
sll	$6,$6,1
subu	$6,$6,$4
addu	$3,$3,$2
sll	$2,$7,1
addu	$2,$2,$7
addu	$3,$3,$6
addiu	$5,$5,1
addu	$5,$5,$8
addu	$3,$3,$2
lw	$2,40($sp)
sra	$5,$5,1
sb	$5,0($2)
lw	$5,112($sp)
lw	$6,36($sp)
addu	$2,$25,$12
subu	$4,$0,$5
sra	$3,$3,5
lbu	$5,0($6)
addu	$6,$9,$11
lw	$9,116($sp)
sll	$7,$2,4
addu	$3,$19,$3
subu	$4,$4,$22
sll	$2,$2,2
lbu	$8,0($3)
addu	$2,$2,$7
sll	$3,$6,3
addu	$7,$9,$10
addiu	$4,$4,16
sll	$6,$6,1
subu	$6,$6,$3
addu	$4,$4,$2
sll	$2,$7,1
addu	$2,$2,$7
addu	$4,$4,$6
addiu	$5,$5,1
addu	$5,$5,$8
addu	$4,$4,$2
lw	$2,36($sp)
sra	$5,$5,1
sb	$5,0($2)
lw	$3,120($sp)
lw	$5,32($sp)
addu	$2,$3,$25
subu	$8,$0,$16
lbu	$3,0($5)
sra	$4,$4,5
addu	$5,$9,$12
lw	$9,112($sp)
sll	$6,$2,4
addu	$4,$19,$4
subu	$10,$8,$10
sll	$2,$2,2
lbu	$7,0($4)
addu	$2,$2,$6
sll	$4,$5,3
addu	$6,$9,$11
addiu	$10,$10,16
sll	$5,$5,1
subu	$5,$5,$4
addu	$10,$10,$2
sll	$2,$6,1
addu	$2,$2,$6
addu	$10,$10,$5
addiu	$3,$3,1
addu	$3,$3,$7
addu	$10,$10,$2
lw	$2,32($sp)
sra	$3,$3,1
sb	$3,0($2)
lw	$3,116($sp)
lw	$4,120($sp)
lw	$7,28($sp)
sra	$10,$10,5
addu	$2,$3,$4
addu	$10,$19,$10
lbu	$3,0($7)
subu	$6,$0,$15
addu	$4,$9,$25
lbu	$9,0($10)
sll	$5,$2,4
subu	$11,$6,$11
sll	$2,$2,2
addiu	$3,$3,1
addu	$7,$16,$12
addu	$2,$2,$5
addu	$3,$3,$9
sll	$5,$4,3
lw	$9,28($sp)
addiu	$11,$11,16
sll	$4,$4,1
subu	$4,$4,$5
addu	$11,$11,$2
sra	$3,$3,1
sll	$2,$7,1
sb	$3,0($9)
addu	$2,$2,$7
addu	$11,$11,$4
lw	$10,112($sp)
lw	$3,116($sp)
lw	$5,24($sp)
addu	$11,$11,$2
sra	$11,$11,5
addu	$2,$10,$3
addu	$11,$19,$11
lbu	$3,0($5)
lbu	$10,0($11)
lw	$9,120($sp)
subu	$4,$0,$14
addiu	$3,$3,1
sll	$7,$2,4
addu	$5,$16,$9
subu	$12,$4,$12
addu	$3,$3,$10
sll	$2,$2,2
lw	$10,24($sp)
addu	$9,$15,$25
addu	$2,$2,$7
sra	$3,$3,1
sll	$7,$5,3
addiu	$12,$12,16
sll	$5,$5,1
sb	$3,0($10)
subu	$5,$5,$7
lw	$11,112($sp)
addu	$12,$12,$2
sll	$2,$9,1
addu	$2,$2,$9
addu	$12,$12,$5
lw	$9,116($sp)
lw	$5,20($sp)
addu	$12,$12,$2
addu	$2,$16,$11
lw	$11,120($sp)
lbu	$3,0($5)
sll	$7,$2,4
addu	$5,$15,$9
sra	$12,$12,5
subu	$4,$4,$25
sll	$2,$2,2
addu	$9,$14,$11
addu	$2,$2,$7
addu	$12,$19,$12
sll	$7,$5,3
addiu	$4,$4,16
sll	$5,$5,1
lbu	$10,0($12)
subu	$5,$5,$7
addu	$4,$4,$2
sll	$2,$9,1
addu	$2,$2,$9
addu	$4,$4,$5
addiu	$3,$3,1
addu	$3,$3,$10
addu	$4,$4,$2
lw	$2,20($sp)
sra	$3,$3,1
sb	$3,0($2)
lw	$5,16($sp)
lw	$9,112($sp)
sra	$4,$4,5
lbu	$3,0($5)
addu	$4,$19,$4
lw	$10,116($sp)
addu	$5,$14,$9
addu	$2,$15,$16
lbu	$9,0($4)
sll	$7,$2,4
subu	$6,$6,$11
sll	$2,$2,2
addiu	$3,$3,1
lw	$11,16($sp)
addu	$2,$2,$7
sll	$4,$5,3
addu	$7,$14,$10
addu	$3,$3,$9
addiu	$6,$6,16
sll	$5,$5,1
subu	$5,$5,$4
addu	$6,$6,$2
sra	$3,$3,1
sll	$2,$7,1
sb	$3,0($11)
addu	$2,$2,$7
addu	$6,$6,$5
addu	$6,$6,$2
lw	$5,12($sp)
sra	$6,$6,5
lbu	$3,0($5)
addu	$6,$19,$6
lbu	$5,0($6)
lw	$7,112($sp)
addu	$2,$14,$15
sll	$4,$2,4
addu	$14,$14,$16
subu	$8,$8,$10
sll	$2,$2,2
addiu	$3,$3,1
lw	$9,12($sp)
addu	$15,$15,$7
addu	$2,$2,$4
addu	$3,$3,$5
sll	$4,$14,3
addiu	$8,$8,16
sll	$14,$14,1
addu	$8,$8,$2
subu	$14,$14,$4
sra	$3,$3,1
sll	$2,$15,1
sb	$3,0($9)
addu	$2,$2,$15
addu	$8,$8,$14
lw	$10,8($sp)
addu	$8,$8,$2
sra	$8,$8,5
lbu	$2,0($10)
addu	$8,$19,$8
lbu	$3,0($8)
addiu	$2,$2,1
addu	$2,$2,$3
sra	$2,$2,1
sb	$2,0($10)
lw	$11,84($sp)
lw	$2,80($sp)
lw	$3,76($sp)
lw	$4,72($sp)
lw	$5,68($sp)
addiu	$11,$11,1
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
sw	$11,84($sp)
sw	$2,80($sp)
sw	$3,76($sp)
sw	$4,72($sp)
sw	$5,68($sp)
lw	$6,64($sp)
lw	$7,60($sp)
lw	$8,56($sp)
lw	$9,52($sp)
lw	$10,48($sp)
addiu	$6,$6,1
addiu	$7,$7,1
addiu	$8,$8,1
addiu	$9,$9,1
addiu	$10,$10,1
lw	$11,44($sp)
lw	$2,40($sp)
lw	$3,36($sp)
lw	$4,32($sp)
lw	$5,28($sp)
sw	$6,64($sp)
sw	$7,60($sp)
lw	$6,24($sp)
lw	$7,20($sp)
sw	$8,56($sp)
sw	$9,52($sp)
lw	$8,16($sp)
lw	$9,12($sp)
sw	$10,48($sp)
lw	$10,8($sp)
addiu	$11,$11,1
sw	$11,44($sp)
addiu	$2,$2,1
addiu	$3,$3,1
addiu	$4,$4,1
addiu	$5,$5,1
addiu	$6,$6,1
addiu	$7,$7,1
addiu	$8,$8,1
addiu	$9,$9,1
addiu	$10,$10,1
addiu	$fp,$fp,1
li	$11,16			# 0x10
addiu	$18,$18,1
sw	$2,40($sp)
sw	$3,36($sp)
sw	$4,32($sp)
sw	$5,28($sp)
sw	$6,24($sp)
sw	$7,20($sp)
sw	$8,16($sp)
sw	$9,12($sp)
bne	$fp,$11,$L523
sw	$10,8($sp)

lw	$fp,220($sp)
lw	$23,216($sp)
lw	$22,212($sp)
lw	$21,208($sp)
lw	$20,204($sp)
lw	$19,200($sp)
lw	$18,196($sp)
lw	$17,192($sp)
lw	$16,188($sp)
j	$31
addiu	$sp,$sp,224

.set	macro
.set	reorder
.end	avg_mpeg4_qpel16_v_lowpass
.align	2
.ent	avg_qpel8_mc00_c
.type	avg_qpel8_mc00_c, @function
avg_qpel8_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	avg_pixels8_c
.option	pic2
li	$7,8			# 0x8

.set	macro
.set	reorder
.end	avg_qpel8_mc00_c
.align	2
.ent	avg_qpel8_mc20_c
.type	avg_qpel8_mc20_c, @function
avg_qpel8_mc20_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$2,%hi(ff_cropTbl+1024)
move	$11,$4
move	$10,$5
move	$15,$6
addiu	$12,$2,%lo(ff_cropTbl+1024)
move	$13,$0
li	$14,16			# 0x10
li	$24,8			# 0x8
$L529:
lbu	$8,1($10)
lbu	$4,0($10)
lbu	$3,4($10)
lbu	$7,2($10)
lbu	$5,3($10)
addu	$2,$8,$4
subu	$3,$0,$3
addu	$4,$7,$4
sll	$6,$2,4
subu	$3,$3,$7
sll	$2,$2,2
addu	$5,$5,$8
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,0($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,0($11)
lbu	$7,1($10)
lbu	$3,5($10)
lbu	$2,2($10)
lbu	$8,0($10)
lbu	$4,3($10)
lbu	$5,4($10)
addu	$2,$2,$7
subu	$3,$0,$3
addu	$4,$4,$8
sll	$6,$2,4
subu	$3,$3,$7
sll	$2,$2,2
addu	$5,$5,$8
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,1($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,1($11)
lbu	$2,2($10)
lbu	$4,3($10)
lbu	$7,0($10)
lbu	$3,1($10)
lbu	$5,4($10)
lbu	$8,6($10)
lbu	$6,5($10)
addu	$4,$4,$2
addu	$5,$5,$3
sll	$2,$4,4
subu	$3,$14,$7
sll	$4,$4,2
addu	$6,$6,$7
addu	$4,$4,$2
sll	$7,$5,3
subu	$3,$3,$8
sll	$5,$5,1
subu	$5,$5,$7
addu	$3,$3,$4
sll	$2,$6,1
addu	$2,$2,$6
addu	$3,$3,$5
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,2($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,2($11)
lbu	$2,3($10)
lbu	$4,4($10)
lbu	$7,2($10)
lbu	$3,0($10)
lbu	$5,5($10)
lbu	$8,1($10)
lbu	$9,7($10)
lbu	$6,6($10)
addu	$4,$4,$2
sll	$2,$4,4
addu	$5,$5,$7
subu	$3,$14,$3
sll	$4,$4,2
addu	$6,$6,$8
addu	$4,$4,$2
sll	$7,$5,3
subu	$3,$3,$9
sll	$5,$5,1
subu	$5,$5,$7
addu	$3,$3,$4
sll	$2,$6,1
addu	$2,$2,$6
addu	$3,$3,$5
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,3($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,3($11)
lbu	$5,4($10)
lbu	$3,8($10)
lbu	$2,5($10)
lbu	$8,1($10)
lbu	$6,3($10)
lbu	$4,6($10)
lbu	$7,2($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,7($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,4($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,4($11)
lbu	$5,5($10)
lbu	$3,2($10)
lbu	$2,6($10)
lbu	$6,8($10)
lbu	$7,4($10)
lbu	$4,7($10)
lbu	$8,3($10)
addu	$2,$2,$5
subu	$3,$0,$3
addu	$4,$4,$7
sll	$5,$2,4
subu	$3,$3,$6
sll	$2,$2,2
addu	$6,$6,$8
addu	$2,$2,$5
addiu	$3,$3,16
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$3,$3,$2
sll	$2,$6,1
addu	$2,$2,$6
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,5($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,5($11)
lbu	$7,7($10)
lbu	$3,3($10)
lbu	$2,6($10)
lbu	$8,8($10)
lbu	$4,5($10)
lbu	$5,4($10)
addu	$2,$7,$2
subu	$3,$0,$3
addu	$4,$8,$4
sll	$6,$2,4
subu	$3,$3,$7
sll	$2,$2,2
addu	$5,$5,$8
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,6($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,6($11)
lbu	$8,7($10)
lbu	$4,8($10)
lbu	$3,4($10)
lbu	$7,6($10)
lbu	$5,5($10)
addu	$2,$4,$8
subu	$3,$0,$3
sll	$6,$2,4
addu	$4,$7,$4
subu	$3,$3,$7
sll	$2,$2,2
addu	$2,$2,$6
addu	$5,$5,$8
sll	$6,$4,3
addiu	$3,$3,16
sll	$4,$4,1
addu	$3,$3,$2
subu	$4,$4,$6
sll	$2,$5,1
addu	$3,$3,$4
addu	$2,$2,$5
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,7($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
addiu	$13,$13,1
sb	$2,7($11)
addu	$10,$10,$15
bne	$13,$24,$L529
addu	$11,$11,$15

j	$31
nop

.set	macro
.set	reorder
.end	avg_qpel8_mc20_c
.align	2
.ent	avg_qpel8_mc02_c
.type	avg_qpel8_mc02_c, @function
avg_qpel8_mc02_c:
.set	nomips16
.frame	$sp,176,$31		# vars= 144, regs= 1/0, args= 16, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-176
sw	$31,172($sp)
.cprestore	16
addiu	$9,$sp,24
move	$7,$9
addiu	$8,$sp,168
$L533:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($7)
swr	$2,0($7)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($7)
swr	$3,4($7)
lbu	$2,8($5)
sb	$2,8($7)
addiu	$7,$7,16
bne	$7,$8,$L533
addu	$5,$5,$6

move	$5,$9
.option	pic0
jal	avg_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,172($sp)
lw	$28,16($sp)
j	$31
addiu	$sp,$sp,176

.set	macro
.set	reorder
.end	avg_qpel8_mc02_c
.align	2
.ent	avg_qpel8_mc22_c
.type	avg_qpel8_mc22_c, @function
avg_qpel8_mc22_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 72, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$18,112($sp)
sw	$17,108($sp)
sw	$16,104($sp)
.cprestore	24
move	$17,$6
addiu	$16,$sp,32
move	$18,$4
move	$7,$17
move	$4,$16
li	$2,9			# 0x9
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$4,$18
move	$5,$16
move	$6,$17
.option	pic0
jal	avg_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,116($sp)
lw	$28,24($sp)
lw	$18,112($sp)
lw	$17,108($sp)
lw	$16,104($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	avg_qpel8_mc22_c
.align	2
.ent	avg_qpel16_mc00_c
.type	avg_qpel16_mc00_c, @function
avg_qpel16_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	avg_pixels16_c
.option	pic2
li	$7,16			# 0x10

.set	macro
.set	reorder
.end	avg_qpel16_mc00_c
.align	2
.ent	avg_qpel16_mc20_c
.type	avg_qpel16_mc20_c, @function
avg_qpel16_mc20_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$2,%hi(ff_cropTbl+1024)
move	$11,$4
move	$10,$5
move	$15,$6
addiu	$12,$2,%lo(ff_cropTbl+1024)
move	$13,$0
li	$14,16			# 0x10
$L541:
lbu	$8,1($10)
lbu	$4,0($10)
lbu	$3,4($10)
lbu	$7,2($10)
lbu	$5,3($10)
addu	$2,$8,$4
subu	$3,$0,$3
addu	$4,$7,$4
sll	$6,$2,4
subu	$3,$3,$7
sll	$2,$2,2
addu	$5,$5,$8
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,0($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,0($11)
lbu	$7,1($10)
lbu	$3,5($10)
lbu	$2,2($10)
lbu	$8,0($10)
lbu	$4,3($10)
lbu	$5,4($10)
addu	$2,$2,$7
subu	$3,$0,$3
addu	$4,$4,$8
sll	$6,$2,4
subu	$3,$3,$7
sll	$2,$2,2
addu	$5,$5,$8
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,1($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,1($11)
lbu	$2,2($10)
lbu	$4,3($10)
lbu	$7,0($10)
lbu	$3,1($10)
lbu	$5,4($10)
lbu	$8,6($10)
lbu	$6,5($10)
addu	$4,$4,$2
addu	$5,$5,$3
sll	$2,$4,4
subu	$3,$14,$7
sll	$4,$4,2
addu	$6,$6,$7
addu	$4,$4,$2
sll	$7,$5,3
subu	$3,$3,$8
sll	$5,$5,1
subu	$5,$5,$7
addu	$3,$3,$4
sll	$2,$6,1
addu	$2,$2,$6
addu	$3,$3,$5
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,2($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,2($11)
lbu	$2,3($10)
lbu	$4,4($10)
lbu	$7,2($10)
lbu	$3,0($10)
lbu	$5,5($10)
lbu	$8,1($10)
lbu	$9,7($10)
lbu	$6,6($10)
addu	$4,$4,$2
sll	$2,$4,4
addu	$5,$5,$7
subu	$3,$14,$3
sll	$4,$4,2
addu	$6,$6,$8
addu	$4,$4,$2
sll	$7,$5,3
subu	$3,$3,$9
sll	$5,$5,1
subu	$5,$5,$7
addu	$3,$3,$4
sll	$2,$6,1
addu	$2,$2,$6
addu	$3,$3,$5
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,3($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,3($11)
lbu	$5,4($10)
lbu	$3,8($10)
lbu	$2,5($10)
lbu	$8,1($10)
lbu	$6,3($10)
lbu	$4,6($10)
lbu	$7,2($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,7($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,4($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,4($11)
lbu	$5,5($10)
lbu	$3,9($10)
lbu	$2,6($10)
lbu	$8,2($10)
lbu	$6,4($10)
lbu	$4,7($10)
lbu	$7,3($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,8($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,5($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,5($11)
lbu	$5,6($10)
lbu	$3,10($10)
lbu	$2,7($10)
lbu	$8,3($10)
lbu	$6,5($10)
lbu	$4,8($10)
lbu	$7,4($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,9($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,6($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,6($11)
lbu	$5,7($10)
lbu	$3,11($10)
lbu	$2,8($10)
lbu	$8,4($10)
lbu	$6,6($10)
lbu	$4,9($10)
lbu	$7,5($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,10($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,7($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,7($11)
lbu	$5,8($10)
lbu	$3,12($10)
lbu	$2,9($10)
lbu	$8,5($10)
lbu	$6,7($10)
lbu	$4,10($10)
lbu	$7,6($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,11($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,8($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,8($11)
lbu	$5,9($10)
lbu	$3,13($10)
lbu	$2,10($10)
lbu	$8,6($10)
lbu	$6,8($10)
lbu	$4,11($10)
lbu	$7,7($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,12($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,9($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,9($11)
lbu	$5,10($10)
lbu	$3,14($10)
lbu	$2,11($10)
lbu	$8,7($10)
lbu	$6,9($10)
lbu	$4,12($10)
lbu	$7,8($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,13($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,10($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,10($11)
lbu	$5,11($10)
lbu	$3,15($10)
lbu	$2,12($10)
lbu	$8,8($10)
lbu	$6,10($10)
lbu	$4,13($10)
lbu	$7,9($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,14($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,11($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,11($11)
lbu	$5,12($10)
lbu	$3,16($10)
lbu	$2,13($10)
lbu	$8,9($10)
lbu	$6,11($10)
lbu	$4,14($10)
lbu	$7,10($10)
addu	$2,$2,$5
subu	$3,$0,$3
lbu	$5,15($10)
addu	$4,$4,$6
subu	$3,$3,$8
sll	$6,$2,4
sll	$2,$2,2
addu	$5,$5,$7
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,12($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,12($11)
lbu	$5,13($10)
lbu	$3,10($10)
lbu	$2,14($10)
lbu	$6,16($10)
lbu	$7,12($10)
lbu	$4,15($10)
lbu	$8,11($10)
addu	$2,$2,$5
subu	$3,$0,$3
addu	$4,$4,$7
sll	$5,$2,4
subu	$3,$3,$6
sll	$2,$2,2
addu	$6,$6,$8
addu	$2,$2,$5
addiu	$3,$3,16
sll	$5,$4,3
sll	$4,$4,1
subu	$4,$4,$5
addu	$3,$3,$2
sll	$2,$6,1
addu	$2,$2,$6
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,13($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,13($11)
lbu	$7,15($10)
lbu	$3,11($10)
lbu	$2,14($10)
lbu	$8,16($10)
lbu	$4,13($10)
lbu	$5,12($10)
addu	$2,$7,$2
subu	$3,$0,$3
addu	$4,$8,$4
sll	$6,$2,4
subu	$3,$3,$7
sll	$2,$2,2
addu	$5,$5,$8
addu	$2,$2,$6
addiu	$3,$3,16
sll	$6,$4,3
sll	$4,$4,1
subu	$4,$4,$6
addu	$3,$3,$2
sll	$2,$5,1
addu	$2,$2,$5
addu	$3,$3,$4
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,14($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
sb	$2,14($11)
lbu	$8,15($10)
lbu	$4,16($10)
lbu	$3,12($10)
lbu	$7,14($10)
lbu	$5,13($10)
addu	$2,$4,$8
subu	$3,$0,$3
sll	$6,$2,4
addu	$4,$7,$4
subu	$3,$3,$7
sll	$2,$2,2
addu	$2,$2,$6
addu	$5,$5,$8
sll	$6,$4,3
addiu	$3,$3,16
sll	$4,$4,1
addu	$3,$3,$2
subu	$4,$4,$6
sll	$2,$5,1
addu	$3,$3,$4
addu	$2,$2,$5
addu	$3,$3,$2
sra	$3,$3,5
lbu	$2,15($11)
addu	$3,$12,$3
lbu	$4,0($3)
addiu	$2,$2,1
addu	$2,$2,$4
sra	$2,$2,1
addiu	$13,$13,1
sb	$2,15($11)
addu	$10,$10,$15
bne	$13,$14,$L541
addu	$11,$11,$15

j	$31
nop

.set	macro
.set	reorder
.end	avg_qpel16_mc20_c
.align	2
.ent	avg_qpel16_mc22_c
.type	avg_qpel16_mc22_c, @function
avg_qpel16_mc22_c:
.set	nomips16
.frame	$sp,320,$31		# vars= 272, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-320
sw	$31,316($sp)
sw	$18,312($sp)
sw	$17,308($sp)
sw	$16,304($sp)
.cprestore	24
move	$17,$6
addiu	$16,$sp,32
move	$18,$4
move	$7,$17
move	$4,$16
li	$2,17			# 0x11
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$4,$18
move	$5,$16
move	$6,$17
.option	pic0
jal	avg_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,316($sp)
lw	$28,24($sp)
lw	$18,312($sp)
lw	$17,308($sp)
lw	$16,304($sp)
j	$31
addiu	$sp,$sp,320

.set	macro
.set	reorder
.end	avg_qpel16_mc22_c
.align	2
.ent	wmv2_mspel8_h_lowpass
.type	wmv2_mspel8_h_lowpass, @function
wmv2_mspel8_h_lowpass:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$12,16($sp)
move	$9,$4
move	$8,$5
blez	$12,$L551
move	$14,$6

lui	$2,%hi(ff_cropTbl+1024)
addiu	$10,$2,%lo(ff_cropTbl+1024)
move	$11,$0
li	$13,8			# 0x8
$L548:
lbu	$3,0($8)
lbu	$2,2($8)
lbu	$4,1($8)
lbu	$5,-1($8)
addu	$4,$4,$3
subu	$2,$0,$2
subu	$2,$2,$5
sll	$3,$4,3
addu	$3,$3,$4
addiu	$2,$2,8
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
addiu	$11,$11,1
sb	$3,0($9)
lbu	$3,1($8)
lbu	$4,2($8)
lbu	$2,0($8)
lbu	$5,3($8)
addu	$4,$4,$3
sll	$3,$4,3
subu	$2,$13,$2
addu	$3,$3,$4
subu	$2,$2,$5
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
slt	$6,$11,$12
sb	$3,1($9)
lbu	$3,2($8)
lbu	$2,4($8)
lbu	$4,3($8)
lbu	$5,1($8)
addu	$4,$4,$3
subu	$2,$0,$2
subu	$2,$2,$5
sll	$3,$4,3
addu	$3,$3,$4
addiu	$2,$2,8
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
sb	$3,2($9)
lbu	$3,3($8)
lbu	$2,5($8)
lbu	$4,4($8)
lbu	$5,2($8)
addu	$4,$4,$3
subu	$2,$0,$2
subu	$2,$2,$5
sll	$3,$4,3
addu	$3,$3,$4
addiu	$2,$2,8
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
sb	$3,3($9)
lbu	$3,4($8)
lbu	$2,6($8)
lbu	$4,5($8)
lbu	$5,3($8)
addu	$4,$4,$3
subu	$2,$0,$2
subu	$2,$2,$5
sll	$3,$4,3
addu	$3,$3,$4
addiu	$2,$2,8
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
sb	$3,4($9)
lbu	$3,5($8)
lbu	$2,7($8)
lbu	$4,6($8)
lbu	$5,4($8)
addu	$4,$4,$3
subu	$2,$0,$2
subu	$2,$2,$5
sll	$3,$4,3
addu	$3,$3,$4
addiu	$2,$2,8
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
sb	$3,5($9)
lbu	$3,6($8)
lbu	$2,8($8)
lbu	$4,7($8)
lbu	$5,5($8)
addu	$4,$4,$3
subu	$2,$0,$2
subu	$2,$2,$5
sll	$3,$4,3
addu	$3,$3,$4
addiu	$2,$2,8
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
sb	$3,6($9)
lbu	$3,7($8)
lbu	$2,9($8)
lbu	$4,8($8)
lbu	$5,6($8)
addu	$4,$4,$3
subu	$2,$0,$2
subu	$2,$2,$5
sll	$3,$4,3
addu	$3,$3,$4
addiu	$2,$2,8
addu	$2,$2,$3
sra	$2,$2,4
addu	$2,$10,$2
lbu	$3,0($2)
addu	$8,$8,$7
sb	$3,7($9)
bne	$6,$0,$L548
addu	$9,$9,$14

$L551:
j	$31
nop

.set	macro
.set	reorder
.end	wmv2_mspel8_h_lowpass
.align	2
.globl	ff_put_cavs_qpel8_mc00_c
.ent	ff_put_cavs_qpel8_mc00_c
.type	ff_put_cavs_qpel8_mc00_c, @function
ff_put_cavs_qpel8_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$0
li	$8,8			# 0x8
$L553:
lwl	$2,3($5)
addiu	$7,$7,1
lwr	$2,0($5)
sw	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($4)
bne	$7,$8,$L553
addu	$4,$4,$6

j	$31
nop

.set	macro
.set	reorder
.end	ff_put_cavs_qpel8_mc00_c
.align	2
.globl	ff_avg_cavs_qpel8_mc00_c
.ent	ff_avg_cavs_qpel8_mc00_c
.type	ff_avg_cavs_qpel8_mc00_c, @function
ff_avg_cavs_qpel8_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	avg_pixels8_c
.option	pic2
li	$7,8			# 0x8

.set	macro
.set	reorder
.end	ff_avg_cavs_qpel8_mc00_c
.align	2
.globl	ff_put_cavs_qpel16_mc00_c
.ent	ff_put_cavs_qpel16_mc00_c
.type	ff_put_cavs_qpel16_mc00_c, @function
ff_put_cavs_qpel16_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	put_pixels16_c
.option	pic2
li	$7,16			# 0x10

.set	macro
.set	reorder
.end	ff_put_cavs_qpel16_mc00_c
.align	2
.globl	ff_avg_cavs_qpel16_mc00_c
.ent	ff_avg_cavs_qpel16_mc00_c
.type	ff_avg_cavs_qpel16_mc00_c, @function
ff_avg_cavs_qpel16_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

.option	pic0
j	avg_pixels16_c
.option	pic2
li	$7,16			# 0x10

.set	macro
.set	reorder
.end	ff_avg_cavs_qpel16_mc00_c
.align	2
.globl	ff_put_vc1_mspel_mc00_c
.ent	ff_put_vc1_mspel_mc00_c
.type	ff_put_vc1_mspel_mc00_c, @function
ff_put_vc1_mspel_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$0
li	$8,8			# 0x8
$L563:
lwl	$2,3($5)
addiu	$7,$7,1
lwr	$2,0($5)
sw	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($4)
bne	$7,$8,$L563
addu	$4,$4,$6

j	$31
nop

.set	macro
.set	reorder
.end	ff_put_vc1_mspel_mc00_c
.align	2
.ent	wmv2_mspel8_v_lowpass
.type	wmv2_mspel8_v_lowpass, @function
wmv2_mspel8_v_lowpass:
.set	nomips16
.frame	$sp,88,$31		# vars= 40, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-88
sw	$fp,84($sp)
sw	$23,80($sp)
sw	$22,76($sp)
sw	$21,72($sp)
sw	$20,68($sp)
sw	$19,64($sp)
sw	$18,60($sp)
sw	$17,56($sp)
sw	$16,52($sp)
.cprestore	0
lw	$2,104($sp)
move	$16,$4
move	$25,$5
move	$18,$6
blez	$2,$L569
move	$17,$7

sll	$5,$7,3
sll	$8,$6,1
sll	$7,$7,1
sll	$3,$6,3
sll	$14,$17,2
sll	$15,$6,2
subu	$13,$3,$6
addu	$2,$7,$17
subu	$3,$3,$8
addu	$12,$5,$17
addu	$9,$14,$17
addu	$11,$15,$6
subu	$4,$5,$17
addu	$2,$25,$2
addu	$3,$16,$3
subu	$10,$5,$7
addu	$6,$8,$6
sw	$2,40($sp)
addu	$9,$25,$9
addu	$10,$25,$10
addu	$4,$25,$4
addu	$12,$25,$12
addu	$6,$16,$6
addu	$11,$16,$11
sw	$3,12($sp)
addu	$13,$16,$13
subu	$3,$25,$17
lui	$2,%hi(ff_cropTbl+1024)
addu	$fp,$25,$17
addu	$20,$16,$18
sw	$9,36($sp)
sw	$10,32($sp)
sw	$4,28($sp)
sw	$12,24($sp)
sw	$6,20($sp)
sw	$11,16($sp)
sw	$13,8($sp)
addiu	$24,$2,%lo(ff_cropTbl+1024)
sw	$3,44($sp)
addu	$23,$25,$7
addu	$22,$25,$14
addu	$21,$25,$5
addu	$19,$16,$8
addu	$18,$16,$15
move	$17,$0
$L568:
lw	$4,44($sp)
lbu	$9,0($23)
lbu	$7,0($fp)
lbu	$5,0($25)
lbu	$6,0($4)
subu	$3,$0,$9
addu	$4,$7,$5
subu	$3,$3,$6
sll	$2,$4,3
addu	$2,$2,$4
addiu	$3,$3,8
addu	$3,$3,$2
lw	$8,40($sp)
sra	$3,$3,4
addu	$3,$24,$3
lbu	$10,0($8)
lbu	$8,0($3)
lw	$3,36($sp)
addu	$4,$9,$7
lbu	$13,0($3)
lw	$3,32($sp)
li	$2,8			# 0x8
lbu	$12,0($22)
lbu	$14,0($3)
subu	$5,$2,$5
lw	$3,28($sp)
sll	$2,$4,3
addu	$2,$2,$4
subu	$5,$5,$10
lbu	$15,0($3)
addu	$6,$10,$9
lw	$3,24($sp)
addu	$5,$5,$2
subu	$4,$0,$12
subu	$4,$4,$7
sll	$2,$6,3
sra	$5,$5,4
lbu	$11,0($21)
addu	$2,$2,$6
addu	$5,$24,$5
lbu	$6,0($3)
addiu	$4,$4,8
sb	$8,0($16)
lbu	$8,0($5)
addu	$7,$12,$10
addu	$4,$4,$2
subu	$2,$0,$13
sll	$3,$7,3
subu	$2,$2,$9
sra	$4,$4,4
sb	$8,0($20)
addu	$3,$3,$7
addu	$4,$24,$4
addiu	$2,$2,8
lbu	$7,0($4)
addu	$5,$13,$12
addu	$2,$2,$3
subu	$3,$0,$14
sll	$4,$5,3
subu	$3,$3,$10
sra	$2,$2,4
sb	$7,0($19)
addu	$4,$4,$5
addu	$2,$24,$2
addiu	$3,$3,8
lbu	$7,0($2)
lw	$8,20($sp)
addu	$5,$14,$13
addu	$3,$3,$4
subu	$4,$0,$15
sll	$2,$5,3
subu	$4,$4,$12
sra	$3,$3,4
sb	$7,0($8)
addu	$2,$2,$5
addu	$3,$24,$3
addiu	$4,$4,8
lbu	$7,0($3)
addu	$5,$15,$14
addu	$4,$4,$2
subu	$2,$0,$11
sll	$3,$5,3
subu	$2,$2,$13
sra	$4,$4,4
sb	$7,0($18)
addu	$3,$3,$5
addu	$4,$24,$4
addu	$11,$11,$15
addiu	$2,$2,8
subu	$6,$0,$6
lbu	$5,0($4)
addu	$2,$2,$3
lw	$4,16($sp)
subu	$6,$6,$14
sll	$3,$11,3
addu	$3,$3,$11
sra	$2,$2,4
addiu	$6,$6,8
sb	$5,0($4)
addu	$2,$24,$2
addu	$6,$6,$3
lbu	$4,0($2)
lw	$8,12($sp)
sra	$6,$6,4
addu	$6,$24,$6
sb	$4,0($8)
lbu	$2,0($6)
lw	$8,8($sp)
lw	$4,104($sp)
sb	$2,0($8)
lw	$2,44($sp)
addiu	$17,$17,1
addiu	$2,$2,1
lw	$8,36($sp)
slt	$3,$17,$4
sw	$2,44($sp)
lw	$4,40($sp)
lw	$2,32($sp)
addiu	$4,$4,1
addiu	$8,$8,1
addiu	$2,$2,1
sw	$4,40($sp)
sw	$8,36($sp)
lw	$4,28($sp)
lw	$8,24($sp)
sw	$2,32($sp)
lw	$2,20($sp)
addiu	$4,$4,1
addiu	$8,$8,1
addiu	$2,$2,1
sw	$4,28($sp)
sw	$8,24($sp)
lw	$4,16($sp)
lw	$8,12($sp)
sw	$2,20($sp)
lw	$2,8($sp)
addiu	$4,$4,1
addiu	$8,$8,1
addiu	$2,$2,1
addiu	$25,$25,1
addiu	$16,$16,1
addiu	$fp,$fp,1
addiu	$23,$23,1
addiu	$22,$22,1
addiu	$21,$21,1
addiu	$20,$20,1
addiu	$19,$19,1
addiu	$18,$18,1
sw	$4,16($sp)
sw	$8,12($sp)
bne	$3,$0,$L568
sw	$2,8($sp)

$L569:
lw	$fp,84($sp)
lw	$23,80($sp)
lw	$22,76($sp)
lw	$21,72($sp)
lw	$20,68($sp)
lw	$19,64($sp)
lw	$18,60($sp)
lw	$17,56($sp)
lw	$16,52($sp)
j	$31
addiu	$sp,$sp,88

.set	macro
.set	reorder
.end	wmv2_mspel8_v_lowpass
.align	2
.ent	put_mspel8_mc00_c
.type	put_mspel8_mc00_c, @function
put_mspel8_mc00_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$7,$0
li	$8,8			# 0x8
$L572:
lwl	$2,3($5)
addiu	$7,$7,1
lwr	$2,0($5)
sw	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
addu	$5,$5,$6
sw	$3,4($4)
bne	$7,$8,$L572
addu	$4,$4,$6

j	$31
nop

.set	macro
.set	reorder
.end	put_mspel8_mc00_c
.align	2
.ent	put_mspel8_mc20_c
.type	put_mspel8_mc20_c, @function
put_mspel8_mc20_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 24, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
sw	$31,36($sp)
.cprestore	24
move	$7,$6
li	$2,8			# 0x8
.option	pic0
jal	wmv2_mspel8_h_lowpass
.option	pic2
sw	$2,16($sp)

lw	$31,36($sp)
lw	$28,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_mspel8_mc20_c
.align	2
.ent	put_mspel8_mc02_c
.type	put_mspel8_mc02_c, @function
put_mspel8_mc02_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 24, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
sw	$31,36($sp)
.cprestore	24
move	$7,$6
li	$2,8			# 0x8
.option	pic0
jal	wmv2_mspel8_v_lowpass
.option	pic2
sw	$2,16($sp)

lw	$31,36($sp)
lw	$28,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_mspel8_mc02_c
.align	2
.ent	put_mspel8_mc22_c
.type	put_mspel8_mc22_c, @function
put_mspel8_mc22_c:
.set	nomips16
.frame	$sp,136,$31		# vars= 88, regs= 3/0, args= 24, gp= 8
.mask	0x80030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-136
sw	$31,132($sp)
sw	$17,128($sp)
sw	$16,124($sp)
.cprestore	24
move	$16,$6
move	$17,$4
subu	$5,$5,$6
addiu	$4,$sp,32
move	$7,$16
li	$2,11			# 0xb
li	$6,8			# 0x8
.option	pic0
jal	wmv2_mspel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$4,$17
move	$6,$16
addiu	$5,$sp,40
li	$2,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	wmv2_mspel8_v_lowpass
.option	pic2
sw	$2,16($sp)

lw	$31,132($sp)
lw	$28,24($sp)
lw	$17,128($sp)
lw	$16,124($sp)
j	$31
addiu	$sp,$sp,136

.set	macro
.set	reorder
.end	put_mspel8_mc22_c
.align	2
.ent	h263_v_loop_filter_c
.type	h263_v_loop_filter_c, @function
h263_v_loop_filter_c:
.set	nomips16
.frame	$sp,24,$31		# vars= 0, regs= 5/0, args= 0, gp= 0
.mask	0x001f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$28,$28,%lo(__gnu_local_gp)
lw	$2,%got(ff_h263_loop_filter_strength)($28)
addiu	$sp,$sp,-24
addu	$2,$2,$6
sw	$17,8($sp)
lbu	$17,0($2)
sw	$18,12($sp)
sll	$2,$5,1
sll	$18,$17,1
sw	$20,20($sp)
sw	$19,16($sp)
sw	$16,4($sp)
move	$12,$4
subu	$11,$4,$2
addu	$10,$4,$5
subu	$16,$0,$18
subu	$9,$4,$5
move	$13,$0
subu	$19,$0,$17
li	$20,8			# 0x8
$L594:
lbu	$5,0($9)
lbu	$14,0($12)
lbu	$25,0($11)
lbu	$24,0($10)
subu	$2,$14,$5
sll	$2,$2,2
subu	$15,$25,$24
addu	$2,$2,$15
addiu	$4,$2,7
slt	$3,$2,0
movn	$2,$4,$3
sra	$4,$2,3
slt	$3,$4,$16
bne	$3,$0,$L599
move	$3,$0

slt	$2,$4,$19
beq	$2,$0,$L584
slt	$2,$4,$17

subu	$3,$16,$4
bltz	$3,$L597
move	$2,$3

$L589:
sra	$8,$2,1
subu	$7,$0,$8
$L586:
addu	$6,$3,$5
andi	$2,$6,0x100
beq	$2,$0,$L590
subu	$5,$14,$3

sra	$2,$6,31
nor	$6,$0,$2
$L590:
andi	$2,$5,0x100
beq	$2,$0,$L600
slt	$3,$15,0

sra	$2,$5,31
nor	$5,$0,$2
$L600:
move	$2,$15
addiu	$4,$15,3
movn	$2,$4,$3
sra	$2,$2,2
slt	$3,$2,$7
sb	$6,0($9)
bne	$3,$0,$L593
sb	$5,0($12)

move	$7,$2
slt	$2,$2,$8
movz	$7,$8,$2
$L593:
andi	$2,$7,0x00ff
addu	$3,$2,$24
addiu	$13,$13,1
subu	$2,$25,$2
sb	$2,0($11)
addiu	$9,$9,1
sb	$3,0($10)
addiu	$11,$11,1
addiu	$12,$12,1
bne	$13,$20,$L594
addiu	$10,$10,1

lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,24

$L587:
beq	$2,$0,$L583
move	$3,$0

subu	$3,$18,$4
bgez	$3,$L589
move	$2,$3

$L597:
b	$L589
subu	$2,$0,$3

$L583:
$L599:
move	$8,$0
b	$L586
move	$7,$0

$L584:
beq	$2,$0,$L587
slt	$2,$4,$18

bltz	$4,$L598
move	$2,$4

$L588:
sra	$8,$2,1
move	$3,$4
b	$L586
subu	$7,$0,$8

$L598:
b	$L588
subu	$2,$0,$4

.set	macro
.set	reorder
.end	h263_v_loop_filter_c
.align	2
.ent	h263_h_loop_filter_c
.type	h263_h_loop_filter_c, @function
h263_h_loop_filter_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$28,$28,%lo(__gnu_local_gp)
lw	$2,%got(ff_h263_loop_filter_strength)($28)
addiu	$sp,$sp,-16
addu	$2,$2,$6
lbu	$25,0($2)
sw	$18,12($sp)
move	$18,$5
sll	$5,$25,1
sw	$17,8($sp)
sw	$16,4($sp)
move	$9,$4
subu	$24,$0,$5
move	$11,$0
subu	$16,$0,$25
li	$17,8			# 0x8
$L614:
lbu	$6,-1($9)
lbu	$12,0($9)
lbu	$15,-2($9)
lbu	$14,1($9)
subu	$2,$12,$6
sll	$2,$2,2
subu	$13,$15,$14
addu	$2,$2,$13
addiu	$4,$2,7
slt	$3,$2,0
movn	$2,$4,$3
sra	$4,$2,3
slt	$3,$4,$24
bne	$3,$0,$L619
move	$3,$0

slt	$2,$4,$16
beq	$2,$0,$L604
slt	$2,$4,$25

subu	$3,$24,$4
bltz	$3,$L617
move	$2,$3

$L609:
sra	$10,$2,1
subu	$8,$0,$10
$L606:
addu	$7,$3,$6
andi	$2,$7,0x100
beq	$2,$0,$L610
subu	$6,$12,$3

sra	$2,$7,31
nor	$7,$0,$2
$L610:
andi	$2,$6,0x100
beq	$2,$0,$L620
slt	$3,$13,0

sra	$2,$6,31
nor	$6,$0,$2
$L620:
move	$2,$13
addiu	$4,$13,3
movn	$2,$4,$3
sra	$2,$2,2
slt	$3,$2,$8
sb	$7,-1($9)
bne	$3,$0,$L613
sb	$6,0($9)

move	$8,$2
slt	$2,$2,$10
movz	$8,$10,$2
$L613:
andi	$2,$8,0x00ff
addu	$3,$2,$14
addiu	$11,$11,1
subu	$2,$15,$2
sb	$2,-2($9)
sb	$3,1($9)
bne	$11,$17,$L614
addu	$9,$9,$18

lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

$L607:
beq	$2,$0,$L603
move	$3,$0

subu	$3,$5,$4
bgez	$3,$L609
move	$2,$3

$L617:
b	$L609
subu	$2,$0,$3

$L603:
$L619:
move	$10,$0
b	$L606
move	$8,$0

$L604:
beq	$2,$0,$L607
slt	$2,$4,$5

bltz	$4,$L618
move	$2,$4

$L608:
sra	$10,$2,1
move	$3,$4
b	$L606
subu	$8,$0,$10

$L618:
b	$L608
subu	$2,$0,$4

.set	macro
.set	reorder
.end	h263_h_loop_filter_c
.align	2
.ent	h261_loop_filter_c
.type	h261_loop_filter_c, @function
h261_loop_filter_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 256, regs= 2/0, args= 0, gp= 8
.mask	0x00030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$17,268($sp)
sw	$16,264($sp)
.cprestore	0
sll	$2,$5,3
addiu	$11,$sp,8
subu	$2,$2,$5
addu	$8,$4,$2
move	$24,$4
move	$7,$4
move	$17,$11
move	$6,$11
addiu	$9,$sp,40
$L622:
lbu	$2,0($7)
lbu	$3,0($8)
sll	$2,$2,2
sll	$3,$3,2
sw	$2,0($6)
sw	$3,224($6)
addiu	$6,$6,4
addiu	$7,$7,1
bne	$9,$6,$L622
addiu	$8,$8,1

sll	$2,$5,1
addu	$15,$4,$2
move	$14,$4
addu	$13,$4,$5
li	$12,8			# 0x8
li	$25,8			# 0x8
li	$16,56			# 0x38
$L623:
sll	$2,$12,2
addu	$10,$11,$2
move	$9,$14
move	$8,$13
move	$7,$15
move	$6,$0
$L624:
lbu	$2,0($7)
lbu	$4,0($9)
lbu	$3,0($8)
addu	$2,$2,$4
sll	$3,$3,1
addu	$2,$2,$3
addiu	$6,$6,1
sw	$2,0($10)
addiu	$9,$9,1
addiu	$8,$8,1
addiu	$7,$7,1
bne	$6,$25,$L624
addiu	$10,$10,4

addiu	$12,$12,8
addu	$15,$15,$5
addu	$13,$13,$5
bne	$12,$16,$L623
addu	$14,$14,$5

move	$9,$0
addiu	$12,$sp,264
li	$10,7			# 0x7
$L627:
lw	$2,0($11)
sll	$4,$9,2
addiu	$2,$2,2
sra	$2,$2,2
sb	$2,0($24)
lw	$3,28($11)
addu	$6,$17,$4
addiu	$3,$3,2
sra	$3,$3,2
sb	$3,7($24)
move	$8,$24
li	$7,1			# 0x1
$L626:
lw	$2,0($6)
lw	$4,8($6)
lw	$3,4($6)
addu	$2,$2,$4
addiu	$2,$2,8
sll	$3,$3,1
addu	$2,$2,$3
sra	$2,$2,4
addiu	$7,$7,1
sb	$2,1($8)
addiu	$6,$6,4
bne	$7,$10,$L626
addiu	$8,$8,1

addiu	$11,$11,32
addu	$24,$24,$5
bne	$12,$11,$L627
addiu	$9,$9,8

lw	$17,268($sp)
lw	$16,264($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	h261_loop_filter_c
.align	2
.ent	pix_abs16_c
.type	pix_abs16_c, @function
pix_abs16_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
.mask	0x00010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
sw	$16,4($sp)
lw	$16,24($sp)
move	$14,$5
move	$13,$6
blez	$16,$L655
move	$25,$7

move	$24,$0
move	$15,$0
$L652:
lbu	$5,1($13)
lbu	$2,0($13)
lbu	$3,1($14)
lbu	$4,0($14)
lbu	$8,2($13)
lbu	$6,2($14)
subu	$3,$3,$5
subu	$4,$4,$2
lbu	$10,3($13)
lbu	$7,3($14)
subu	$6,$6,$8
lbu	$12,4($13)
lbu	$11,4($14)
subu	$9,$0,$3
slt	$5,$3,0
subu	$8,$0,$4
slt	$2,$4,0
movn	$4,$8,$2
subu	$7,$7,$10
movn	$3,$9,$5
lbu	$8,5($14)
lbu	$9,5($13)
subu	$5,$0,$6
slt	$2,$6,0
movn	$6,$5,$2
subu	$11,$11,$12
lbu	$10,6($13)
addu	$3,$3,$4
lbu	$5,6($14)
subu	$4,$0,$7
slt	$2,$7,0
movn	$7,$4,$2
subu	$8,$8,$9
lbu	$12,7($13)
addu	$3,$3,$6
lbu	$9,7($14)
subu	$4,$0,$11
slt	$2,$11,0
movn	$11,$4,$2
subu	$5,$5,$10
addu	$3,$3,$7
lbu	$6,8($14)
lbu	$7,8($13)
subu	$4,$0,$8
slt	$2,$8,0
movn	$8,$4,$2
subu	$9,$9,$12
addu	$3,$3,$11
lbu	$12,9($13)
lbu	$10,9($14)
subu	$4,$0,$5
slt	$2,$5,0
movn	$5,$4,$2
subu	$6,$6,$7
addu	$3,$3,$8
lbu	$7,10($13)
lbu	$11,10($14)
subu	$4,$0,$9
slt	$2,$9,0
movn	$9,$4,$2
subu	$10,$10,$12
addu	$3,$3,$5
lbu	$12,11($14)
lbu	$5,11($13)
subu	$4,$0,$6
slt	$2,$6,0
movn	$6,$4,$2
subu	$11,$11,$7
addu	$3,$3,$9
lbu	$8,12($14)
lbu	$9,12($13)
subu	$4,$0,$10
slt	$2,$10,0
movn	$10,$4,$2
subu	$12,$12,$5
addu	$3,$3,$6
lbu	$5,13($13)
lbu	$7,13($14)
subu	$4,$0,$11
slt	$2,$11,0
subu	$8,$8,$9
movn	$11,$4,$2
addu	$3,$3,$10
lbu	$6,14($14)
lbu	$10,14($13)
subu	$4,$0,$12
slt	$2,$12,0
subu	$7,$7,$5
movn	$12,$4,$2
lbu	$9,15($13)
lbu	$4,15($14)
subu	$5,$0,$8
slt	$2,$8,0
addu	$3,$3,$11
movn	$8,$5,$2
subu	$6,$6,$10
subu	$5,$0,$7
slt	$2,$7,0
addu	$3,$3,$12
movn	$7,$5,$2
subu	$4,$4,$9
subu	$5,$0,$6
slt	$2,$6,0
addu	$3,$3,$8
movn	$6,$5,$2
addu	$3,$3,$7
slt	$2,$4,0
subu	$5,$0,$4
movn	$4,$5,$2
addu	$3,$3,$6
addiu	$15,$15,1
addu	$3,$3,$4
slt	$2,$15,$16
addu	$24,$24,$3
addu	$14,$14,$25
bne	$2,$0,$L652
addu	$13,$13,$25

$L635:
move	$2,$24
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,8

$L655:
b	$L635
move	$24,$0

.set	macro
.set	reorder
.end	pix_abs16_c
.align	2
.ent	pix_abs16_x2_c
.type	pix_abs16_x2_c, @function
pix_abs16_x2_c:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 8/0, args= 0, gp= 0
.mask	0x00ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-32
sw	$23,28($sp)
lw	$23,48($sp)
sw	$22,24($sp)
sw	$21,20($sp)
sw	$20,16($sp)
sw	$19,12($sp)
sw	$18,8($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$25,$5
move	$24,$6
blez	$23,$L678
move	$22,$7

move	$21,$0
move	$20,$0
$L675:
lbu	$2,1($24)
lbu	$5,2($24)
lbu	$3,0($24)
lbu	$6,3($24)
lbu	$8,4($24)
addu	$3,$3,$2
addu	$2,$2,$5
lbu	$10,5($24)
addu	$5,$5,$6
lbu	$4,1($25)
lbu	$7,0($25)
addiu	$2,$2,1
addiu	$3,$3,1
lbu	$12,6($24)
sra	$2,$2,1
sra	$3,$3,1
addu	$6,$6,$8
lbu	$9,2($25)
addiu	$5,$5,1
subu	$4,$4,$2
subu	$7,$7,$3
lbu	$14,7($24)
sra	$5,$5,1
addu	$8,$8,$10
lbu	$11,3($25)
addiu	$6,$6,1
subu	$9,$9,$5
lbu	$19,8($24)
sra	$6,$6,1
addu	$10,$10,$12
lbu	$13,4($25)
subu	$15,$0,$4
slt	$3,$4,0
subu	$5,$0,$7
slt	$2,$7,0
addiu	$8,$8,1
movn	$7,$5,$2
subu	$11,$11,$6
movn	$4,$15,$3
lbu	$16,9($24)
sra	$8,$8,1
addu	$12,$12,$14
lbu	$5,5($25)
subu	$3,$0,$9
slt	$2,$9,0
addiu	$10,$10,1
movn	$9,$3,$2
subu	$13,$13,$8
lbu	$17,10($24)
addu	$4,$4,$7
sra	$10,$10,1
addu	$14,$14,$19
lbu	$7,6($25)
subu	$3,$0,$11
slt	$2,$11,0
addiu	$12,$12,1
movn	$11,$3,$2
subu	$5,$5,$10
lbu	$18,11($24)
addu	$4,$4,$9
sra	$12,$12,1
addu	$19,$19,$16
lbu	$8,7($25)
subu	$3,$0,$13
slt	$2,$13,0
addiu	$14,$14,1
movn	$13,$3,$2
subu	$7,$7,$12
lbu	$15,12($24)
addu	$4,$4,$11
sra	$14,$14,1
addu	$16,$16,$17
lbu	$11,8($25)
subu	$3,$0,$5
slt	$2,$5,0
addiu	$19,$19,1
movn	$5,$3,$2
subu	$8,$8,$14
addu	$4,$4,$13
addu	$17,$17,$18
lbu	$13,13($24)
lbu	$6,9($25)
subu	$3,$0,$7
slt	$2,$7,0
sra	$19,$19,1
addiu	$16,$16,1
movn	$7,$3,$2
subu	$11,$11,$19
lbu	$12,14($24)
addu	$4,$4,$5
addu	$18,$18,$15
lbu	$5,10($25)
subu	$3,$0,$8
slt	$2,$8,0
sra	$16,$16,1
addiu	$17,$17,1
movn	$8,$3,$2
subu	$6,$6,$16
lbu	$10,15($24)
addu	$4,$4,$7
addu	$15,$15,$13
lbu	$9,11($25)
subu	$3,$0,$11
slt	$2,$11,0
sra	$17,$17,1
addiu	$18,$18,1
movn	$11,$3,$2
subu	$5,$5,$17
addu	$4,$4,$8
addu	$13,$13,$12
lbu	$8,12($25)
lbu	$14,16($24)
subu	$3,$0,$6
slt	$2,$6,0
sra	$18,$18,1
addiu	$15,$15,1
movn	$6,$3,$2
subu	$9,$9,$18
addu	$12,$12,$10
lbu	$7,13($25)
subu	$3,$0,$5
slt	$2,$5,0
addu	$4,$4,$11
sra	$15,$15,1
addiu	$13,$13,1
movn	$5,$3,$2
subu	$8,$8,$15
addu	$4,$4,$6
subu	$3,$0,$9
lbu	$6,14($25)
slt	$2,$9,0
addu	$10,$10,$14
sra	$13,$13,1
addiu	$12,$12,1
movn	$9,$3,$2
subu	$7,$7,$13
addu	$4,$4,$5
lbu	$3,15($25)
subu	$5,$0,$8
slt	$2,$8,0
sra	$12,$12,1
addiu	$10,$10,1
movn	$8,$5,$2
subu	$6,$6,$12
subu	$5,$0,$7
slt	$2,$7,0
addu	$4,$4,$9
sra	$10,$10,1
movn	$7,$5,$2
subu	$3,$3,$10
subu	$5,$0,$6
slt	$2,$6,0
addu	$4,$4,$8
movn	$6,$5,$2
addu	$4,$4,$7
slt	$2,$3,0
subu	$5,$0,$3
movn	$3,$5,$2
addu	$4,$4,$6
addiu	$20,$20,1
addu	$4,$4,$3
slt	$2,$20,$23
addu	$21,$21,$4
addu	$25,$25,$22
bne	$2,$0,$L675
addu	$24,$24,$22

$L658:
move	$2,$21
lw	$23,28($sp)
lw	$22,24($sp)
lw	$21,20($sp)
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

$L678:
b	$L658
move	$21,$0

.set	macro
.set	reorder
.end	pix_abs16_x2_c
.align	2
.ent	pix_abs16_y2_c
.type	pix_abs16_y2_c, @function
pix_abs16_y2_c:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 8/0, args= 0, gp= 0
.mask	0x00ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-32
sw	$23,28($sp)
lw	$23,48($sp)
sw	$22,24($sp)
sw	$18,8($sp)
sw	$21,20($sp)
sw	$20,16($sp)
sw	$19,12($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$18,$5
move	$24,$6
blez	$23,$L701
move	$22,$7

addu	$20,$6,$7
move	$25,$20
move	$21,$0
b	$L698
move	$19,$0

$L702:
addu	$20,$20,$22
$L698:
lbu	$6,1($25)
lbu	$3,0($25)
lbu	$4,1($24)
lbu	$2,0($24)
lbu	$7,2($25)
lbu	$5,2($24)
lbu	$9,3($25)
addu	$4,$4,$6
addu	$2,$2,$3
lbu	$6,3($24)
lbu	$11,4($25)
addu	$5,$5,$7
lbu	$3,1($18)
lbu	$8,0($18)
lbu	$7,4($24)
addiu	$4,$4,1
addiu	$2,$2,1
lbu	$12,5($25)
addu	$6,$6,$9
sra	$4,$4,1
sra	$2,$2,1
lbu	$10,2($18)
lbu	$9,5($24)
addiu	$5,$5,1
subu	$3,$3,$4
subu	$8,$8,$2
lbu	$15,6($25)
addu	$7,$7,$11
sra	$5,$5,1
lbu	$13,3($18)
lbu	$11,6($24)
addiu	$6,$6,1
subu	$10,$10,$5
lbu	$16,7($25)
addu	$9,$9,$12
sra	$6,$6,1
lbu	$17,4($18)
lbu	$14,7($24)
subu	$12,$0,$3
slt	$4,$3,0
subu	$5,$0,$8
slt	$2,$8,0
addiu	$7,$7,1
movn	$8,$5,$2
subu	$13,$13,$6
movn	$3,$12,$4
lbu	$6,8($25)
addu	$11,$11,$15
sra	$7,$7,1
lbu	$12,5($18)
lbu	$5,8($24)
subu	$4,$0,$10
slt	$2,$10,0
addiu	$9,$9,1
movn	$10,$4,$2
subu	$17,$17,$7
addu	$3,$3,$8
addu	$14,$14,$16
sra	$9,$9,1
lbu	$16,9($25)
lbu	$15,6($18)
lbu	$7,9($24)
subu	$4,$0,$13
slt	$2,$13,0
addiu	$11,$11,1
movn	$13,$4,$2
subu	$12,$12,$9
addu	$3,$3,$10
addu	$5,$5,$6
sra	$11,$11,1
lbu	$6,10($25)
lbu	$9,7($18)
lbu	$8,10($24)
subu	$4,$0,$17
slt	$2,$17,0
addiu	$14,$14,1
movn	$17,$4,$2
subu	$15,$15,$11
lbu	$10,11($25)
addu	$3,$3,$13
addu	$7,$7,$16
sra	$14,$14,1
lbu	$16,8($18)
lbu	$13,11($24)
subu	$4,$0,$12
slt	$2,$12,0
addiu	$5,$5,1
movn	$12,$4,$2
subu	$9,$9,$14
lbu	$11,12($25)
addu	$3,$3,$17
addu	$8,$8,$6
sra	$5,$5,1
lbu	$14,9($18)
lbu	$6,12($24)
subu	$4,$0,$15
slt	$2,$15,0
addiu	$7,$7,1
movn	$15,$4,$2
subu	$16,$16,$5
addu	$3,$3,$12
addu	$13,$13,$10
sra	$7,$7,1
lbu	$12,10($18)
lbu	$5,13($24)
lbu	$17,13($25)
subu	$4,$0,$9
slt	$2,$9,0
addiu	$8,$8,1
movn	$9,$4,$2
subu	$14,$14,$7
addu	$3,$3,$15
lbu	$7,14($25)
addu	$6,$6,$11
sra	$8,$8,1
lbu	$11,11($18)
lbu	$10,14($24)
subu	$4,$0,$16
slt	$2,$16,0
addiu	$13,$13,1
subu	$12,$12,$8
movn	$16,$4,$2
addu	$3,$3,$9
lbu	$8,12($18)
lbu	$9,15($24)
lbu	$15,15($25)
subu	$4,$0,$14
slt	$2,$14,0
addu	$5,$5,$17
sra	$13,$13,1
addiu	$6,$6,1
movn	$14,$4,$2
subu	$11,$11,$13
addu	$10,$10,$7
sra	$6,$6,1
lbu	$7,13($18)
subu	$4,$0,$12
slt	$2,$12,0
addu	$3,$3,$16
addiu	$5,$5,1
subu	$8,$8,$6
movn	$12,$4,$2
sra	$5,$5,1
lbu	$6,14($18)
subu	$4,$0,$11
slt	$2,$11,0
addu	$3,$3,$14
addu	$9,$9,$15
addiu	$10,$10,1
subu	$7,$7,$5
movn	$11,$4,$2
subu	$5,$0,$8
lbu	$4,15($18)
slt	$2,$8,0
addu	$3,$3,$12
sra	$10,$10,1
addiu	$9,$9,1
movn	$8,$5,$2
subu	$6,$6,$10
subu	$5,$0,$7
slt	$2,$7,0
addu	$3,$3,$11
sra	$9,$9,1
movn	$7,$5,$2
subu	$4,$4,$9
subu	$5,$0,$6
slt	$2,$6,0
addu	$3,$3,$8
movn	$6,$5,$2
addu	$3,$3,$7
slt	$2,$4,0
subu	$5,$0,$4
movn	$4,$5,$2
addu	$3,$3,$6
addiu	$19,$19,1
addu	$3,$3,$4
slt	$2,$19,$23
addu	$21,$21,$3
addu	$18,$18,$22
addu	$25,$25,$22
bne	$2,$0,$L702
move	$24,$20

$L681:
move	$2,$21
lw	$23,28($sp)
lw	$22,24($sp)
lw	$21,20($sp)
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

$L701:
b	$L681
move	$21,$0

.set	macro
.set	reorder
.end	pix_abs16_y2_c
.align	2
.ent	pix_abs16_xy2_c
.type	pix_abs16_xy2_c, @function
pix_abs16_xy2_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 16, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$fp,60($sp)
sw	$23,56($sp)
sw	$22,52($sp)
sw	$21,48($sp)
sw	$20,44($sp)
sw	$19,40($sp)
sw	$18,36($sp)
sw	$17,32($sp)
sw	$16,28($sp)
.cprestore	0
lw	$2,80($sp)
move	$24,$5
move	$25,$6
blez	$2,$L725
sw	$7,76($sp)

lw	$3,76($sp)
sw	$0,8($sp)
addu	$3,$6,$3
sw	$3,20($sp)
move	$fp,$3
b	$L722
sw	$0,12($sp)

$L726:
lw	$5,20($sp)
lw	$2,76($sp)
addu	$5,$5,$2
sw	$5,20($sp)
$L722:
lbu	$7,2($25)
lbu	$9,2($fp)
lbu	$10,1($fp)
lbu	$2,1($25)
lbu	$3,0($25)
lbu	$8,3($25)
addu	$5,$7,$9
lbu	$12,3($fp)
lbu	$4,0($fp)
addu	$3,$3,$2
addiu	$5,$5,2
addu	$2,$2,$10
addu	$5,$5,$8
addiu	$2,$2,2
addiu	$3,$3,2
lbu	$13,5($25)
lbu	$15,5($fp)
addu	$6,$8,$12
addu	$3,$3,$4
addu	$2,$2,$7
addu	$5,$5,$12
lbu	$12,2($24)
lbu	$11,4($25)
lbu	$14,4($fp)
lbu	$4,1($24)
addu	$3,$3,$10
addu	$2,$2,$9
sra	$5,$5,2
lbu	$9,0($24)
lbu	$10,6($25)
lbu	$20,6($fp)
subu	$12,$12,$5
addu	$8,$13,$15
lbu	$5,9($fp)
sra	$2,$2,2
sra	$3,$3,2
addiu	$6,$6,2
subu	$4,$4,$2
subu	$9,$9,$3
addu	$7,$11,$14
addu	$6,$6,$11
addiu	$8,$8,2
lbu	$16,7($25)
lbu	$21,7($fp)
lbu	$18,8($25)
lbu	$22,8($fp)
lbu	$19,9($25)
addu	$11,$10,$20
addu	$6,$6,$14
addu	$8,$8,$10
lbu	$14,3($24)
subu	$10,$0,$4
sw	$5,16($sp)
slt	$3,$4,0
subu	$5,$0,$9
slt	$2,$9,0
addiu	$7,$7,2
movn	$9,$5,$2
movn	$4,$10,$3
addu	$7,$7,$13
subu	$3,$0,$12
slt	$2,$12,0
movn	$12,$3,$2
lbu	$17,4($24)
lw	$2,16($sp)
sra	$6,$6,2
addu	$7,$7,$15
subu	$14,$14,$6
sra	$7,$7,2
subu	$17,$17,$7
addu	$13,$16,$21
addu	$10,$19,$2
subu	$3,$0,$14
slt	$2,$14,0
addiu	$11,$11,2
lbu	$6,10($25)
lbu	$23,10($fp)
movn	$14,$3,$2
addu	$5,$18,$22
lbu	$15,5($24)
addu	$8,$8,$20
addu	$11,$11,$16
subu	$3,$0,$17
slt	$2,$17,0
addiu	$13,$13,2
movn	$17,$3,$2
lbu	$16,6($24)
lw	$3,16($sp)
addu	$4,$4,$9
sra	$8,$8,2
addu	$11,$11,$21
addu	$13,$13,$18
lbu	$21,11($fp)
lbu	$18,11($25)
addiu	$5,$5,2
subu	$15,$15,$8
lbu	$9,7($24)
addu	$4,$4,$12
addu	$8,$6,$23
lbu	$12,12($25)
sra	$11,$11,2
addu	$13,$13,$22
addu	$5,$5,$19
lbu	$22,12($fp)
addiu	$10,$10,2
subu	$16,$16,$11
lbu	$20,13($fp)
lbu	$11,13($25)
addu	$4,$4,$14
addu	$7,$18,$21
lbu	$14,8($24)
sra	$13,$13,2
addu	$5,$5,$3
addu	$10,$10,$6
subu	$3,$0,$15
slt	$2,$15,0
addiu	$8,$8,2
movn	$15,$3,$2
subu	$9,$9,$13
lbu	$19,14($fp)
lbu	$13,9($24)
addu	$4,$4,$17
addu	$6,$12,$22
lbu	$17,14($25)
sra	$5,$5,2
addu	$8,$8,$18
subu	$3,$0,$16
slt	$2,$16,0
addu	$10,$10,$23
addiu	$7,$7,2
movn	$16,$3,$2
subu	$14,$14,$5
lbu	$18,15($fp)
addu	$4,$4,$15
addu	$5,$11,$20
lbu	$15,15($25)
sra	$10,$10,2
addu	$7,$7,$12
subu	$3,$0,$9
lbu	$12,10($24)
slt	$2,$9,0
addu	$8,$8,$21
addiu	$6,$6,2
movn	$9,$3,$2
subu	$13,$13,$10
addu	$4,$4,$16
sra	$8,$8,2
addu	$6,$6,$11
subu	$3,$0,$14
lbu	$11,11($24)
slt	$2,$14,0
addu	$10,$17,$19
addu	$7,$7,$22
addiu	$5,$5,2
movn	$14,$3,$2
subu	$12,$12,$8
lbu	$16,16($25)
addu	$4,$4,$9
sra	$7,$7,2
lbu	$9,12($24)
subu	$3,$0,$13
slt	$2,$13,0
addu	$8,$15,$18
addu	$6,$6,$20
addu	$5,$5,$17
addiu	$10,$10,2
subu	$11,$11,$7
movn	$13,$3,$2
lbu	$7,13($24)
addu	$4,$4,$14
sra	$6,$6,2
lbu	$14,16($fp)
subu	$3,$0,$12
slt	$2,$12,0
addu	$5,$5,$19
addu	$10,$10,$15
addiu	$8,$8,2
subu	$9,$9,$6
movn	$12,$3,$2
lbu	$6,14($24)
sra	$5,$5,2
subu	$3,$0,$11
slt	$2,$11,0
addu	$8,$8,$16
addu	$10,$10,$18
subu	$7,$7,$5
movn	$11,$3,$2
subu	$5,$0,$9
lbu	$3,15($24)
slt	$2,$9,0
addu	$8,$8,$14
sra	$10,$10,2
movn	$9,$5,$2
subu	$6,$6,$10
subu	$5,$0,$7
slt	$2,$7,0
addu	$4,$4,$13
sra	$8,$8,2
movn	$7,$5,$2
subu	$3,$3,$8
subu	$5,$0,$6
slt	$2,$6,0
addu	$4,$4,$12
movn	$6,$5,$2
addu	$4,$4,$11
subu	$5,$0,$3
slt	$2,$3,0
movn	$3,$5,$2
addu	$4,$4,$9
lw	$5,12($sp)
addu	$4,$4,$7
addiu	$5,$5,1
addu	$4,$4,$6
sw	$5,12($sp)
addu	$4,$4,$3
lw	$3,80($sp)
lw	$25,20($sp)
slt	$2,$5,$3
lw	$5,8($sp)
lw	$3,76($sp)
addu	$5,$5,$4
sw	$5,8($sp)
addu	$24,$24,$3
bne	$2,$0,$L726
addu	$fp,$fp,$3

$L705:
lw	$2,8($sp)
lw	$fp,60($sp)
lw	$23,56($sp)
lw	$22,52($sp)
lw	$21,48($sp)
lw	$20,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,64

$L725:
b	$L705
sw	$0,8($sp)

.set	macro
.set	reorder
.end	pix_abs16_xy2_c
.align	2
.ent	pix_abs8_c
.type	pix_abs8_c, @function
pix_abs8_c:
.set	nomips16
.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
.mask	0x00010000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-8
sw	$16,4($sp)
lw	$16,24($sp)
move	$14,$5
move	$13,$6
blez	$16,$L741
move	$25,$7

move	$24,$0
move	$15,$0
$L738:
lbu	$5,1($13)
lbu	$2,0($13)
lbu	$3,1($14)
lbu	$4,0($14)
lbu	$6,2($13)
lbu	$7,2($14)
subu	$3,$3,$5
subu	$4,$4,$2
lbu	$11,3($13)
lbu	$9,3($14)
subu	$7,$7,$6
lbu	$12,4($13)
lbu	$10,4($14)
subu	$8,$0,$3
slt	$5,$3,0
subu	$6,$0,$4
slt	$2,$4,0
movn	$4,$6,$2
subu	$9,$9,$11
movn	$3,$8,$5
lbu	$11,5($13)
lbu	$8,5($14)
subu	$5,$0,$7
slt	$2,$7,0
movn	$7,$5,$2
subu	$10,$10,$12
addu	$3,$3,$4
lbu	$6,6($14)
lbu	$12,6($13)
subu	$4,$0,$9
slt	$2,$9,0
movn	$9,$4,$2
subu	$8,$8,$11
addu	$3,$3,$7
lbu	$4,7($14)
lbu	$7,7($13)
subu	$5,$0,$10
slt	$2,$10,0
movn	$10,$5,$2
subu	$6,$6,$12
subu	$5,$0,$8
slt	$2,$8,0
addu	$3,$3,$9
movn	$8,$5,$2
subu	$4,$4,$7
subu	$5,$0,$6
slt	$2,$6,0
addu	$3,$3,$10
movn	$6,$5,$2
addu	$3,$3,$8
slt	$2,$4,0
subu	$5,$0,$4
movn	$4,$5,$2
addu	$3,$3,$6
addiu	$15,$15,1
addu	$3,$3,$4
slt	$2,$15,$16
addu	$24,$24,$3
addu	$14,$14,$25
bne	$2,$0,$L738
addu	$13,$13,$25

$L729:
move	$2,$24
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,8

$L741:
b	$L729
move	$24,$0

.set	macro
.set	reorder
.end	pix_abs8_c
.align	2
.ent	pix_abs8_x2_c
.type	pix_abs8_x2_c, @function
pix_abs8_x2_c:
.set	nomips16
.frame	$sp,24,$31		# vars= 0, regs= 5/0, args= 0, gp= 0
.mask	0x001f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-24
sw	$20,20($sp)
lw	$20,40($sp)
sw	$19,16($sp)
sw	$18,12($sp)
sw	$17,8($sp)
sw	$16,4($sp)
move	$25,$5
move	$24,$6
blez	$20,$L756
move	$19,$7

move	$18,$0
move	$17,$0
$L753:
lbu	$2,1($24)
lbu	$5,2($24)
lbu	$3,0($24)
lbu	$6,3($24)
lbu	$9,4($24)
addu	$3,$3,$2
addu	$2,$2,$5
lbu	$12,5($24)
addu	$5,$5,$6
lbu	$4,1($25)
lbu	$8,0($25)
addiu	$2,$2,1
addiu	$3,$3,1
lbu	$15,6($24)
sra	$2,$2,1
sra	$3,$3,1
addu	$6,$6,$9
lbu	$10,2($25)
addiu	$5,$5,1
subu	$4,$4,$2
subu	$8,$8,$3
lbu	$13,7($24)
sra	$5,$5,1
addu	$9,$9,$12
lbu	$11,3($25)
addiu	$6,$6,1
subu	$10,$10,$5
sra	$6,$6,1
addu	$12,$12,$15
lbu	$14,4($25)
lbu	$16,8($24)
subu	$7,$0,$4
slt	$3,$4,0
subu	$5,$0,$8
slt	$2,$8,0
addiu	$9,$9,1
subu	$11,$11,$6
movn	$4,$7,$3
movn	$8,$5,$2
addu	$15,$15,$13
lbu	$7,5($25)
subu	$3,$0,$10
slt	$2,$10,0
sra	$9,$9,1
addiu	$12,$12,1
movn	$10,$3,$2
subu	$14,$14,$9
lbu	$6,6($25)
subu	$3,$0,$11
slt	$2,$11,0
addu	$4,$4,$8
addu	$13,$13,$16
sra	$12,$12,1
addiu	$15,$15,1
movn	$11,$3,$2
subu	$7,$7,$12
lbu	$3,7($25)
subu	$5,$0,$14
slt	$2,$14,0
addu	$4,$4,$10
sra	$15,$15,1
addiu	$13,$13,1
movn	$14,$5,$2
subu	$6,$6,$15
subu	$5,$0,$7
slt	$2,$7,0
addu	$4,$4,$11
sra	$13,$13,1
movn	$7,$5,$2
subu	$3,$3,$13
subu	$5,$0,$6
slt	$2,$6,0
addu	$4,$4,$14
movn	$6,$5,$2
addu	$4,$4,$7
slt	$2,$3,0
subu	$5,$0,$3
movn	$3,$5,$2
addu	$4,$4,$6
addiu	$17,$17,1
addu	$4,$4,$3
slt	$2,$17,$20
addu	$18,$18,$4
addu	$25,$25,$19
bne	$2,$0,$L753
addu	$24,$24,$19

$L744:
move	$2,$18
lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,24

$L756:
b	$L744
move	$18,$0

.set	macro
.set	reorder
.end	pix_abs8_x2_c
.align	2
.ent	pix_abs8_y2_c
.type	pix_abs8_y2_c, @function
pix_abs8_y2_c:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 7/0, args= 0, gp= 0
.mask	0x007f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-32
sw	$22,28($sp)
lw	$22,48($sp)
sw	$21,24($sp)
sw	$20,20($sp)
sw	$19,16($sp)
sw	$18,12($sp)
sw	$17,8($sp)
sw	$16,4($sp)
move	$25,$5
move	$15,$6
blez	$22,$L771
move	$21,$7

addu	$19,$6,$7
move	$24,$19
move	$20,$0
move	$18,$0
$L768:
lbu	$6,1($24)
lbu	$3,0($24)
lbu	$4,1($15)
lbu	$2,0($15)
lbu	$7,2($24)
lbu	$5,2($15)
lbu	$10,3($24)
addu	$4,$4,$6
addu	$2,$2,$3
lbu	$6,3($15)
addu	$5,$5,$7
lbu	$3,1($25)
lbu	$7,4($24)
lbu	$9,0($25)
lbu	$8,4($15)
addiu	$4,$4,1
addiu	$2,$2,1
lbu	$12,5($24)
addu	$6,$6,$10
sra	$4,$4,1
sra	$2,$2,1
lbu	$13,2($25)
lbu	$10,5($15)
addiu	$5,$5,1
subu	$3,$3,$4
subu	$9,$9,$2
addu	$8,$8,$7
sra	$5,$5,1
lbu	$14,3($25)
lbu	$11,6($15)
lbu	$16,6($24)
addiu	$6,$6,1
subu	$13,$13,$5
addu	$10,$10,$12
sra	$6,$6,1
lbu	$12,4($25)
lbu	$17,7($24)
subu	$7,$0,$3
slt	$4,$3,0
subu	$5,$0,$9
slt	$2,$9,0
lbu	$15,7($15)
addiu	$8,$8,1
subu	$14,$14,$6
movn	$3,$7,$4
movn	$9,$5,$2
lbu	$7,5($25)
subu	$4,$0,$13
slt	$2,$13,0
addu	$11,$11,$16
sra	$8,$8,1
addiu	$10,$10,1
movn	$13,$4,$2
subu	$12,$12,$8
lbu	$6,6($25)
subu	$4,$0,$14
slt	$2,$14,0
addu	$3,$3,$9
addu	$15,$15,$17
sra	$10,$10,1
addiu	$11,$11,1
movn	$14,$4,$2
subu	$7,$7,$10
lbu	$4,7($25)
subu	$5,$0,$12
slt	$2,$12,0
addu	$3,$3,$13
sra	$11,$11,1
addiu	$15,$15,1
movn	$12,$5,$2
subu	$6,$6,$11
sra	$15,$15,1
subu	$5,$0,$7
slt	$2,$7,0
addu	$3,$3,$14
subu	$4,$4,$15
movn	$7,$5,$2
addu	$3,$3,$12
subu	$5,$0,$6
slt	$2,$6,0
movn	$6,$5,$2
addu	$3,$3,$7
slt	$2,$4,0
subu	$5,$0,$4
movn	$4,$5,$2
addu	$3,$3,$6
addiu	$18,$18,1
addu	$3,$3,$4
slt	$2,$18,$22
move	$15,$19
addu	$20,$20,$3
addu	$25,$25,$21
addu	$24,$24,$21
bne	$2,$0,$L768
addu	$19,$19,$21

$L759:
move	$2,$20
lw	$22,28($sp)
lw	$21,24($sp)
lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,32

$L771:
b	$L759
move	$20,$0

.set	macro
.set	reorder
.end	pix_abs8_y2_c
.align	2
.ent	pix_abs8_xy2_c
.type	pix_abs8_xy2_c, @function
pix_abs8_xy2_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 9/0, args= 0, gp= 0
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
lw	$2,56($sp)
sw	$20,20($sp)
sw	$fp,36($sp)
sw	$23,32($sp)
sw	$22,28($sp)
sw	$21,24($sp)
sw	$19,16($sp)
sw	$18,12($sp)
sw	$17,8($sp)
sw	$16,4($sp)
move	$25,$5
move	$20,$6
blez	$2,$L786
sw	$7,52($sp)

lw	$3,52($sp)
move	$fp,$0
addu	$23,$6,$3
move	$24,$23
b	$L783
move	$22,$0

$L787:
lw	$2,52($sp)
addu	$23,$23,$2
$L783:
lbu	$11,1($24)
lbu	$2,1($20)
lbu	$3,0($20)
lbu	$7,2($20)
lbu	$9,2($24)
lbu	$8,3($20)
lbu	$14,3($24)
lbu	$4,0($24)
addu	$3,$3,$2
addu	$2,$2,$11
lbu	$12,4($20)
lbu	$15,4($24)
addu	$5,$7,$9
addiu	$2,$2,2
addiu	$3,$3,2
addu	$6,$8,$14
lbu	$18,5($24)
addu	$3,$3,$4
addu	$2,$2,$7
addiu	$5,$5,2
lbu	$7,5($20)
addu	$10,$12,$15
lbu	$16,6($20)
lbu	$19,6($24)
addu	$3,$3,$11
addu	$2,$2,$9
addu	$5,$5,$8
lbu	$4,1($25)
lbu	$13,0($25)
addiu	$6,$6,2
lbu	$17,7($20)
lbu	$21,7($24)
addu	$11,$7,$18
sra	$2,$2,2
sra	$3,$3,2
addu	$5,$5,$14
addu	$6,$6,$12
lbu	$14,2($25)
addiu	$10,$10,2
subu	$4,$4,$2
subu	$13,$13,$3
sra	$5,$5,2
addu	$6,$6,$15
addu	$10,$10,$7
lbu	$15,3($25)
addu	$9,$16,$19
addiu	$11,$11,2
subu	$14,$14,$5
lbu	$20,8($20)
sra	$6,$6,2
lbu	$12,4($25)
subu	$7,$0,$4
slt	$3,$4,0
subu	$5,$0,$13
slt	$2,$13,0
addu	$8,$17,$21
addu	$10,$10,$18
addu	$11,$11,$16
addiu	$9,$9,2
subu	$15,$15,$6
movn	$4,$7,$3
movn	$13,$5,$2
lbu	$7,5($25)
lbu	$5,8($24)
subu	$3,$0,$14
slt	$2,$14,0
sra	$10,$10,2
addu	$11,$11,$19
addu	$9,$9,$17
addiu	$8,$8,2
movn	$14,$3,$2
subu	$12,$12,$10
addu	$8,$8,$20
lbu	$6,6($25)
subu	$3,$0,$15
slt	$2,$15,0
addu	$4,$4,$13
sra	$11,$11,2
addu	$9,$9,$21
movn	$15,$3,$2
subu	$7,$7,$11
addu	$8,$8,$5
lbu	$3,7($25)
subu	$5,$0,$12
slt	$2,$12,0
addu	$4,$4,$14
sra	$9,$9,2
movn	$12,$5,$2
subu	$6,$6,$9
subu	$5,$0,$7
slt	$2,$7,0
addu	$4,$4,$15
sra	$8,$8,2
movn	$7,$5,$2
subu	$3,$3,$8
subu	$5,$0,$6
slt	$2,$6,0
addu	$4,$4,$12
movn	$6,$5,$2
addu	$4,$4,$7
slt	$2,$3,0
subu	$5,$0,$3
movn	$3,$5,$2
addu	$4,$4,$6
addu	$4,$4,$3
lw	$3,56($sp)
addiu	$22,$22,1
slt	$2,$22,$3
lw	$3,52($sp)
addu	$fp,$fp,$4
addu	$25,$25,$3
addu	$24,$24,$3
bne	$2,$0,$L787
move	$20,$23

$L774:
move	$2,$fp
lw	$fp,36($sp)
lw	$23,32($sp)
lw	$22,28($sp)
lw	$21,24($sp)
lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,40

$L786:
b	$L774
move	$fp,$0

.set	macro
.set	reorder
.end	pix_abs8_xy2_c
.align	2
.ent	nsse16_c
.type	nsse16_c, @function
nsse16_c:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 8/0, args= 0, gp= 0
.mask	0x00ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-32
sw	$22,24($sp)
lw	$22,48($sp)
sw	$23,28($sp)
sw	$21,20($sp)
sw	$20,16($sp)
sw	$19,12($sp)
sw	$18,8($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$23,$4
move	$25,$5
blez	$22,$L789
move	$21,$7

addu	$20,$5,$7
addu	$18,$6,$7
mtlo	$0
move	$7,$0
move	$17,$0
li	$16,16			# 0x10
li	$19,15			# 0xf
$L800:
move	$8,$0
$L790:
addu	$3,$25,$8
addu	$4,$6,$8
lbu	$2,0($3)
lbu	$5,0($4)
addiu	$8,$8,1
subu	$2,$2,$5
bne	$8,$16,$L790
madd	$2,$2

addiu	$17,$17,1
slt	$2,$17,$22
bne	$2,$0,$L791
move	$11,$25

move	$4,$7
subu	$3,$0,$7
slt	$2,$7,0
movn	$4,$3,$2
$L793:
beq	$23,$0,$L798
lw	$22,24($sp)

lw	$2,0($23)
lw	$3,644($2)
lw	$23,28($sp)
madd	$4,$3
lw	$21,20($sp)
mflo	$2
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

$L791:
lbu	$13,0($20)
lbu	$5,0($18)
move	$15,$20
move	$9,$6
move	$14,$18
b	$L796
move	$12,$0

$L794:
lbu	$10,0($9)
lbu	$8,1($9)
lbu	$5,1($14)
subu	$3,$10,$24
subu	$2,$5,$8
addu	$2,$2,$3
addiu	$9,$9,1
bltz	$2,$L805
addiu	$14,$14,1

$L795:
subu	$2,$4,$2
beq	$12,$19,$L806
addu	$7,$7,$2

$L796:
move	$10,$13
lbu	$8,0($11)
lbu	$13,1($15)
lbu	$3,1($11)
addu	$2,$13,$8
subu	$2,$2,$3
subu	$4,$2,$10
move	$24,$5
addiu	$11,$11,1
addiu	$15,$15,1
bgez	$4,$L794
addiu	$12,$12,1

subu	$2,$3,$13
subu	$2,$2,$8
addu	$4,$2,$10
lbu	$8,1($9)
lbu	$10,0($9)
lbu	$5,1($14)
subu	$3,$10,$24
subu	$2,$5,$8
addu	$2,$2,$3
addiu	$9,$9,1
bgez	$2,$L795
addiu	$14,$14,1

$L805:
subu	$2,$8,$10
subu	$2,$2,$5
addu	$2,$2,$24
subu	$2,$4,$2
bne	$12,$19,$L796
addu	$7,$7,$2

$L806:
addu	$25,$25,$21
addu	$6,$6,$21
addu	$20,$20,$21
b	$L800
addu	$18,$18,$21

$L798:
mflo	$3
sll	$2,$4,3
addu	$2,$2,$3
lw	$23,28($sp)
lw	$21,20($sp)
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

$L789:
mtlo	$0
b	$L793
move	$4,$0

.set	macro
.set	reorder
.end	nsse16_c
.align	2
.ent	nsse8_c
.type	nsse8_c, @function
nsse8_c:
.set	nomips16
.frame	$sp,32,$31		# vars= 0, regs= 8/0, args= 0, gp= 0
.mask	0x00ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-32
sw	$22,24($sp)
lw	$22,48($sp)
sw	$23,28($sp)
sw	$20,16($sp)
sw	$21,20($sp)
sw	$19,12($sp)
sw	$18,8($sp)
sw	$17,4($sp)
sw	$16,0($sp)
move	$23,$4
move	$25,$5
blez	$22,$L808
move	$20,$7

addu	$19,$5,$7
addu	$18,$6,$7
mtlo	$0
move	$7,$0
move	$16,$0
li	$17,8			# 0x8
li	$21,7			# 0x7
$L819:
move	$8,$0
$L809:
addu	$3,$25,$8
addu	$4,$6,$8
lbu	$2,0($3)
lbu	$5,0($4)
addiu	$8,$8,1
subu	$2,$2,$5
bne	$8,$17,$L809
madd	$2,$2

addiu	$16,$16,1
slt	$2,$16,$22
bne	$2,$0,$L810
move	$11,$25

move	$4,$7
subu	$3,$0,$7
slt	$2,$7,0
movn	$4,$3,$2
$L812:
beq	$23,$0,$L817
lw	$22,24($sp)

lw	$2,0($23)
lw	$3,644($2)
lw	$23,28($sp)
madd	$4,$3
lw	$21,20($sp)
mflo	$2
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

$L810:
lbu	$13,0($19)
lbu	$5,0($18)
move	$15,$19
move	$9,$6
move	$14,$18
b	$L815
move	$12,$0

$L813:
lbu	$10,0($9)
lbu	$8,1($9)
lbu	$5,1($14)
subu	$3,$10,$24
subu	$2,$5,$8
addu	$2,$2,$3
addiu	$9,$9,1
bltz	$2,$L824
addiu	$14,$14,1

$L814:
subu	$2,$4,$2
beq	$12,$21,$L825
addu	$7,$7,$2

$L815:
move	$10,$13
lbu	$8,0($11)
lbu	$13,1($15)
lbu	$3,1($11)
addu	$2,$13,$8
subu	$2,$2,$3
subu	$4,$2,$10
move	$24,$5
addiu	$11,$11,1
addiu	$15,$15,1
bgez	$4,$L813
addiu	$12,$12,1

subu	$2,$3,$13
subu	$2,$2,$8
addu	$4,$2,$10
lbu	$8,1($9)
lbu	$10,0($9)
lbu	$5,1($14)
subu	$3,$10,$24
subu	$2,$5,$8
addu	$2,$2,$3
addiu	$9,$9,1
bgez	$2,$L814
addiu	$14,$14,1

$L824:
subu	$2,$8,$10
subu	$2,$2,$5
addu	$2,$2,$24
subu	$2,$4,$2
bne	$12,$21,$L815
addu	$7,$7,$2

$L825:
addu	$25,$25,$20
addu	$6,$6,$20
addu	$19,$19,$20
b	$L819
addu	$18,$18,$20

$L817:
mflo	$3
sll	$2,$4,3
addu	$2,$2,$3
lw	$23,28($sp)
lw	$21,20($sp)
lw	$20,16($sp)
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,32

$L808:
mtlo	$0
b	$L812
move	$4,$0

.set	macro
.set	reorder
.end	nsse8_c
.align	2
.ent	try_8x8basis_c
.type	try_8x8basis_c, @function
try_8x8basis_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$12,$4
move	$11,$5
move	$9,$0
move	$8,$0
li	$10,128			# 0x80
$L827:
addu	$3,$6,$8
lh	$2,0($3)
addu	$4,$12,$8
mul	$2,$7,$2
lh	$5,0($4)
addiu	$2,$2,512
addu	$3,$11,$8
sra	$2,$2,10
addu	$2,$2,$5
lh	$4,0($3)
sra	$2,$2,6
mul	$2,$2,$4
addiu	$8,$8,2
mul	$2,$2,$2
sra	$2,$2,4
bne	$8,$10,$L827
addu	$9,$9,$2

j	$31
srl	$2,$9,2

.set	macro
.set	reorder
.end	try_8x8basis_c
.align	2
.ent	add_8x8basis_c
.type	add_8x8basis_c, @function
add_8x8basis_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

move	$8,$4
move	$7,$0
li	$9,128			# 0x80
$L831:
addu	$2,$5,$7
lh	$3,0($2)
lhu	$4,0($8)
mul	$3,$6,$3
addiu	$7,$7,2
addiu	$3,$3,512
sra	$3,$3,10
addu	$3,$3,$4
sh	$3,0($8)
bne	$7,$9,$L831
addiu	$8,$8,2

j	$31
nop

.set	macro
.set	reorder
.end	add_8x8basis_c
.align	2
.globl	ff_block_permute
.ent	ff_block_permute
.type	ff_block_permute, @function
ff_block_permute:
.set	nomips16
.frame	$sp,136,$31		# vars= 128, regs= 0/0, args= 0, gp= 8
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-136
.cprestore	0
move	$10,$4
blez	$7,$L838
move	$11,$5

move	$8,$0
addiu	$9,$sp,8
$L836:
addu	$2,$6,$8
lbu	$3,0($2)
addiu	$8,$8,1
sll	$3,$3,1
addu	$5,$10,$3
lhu	$2,0($5)
addu	$3,$9,$3
slt	$4,$7,$8
sh	$2,0($3)
beq	$4,$0,$L836
sh	$0,0($5)

move	$8,$0
$L837:
addu	$2,$6,$8
lbu	$3,0($2)
addiu	$8,$8,1
addu	$2,$11,$3
lbu	$4,0($2)
sll	$3,$3,1
addu	$3,$9,$3
sll	$4,$4,1
lhu	$5,0($3)
addu	$4,$10,$4
slt	$2,$7,$8
beq	$2,$0,$L837
sh	$5,0($4)

$L838:
j	$31
addiu	$sp,$sp,136

.set	macro
.set	reorder
.end	ff_block_permute
.align	2
.ent	zero_cmp
.type	zero_cmp, @function
zero_cmp:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

j	$31
move	$2,$0

.set	macro
.set	reorder
.end	zero_cmp
.align	2
.ent	add_bytes_c
.type	add_bytes_c, @function
add_bytes_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

slt	$2,$6,8
move	$11,$4
bne	$2,$0,$L852
move	$12,$5

addiu	$2,$6,-8
srl	$2,$2,3
addiu	$2,$2,1
sll	$10,$2,3
move	$7,$4
move	$8,$5
move	$9,$0
$L846:
lbu	$3,0($8)
lbu	$2,0($7)
lbu	$4,1($7)
addu	$3,$3,$2
sb	$3,0($7)
lbu	$2,1($8)
lbu	$5,2($7)
addu	$2,$2,$4
sb	$2,1($7)
lbu	$3,2($8)
lbu	$4,3($7)
addu	$3,$3,$5
sb	$3,2($7)
lbu	$2,3($8)
lbu	$5,4($7)
addu	$2,$2,$4
sb	$2,3($7)
lbu	$3,4($8)
lbu	$4,5($7)
addu	$3,$3,$5
sb	$3,4($7)
lbu	$2,5($8)
lbu	$5,6($7)
addu	$2,$2,$4
sb	$2,5($7)
lbu	$3,6($8)
lbu	$4,7($7)
addu	$3,$3,$5
sb	$3,6($7)
lbu	$2,7($8)
addiu	$9,$9,8
addu	$2,$2,$4
sb	$2,7($7)
addiu	$8,$8,8
bne	$9,$10,$L846
addiu	$7,$7,8

move	$8,$9
$L845:
slt	$2,$8,$6
beq	$2,$0,$L853
addu	$7,$11,$8

addu	$5,$12,$8
$L848:
lbu	$2,0($5)
lbu	$3,0($7)
addiu	$8,$8,1
addu	$2,$2,$3
slt	$4,$8,$6
sb	$2,0($7)
addiu	$5,$5,1
bne	$4,$0,$L848
addiu	$7,$7,1

$L853:
j	$31
nop

$L852:
b	$L845
move	$8,$0

.set	macro
.set	reorder
.end	add_bytes_c
.align	2
.ent	diff_bytes_c
.type	diff_bytes_c, @function
diff_bytes_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

slt	$2,$7,8
bne	$2,$0,$L863
addiu	$2,$7,-8

srl	$2,$2,3
addiu	$2,$2,1
sll	$12,$2,3
move	$10,$5
move	$9,$6
move	$8,$4
move	$11,$0
$L857:
lbu	$2,0($9)
lbu	$3,0($10)
addiu	$11,$11,8
subu	$3,$3,$2
sb	$3,0($8)
lbu	$3,1($9)
lbu	$2,1($10)
subu	$2,$2,$3
sb	$2,1($8)
lbu	$2,2($9)
lbu	$3,2($10)
subu	$3,$3,$2
sb	$3,2($8)
lbu	$3,3($9)
lbu	$2,3($10)
subu	$2,$2,$3
sb	$2,3($8)
lbu	$2,4($9)
lbu	$3,4($10)
subu	$3,$3,$2
sb	$3,4($8)
lbu	$3,5($9)
lbu	$2,5($10)
subu	$2,$2,$3
sb	$2,5($8)
lbu	$2,6($9)
lbu	$3,6($10)
subu	$3,$3,$2
sb	$3,6($8)
lbu	$2,7($10)
lbu	$3,7($9)
addiu	$10,$10,8
subu	$2,$2,$3
sb	$2,7($8)
addiu	$9,$9,8
bne	$11,$12,$L857
addiu	$8,$8,8

move	$8,$11
$L856:
slt	$2,$8,$7
beq	$2,$0,$L864
addu	$5,$5,$8

addu	$6,$6,$8
addu	$9,$4,$8
$L859:
lbu	$2,0($5)
lbu	$3,0($6)
addiu	$8,$8,1
subu	$2,$2,$3
slt	$4,$8,$7
sb	$2,0($9)
addiu	$5,$5,1
addiu	$6,$6,1
bne	$4,$0,$L859
addiu	$9,$9,1

$L864:
j	$31
nop

$L863:
b	$L856
move	$8,$0

.set	macro
.set	reorder
.end	diff_bytes_c
.align	2
.ent	sub_hfyu_median_prediction_c
.type	sub_hfyu_median_prediction_c, @function
sub_hfyu_median_prediction_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,16($sp)
lw	$15,20($sp)
move	$13,$4
lbu	$9,0($14)
blez	$7,$L873
lbu	$11,0($15)

move	$10,$0
$L871:
addu	$2,$5,$10
lbu	$8,0($2)
addu	$3,$9,$8
subu	$3,$3,$11
andi	$3,$3,0xff
slt	$2,$8,$9
slt	$11,$8,$3
slt	$4,$3,$8
beq	$2,$0,$L868
move	$12,$8

slt	$2,$9,$3
beq	$11,$0,$L869
movn	$3,$9,$2

$L870:
addu	$2,$6,$10
lbu	$9,0($2)
addu	$4,$13,$10
addiu	$10,$10,1
subu	$3,$9,$3
slt	$2,$10,$7
move	$11,$8
bne	$2,$0,$L871
sb	$3,0($4)

$L867:
sw	$9,0($14)
$L874:
j	$31
sw	$12,0($15)

$L868:
slt	$2,$3,$9
bne	$4,$0,$L870
movn	$3,$9,$2

$L869:
addu	$2,$6,$10
lbu	$9,0($2)
addu	$4,$13,$10
move	$3,$8
addiu	$10,$10,1
subu	$3,$9,$3
slt	$2,$10,$7
move	$11,$8
bne	$2,$0,$L871
sb	$3,0($4)

b	$L874
sw	$9,0($14)

$L873:
b	$L867
move	$12,$11

.set	macro
.set	reorder
.end	sub_hfyu_median_prediction_c
.align	2
.ent	hadamard8_diff8x8_c
.type	hadamard8_diff8x8_c, @function
hadamard8_diff8x8_c:
.set	nomips16
.frame	$sp,288,$31		# vars= 256, regs= 6/0, args= 0, gp= 8
.mask	0x003f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-288
sw	$21,284($sp)
sw	$20,280($sp)
sw	$19,276($sp)
sw	$18,272($sp)
sw	$17,268($sp)
sw	$16,264($sp)
.cprestore	0
addiu	$24,$sp,8
move	$17,$7
move	$14,$6
move	$13,$5
move	$12,$24
move	$15,$24
move	$16,$0
li	$18,8			# 0x8
$L876:
lbu	$5,0($13)
lbu	$2,0($14)
lbu	$6,1($14)
lbu	$4,1($13)
subu	$2,$2,$5
subu	$3,$2,$6
subu	$2,$2,$4
addu	$3,$3,$4
addu	$2,$2,$6
sw	$2,0($15)
sw	$3,4($12)
lbu	$4,2($13)
lbu	$5,2($14)
lbu	$6,3($14)
lbu	$3,3($13)
subu	$5,$5,$4
subu	$2,$5,$6
subu	$5,$5,$3
addu	$5,$5,$6
addu	$2,$2,$3
sw	$2,12($12)
sw	$5,8($12)
lbu	$6,4($13)
lbu	$2,4($14)
lbu	$7,5($14)
lbu	$4,5($13)
subu	$2,$2,$6
subu	$3,$2,$7
subu	$2,$2,$4
addu	$3,$3,$4
addu	$2,$2,$7
sw	$2,16($12)
sw	$3,20($12)
lbu	$6,6($13)
lbu	$2,6($14)
lbu	$7,7($14)
lbu	$4,7($13)
subu	$2,$2,$6
subu	$3,$2,$7
subu	$2,$2,$4
addu	$3,$3,$4
addu	$2,$2,$7
sw	$2,24($12)
sw	$3,28($12)
lw	$4,0($15)
addiu	$16,$16,1
addu	$2,$5,$4
sw	$2,0($15)
lw	$3,4($12)
lw	$2,12($12)
lw	$9,24($12)
lw	$6,16($12)
subu	$7,$3,$2
addu	$8,$9,$6
subu	$4,$4,$5
addu	$2,$2,$3
sw	$4,8($12)
sw	$2,4($12)
sw	$7,12($12)
sw	$8,16($12)
lw	$3,20($12)
lw	$2,28($12)
subu	$6,$6,$9
subu	$4,$3,$2
addu	$2,$2,$3
sw	$6,24($12)
sw	$2,20($12)
sw	$4,28($12)
lw	$5,0($15)
addu	$14,$14,$17
addu	$2,$8,$5
sw	$2,0($15)
lw	$9,4($12)
lw	$2,20($12)
lw	$7,8($12)
lw	$3,24($12)
lw	$6,12($12)
lw	$4,28($12)
subu	$5,$5,$8
subu	$10,$9,$2
subu	$8,$7,$3
subu	$11,$6,$4
addu	$2,$2,$9
addu	$3,$3,$7
addu	$4,$4,$6
sw	$5,16($12)
sw	$2,4($12)
sw	$10,20($12)
sw	$3,8($12)
sw	$8,24($12)
sw	$4,12($12)
sw	$11,28($12)
addu	$13,$13,$17
addiu	$15,$15,32
bne	$16,$18,$L876
addiu	$12,$12,32

move	$25,$0
addiu	$21,$sp,40
$L885:
lw	$5,32($24)
lw	$4,96($24)
lw	$3,160($24)
lw	$2,224($24)
lw	$10,0($24)
lw	$13,64($24)
lw	$11,128($24)
lw	$12,192($24)
addu	$14,$5,$10
addu	$8,$2,$12
addu	$20,$4,$13
addu	$15,$3,$11
addu	$19,$8,$15
addu	$17,$20,$14
subu	$10,$10,$5
subu	$13,$13,$4
subu	$11,$11,$3
subu	$12,$12,$2
addu	$16,$13,$10
addu	$18,$12,$11
addu	$6,$19,$17
subu	$3,$17,$19
addu	$9,$18,$16
subu	$7,$0,$3
slt	$4,$3,0
subu	$5,$0,$6
slt	$2,$6,0
movn	$6,$5,$2
movn	$3,$7,$4
subu	$14,$14,$20
subu	$15,$15,$8
subu	$5,$16,$18
subu	$4,$0,$9
slt	$2,$9,0
movn	$9,$4,$2
addu	$8,$15,$14
addu	$3,$3,$6
subu	$4,$0,$5
slt	$2,$5,0
movn	$5,$4,$2
subu	$10,$10,$13
subu	$11,$11,$12
subu	$7,$14,$15
subu	$4,$0,$8
slt	$2,$8,0
addu	$3,$3,$9
movn	$8,$4,$2
addu	$6,$11,$10
addu	$3,$3,$5
slt	$2,$7,0
subu	$5,$0,$7
movn	$7,$5,$2
subu	$4,$10,$11
subu	$5,$0,$6
slt	$2,$6,0
addu	$3,$3,$8
movn	$6,$5,$2
addu	$3,$3,$7
subu	$5,$0,$4
slt	$2,$4,0
movn	$4,$5,$2
addu	$3,$3,$6
addu	$3,$3,$4
sw	$17,0($24)
sw	$14,64($24)
sw	$16,32($24)
sw	$10,96($24)
sw	$19,128($24)
sw	$15,192($24)
sw	$18,160($24)
sw	$11,224($24)
addiu	$24,$24,4
bne	$21,$24,$L885
addu	$25,$25,$3

move	$2,$25
lw	$21,284($sp)
lw	$20,280($sp)
lw	$19,276($sp)
lw	$18,272($sp)
lw	$17,268($sp)
lw	$16,264($sp)
j	$31
addiu	$sp,$sp,288

.set	macro
.set	reorder
.end	hadamard8_diff8x8_c
.align	2
.ent	hadamard8_intra8x8_c
.type	hadamard8_intra8x8_c, @function
hadamard8_intra8x8_c:
.set	nomips16
.frame	$sp,288,$31		# vars= 256, regs= 6/0, args= 0, gp= 8
.mask	0x003f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-288
sw	$21,284($sp)
sw	$20,280($sp)
sw	$19,276($sp)
sw	$18,272($sp)
sw	$17,268($sp)
sw	$16,264($sp)
.cprestore	0
addiu	$24,$sp,8
move	$17,$7
move	$15,$5
move	$14,$24
addiu	$16,$sp,264
$L890:
lbu	$2,0($15)
lbu	$8,1($15)
subu	$11,$2,$8
addu	$8,$8,$2
sw	$8,0($14)
sw	$11,4($14)
lbu	$2,2($15)
lbu	$4,3($15)
subu	$10,$2,$4
addu	$4,$4,$2
sw	$4,8($14)
sw	$10,12($14)
lbu	$2,4($15)
lbu	$5,5($15)
subu	$13,$8,$4
subu	$7,$2,$5
addu	$5,$5,$2
sw	$5,16($14)
sw	$7,20($14)
lbu	$6,6($15)
lbu	$2,7($15)
subu	$12,$11,$10
subu	$3,$6,$2
addu	$2,$2,$6
subu	$9,$5,$2
subu	$6,$7,$3
addu	$4,$4,$8
addu	$10,$10,$11
addu	$2,$2,$5
addu	$3,$3,$7
subu	$5,$4,$2
subu	$7,$10,$3
subu	$8,$13,$9
subu	$11,$12,$6
addu	$2,$2,$4
addu	$3,$3,$10
addu	$9,$9,$13
addu	$6,$6,$12
sw	$2,0($14)
sw	$5,16($14)
sw	$3,4($14)
sw	$7,20($14)
sw	$9,8($14)
sw	$8,24($14)
sw	$6,12($14)
sw	$11,28($14)
addiu	$14,$14,32
bne	$16,$14,$L890
addu	$15,$15,$17

move	$25,$0
addiu	$21,$sp,40
$L899:
lw	$5,32($24)
lw	$4,96($24)
lw	$3,160($24)
lw	$2,224($24)
lw	$10,0($24)
lw	$13,64($24)
lw	$11,128($24)
lw	$12,192($24)
addu	$14,$5,$10
addu	$8,$2,$12
addu	$20,$4,$13
addu	$15,$3,$11
addu	$19,$8,$15
addu	$17,$20,$14
subu	$10,$10,$5
subu	$13,$13,$4
subu	$11,$11,$3
subu	$12,$12,$2
addu	$16,$13,$10
addu	$18,$12,$11
addu	$6,$19,$17
subu	$3,$17,$19
addu	$9,$18,$16
subu	$7,$0,$3
slt	$4,$3,0
subu	$5,$0,$6
slt	$2,$6,0
movn	$6,$5,$2
movn	$3,$7,$4
subu	$14,$14,$20
subu	$15,$15,$8
subu	$5,$16,$18
subu	$4,$0,$9
slt	$2,$9,0
movn	$9,$4,$2
addu	$8,$15,$14
addu	$3,$3,$6
subu	$4,$0,$5
slt	$2,$5,0
movn	$5,$4,$2
subu	$10,$10,$13
subu	$11,$11,$12
subu	$7,$14,$15
subu	$4,$0,$8
slt	$2,$8,0
addu	$3,$3,$9
movn	$8,$4,$2
addu	$6,$11,$10
addu	$3,$3,$5
slt	$2,$7,0
subu	$5,$0,$7
movn	$7,$5,$2
subu	$4,$10,$11
subu	$5,$0,$6
slt	$2,$6,0
addu	$3,$3,$8
movn	$6,$5,$2
addu	$3,$3,$7
subu	$5,$0,$4
slt	$2,$4,0
movn	$4,$5,$2
addu	$3,$3,$6
addu	$3,$3,$4
sw	$17,0($24)
sw	$14,64($24)
sw	$16,32($24)
sw	$10,96($24)
sw	$19,128($24)
sw	$15,192($24)
sw	$18,160($24)
sw	$11,224($24)
addiu	$24,$24,4
bne	$21,$24,$L899
addu	$25,$25,$3

lw	$3,8($sp)
lw	$2,136($sp)
lw	$21,284($sp)
addu	$2,$2,$3
subu	$4,$0,$2
slt	$3,$2,0
movn	$2,$4,$3
subu	$2,$25,$2
lw	$20,280($sp)
lw	$19,276($sp)
lw	$18,272($sp)
lw	$17,268($sp)
lw	$16,264($sp)
j	$31
addiu	$sp,$sp,288

.set	macro
.set	reorder
.end	hadamard8_intra8x8_c
.align	2
.ent	dct_sad8x8_c
.type	dct_sad8x8_c, @function
dct_sad8x8_c:
.set	nomips16
.frame	$sp,168,$31		# vars= 128, regs= 3/0, args= 16, gp= 8
.mask	0x80030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-168
sw	$31,164($sp)
sw	$17,160($sp)
sw	$16,156($sp)
.cprestore	16
addiu	$17,$sp,24
lw	$25,2144($4)
move	$16,$4
jalr	$25
move	$4,$17

lw	$25,5020($16)
jalr	$25
move	$4,$17

lw	$25,2168($16)
jalr	$25
move	$4,$17

lw	$31,164($sp)
lw	$28,16($sp)
lw	$17,160($sp)
lw	$16,156($sp)
j	$31
addiu	$sp,$sp,168

.set	macro
.set	reorder
.end	dct_sad8x8_c
.align	2
.ent	dct264_sad8x8_c
.type	dct264_sad8x8_c, @function
dct264_sad8x8_c:
.set	nomips16
.frame	$sp,168,$31		# vars= 128, regs= 3/0, args= 16, gp= 8
.mask	0x80030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-168
sw	$31,164($sp)
sw	$17,160($sp)
sw	$16,156($sp)
.cprestore	16
lw	$25,2144($4)
addiu	$16,$sp,24
jalr	$25
move	$4,$16

lw	$28,16($sp)
move	$25,$16
move	$24,$16
addiu	$31,$sp,152
$L907:
lh	$15,2($24)
lh	$16,6($24)
lh	$17,0($24)
lh	$9,14($24)
lh	$7,12($24)
lh	$13,8($24)
lh	$10,4($24)
lh	$11,10($24)
subu	$4,$15,$7
subu	$2,$16,$13
subu	$3,$17,$9
subu	$6,$10,$11
addu	$8,$2,$3
addu	$14,$2,$4
sra	$5,$2,1
addu	$12,$4,$3
subu	$2,$3,$2
addu	$11,$11,$10
addu	$13,$13,$16
addu	$7,$7,$15
addu	$14,$14,$5
addu	$12,$12,$6
sra	$5,$6,1
subu	$2,$2,$6
subu	$8,$8,$4
addu	$9,$9,$17
sra	$3,$3,1
sra	$4,$4,1
addu	$12,$12,$3
subu	$2,$2,$5
subu	$8,$8,$4
subu	$14,$14,$6
addu	$10,$13,$9
addu	$3,$11,$7
subu	$9,$9,$13
subu	$7,$7,$11
andi	$10,$10,0xffff
andi	$3,$3,0xffff
sra	$6,$8,2
sra	$15,$2,2
sra	$11,$9,1
sra	$13,$12,2
sra	$4,$14,2
sra	$5,$7,1
subu	$16,$10,$3
subu	$8,$8,$15
subu	$11,$11,$7
subu	$13,$13,$14
addu	$4,$4,$12
addu	$5,$5,$9
addu	$6,$6,$2
addu	$3,$3,$10
sh	$3,0($24)
sh	$4,2($24)
sh	$5,4($24)
sh	$6,6($24)
sh	$16,8($24)
sh	$8,10($24)
sh	$11,12($24)
sh	$13,14($24)
addiu	$24,$24,16
bne	$31,$24,$L907
nop

move	$24,$0
addiu	$31,$sp,40
$L916:
lh	$10,112($25)
lh	$7,16($25)
lh	$8,80($25)
lh	$3,48($25)
lh	$6,0($25)
lh	$5,96($25)
lh	$11,32($25)
lh	$4,64($25)
subu	$13,$7,$5
subu	$12,$3,$4
addu	$9,$10,$6
addu	$5,$5,$7
addu	$2,$8,$11
addu	$4,$4,$3
subu	$11,$11,$8
subu	$6,$6,$10
subu	$17,$5,$2
addu	$3,$4,$9
addu	$2,$2,$5
addu	$15,$12,$13
addu	$14,$2,$3
subu	$9,$9,$4
subu	$3,$3,$2
addu	$10,$12,$6
sra	$4,$12,1
addu	$8,$13,$6
subu	$15,$15,$11
sra	$7,$17,1
addu	$7,$7,$9
addu	$15,$15,$4
addu	$8,$8,$11
subu	$10,$10,$13
sra	$16,$6,1
slt	$4,$3,0
subu	$6,$6,$12
subu	$5,$0,$14
slt	$2,$14,0
sra	$9,$9,1
sra	$13,$13,1
subu	$12,$0,$3
movn	$14,$5,$2
subu	$9,$9,$17
movn	$3,$12,$4
addu	$8,$8,$16
subu	$10,$10,$13
subu	$6,$6,$11
subu	$4,$0,$7
sra	$11,$11,1
slt	$2,$7,0
sra	$5,$15,2
movn	$7,$4,$2
addu	$5,$5,$8
subu	$6,$6,$11
slt	$2,$9,0
sra	$4,$10,2
addu	$3,$3,$14
subu	$11,$0,$9
addu	$4,$4,$6
movn	$9,$11,$2
addu	$3,$3,$7
sra	$6,$6,2
slt	$2,$5,0
subu	$7,$0,$5
subu	$10,$10,$6
movn	$5,$7,$2
subu	$6,$0,$4
slt	$2,$4,0
addu	$3,$3,$9
sra	$8,$8,2
movn	$4,$6,$2
subu	$8,$8,$15
addu	$3,$3,$5
slt	$2,$10,0
subu	$6,$0,$10
movn	$10,$6,$2
addu	$3,$3,$4
subu	$5,$0,$8
slt	$2,$8,0
movn	$8,$5,$2
addu	$3,$3,$10
addu	$3,$3,$8
addiu	$25,$25,2
bne	$31,$25,$L916
addu	$24,$24,$3

lw	$31,164($sp)
move	$2,$24
lw	$17,160($sp)
lw	$16,156($sp)
j	$31
addiu	$sp,$sp,168

.set	macro
.set	reorder
.end	dct264_sad8x8_c
.align	2
.ent	dct_max8x8_c
.type	dct_max8x8_c, @function
dct_max8x8_c:
.set	nomips16
.frame	$sp,168,$31		# vars= 128, regs= 3/0, args= 16, gp= 8
.mask	0x80030000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-168
sw	$31,164($sp)
sw	$17,160($sp)
sw	$16,156($sp)
.cprestore	16
lw	$25,2144($4)
addiu	$16,$sp,24
move	$17,$4
jalr	$25
move	$4,$16

lw	$25,5020($17)
jalr	$25
move	$4,$16

lw	$28,16($sp)
move	$6,$0
addiu	$7,$sp,152
$L922:
lh	$2,0($16)
addiu	$16,$16,2
subu	$5,$0,$2
slt	$3,$2,0
movn	$2,$5,$3
slt	$4,$6,$2
bne	$7,$16,$L922
movn	$6,$2,$4

lw	$31,164($sp)
move	$2,$6
lw	$17,160($sp)
lw	$16,156($sp)
j	$31
addiu	$sp,$sp,168

.set	macro
.set	reorder
.end	dct_max8x8_c
.align	2
.ent	bit8x8_c
.type	bit8x8_c, @function
bit8x8_c:
.set	nomips16
.frame	$sp,184,$31		# vars= 136, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-184
sw	$31,180($sp)
sw	$18,176($sp)
sw	$17,172($sp)
sw	$16,168($sp)
.cprestore	24
lw	$25,2144($4)
addiu	$17,$sp,40
move	$16,$4
move	$4,$17
jalr	$25
lw	$18,6780($16)

lw	$7,2056($16)
lw	$25,8692($16)
addiu	$2,$sp,32
move	$4,$16
sw	$2,16($sp)
move	$5,$17
jalr	$25
move	$6,$0

lw	$3,6180($16)
lw	$28,24($sp)
move	$4,$2
beq	$3,$0,$L926
sw	$2,6856($16)

lh	$3,40($sp)
lw	$2,6800($16)
lw	$13,6784($16)
addu	$2,$2,$3
lbu	$11,256($2)
lw	$5,6788($16)
li	$7,1			# 0x1
$L927:
slt	$2,$4,$7
bne	$2,$0,$L928
slt	$2,$7,$4

beq	$2,$0,$L938
sw	$7,32($sp)

addu	$2,$16,$7
addiu	$9,$2,6908
move	$10,$0
b	$L934
li	$12,-128			# 0xffffffffffffff80

$L939:
sll	$2,$10,7
addu	$2,$2,$6
bne	$8,$0,$L932
addu	$2,$13,$2

lbu	$2,0($2)
move	$10,$0
addu	$11,$11,$2
$L933:
addiu	$7,$7,1
slt	$2,$7,$4
sw	$7,32($sp)
beq	$2,$0,$L930
addiu	$9,$9,1

$L934:
lbu	$2,0($9)
sll	$2,$2,1
addu	$2,$17,$2
lh	$3,0($2)
addiu	$6,$3,64
bne	$3,$0,$L939
and	$8,$6,$12

addiu	$7,$7,1
slt	$2,$7,$4
addiu	$10,$10,1
sw	$7,32($sp)
bne	$2,$0,$L934
addiu	$9,$9,1

$L930:
addu	$3,$16,$4
lbu	$4,6908($3)
sll	$2,$4,1
addu	$2,$17,$2
lh	$3,0($2)
li	$2,-128			# 0xffffffffffffff80
addiu	$3,$3,64
and	$2,$3,$2
beq	$2,$0,$L940
sw	$4,32($sp)

addu	$11,$11,$18
$L928:
lw	$31,180($sp)
move	$2,$11
lw	$18,176($sp)
lw	$17,172($sp)
lw	$16,168($sp)
j	$31
addiu	$sp,$sp,184

$L926:
lw	$13,6792($16)
lw	$5,6796($16)
move	$11,$0
b	$L927
move	$7,$0

$L932:
addu	$11,$11,$18
b	$L933
move	$10,$0

$L940:
sll	$2,$10,7
addu	$2,$2,$3
addu	$2,$5,$2
lbu	$3,0($2)
lw	$31,180($sp)
addu	$11,$11,$3
move	$2,$11
lw	$18,176($sp)
lw	$17,172($sp)
lw	$16,168($sp)
j	$31
addiu	$sp,$sp,184

$L938:
b	$L930
move	$10,$0

.set	macro
.set	reorder
.end	bit8x8_c
.align	2
.ent	vsad_intra16_c
.type	vsad_intra16_c, @function
vsad_intra16_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
sw	$18,12($sp)
lw	$18,32($sp)
sw	$17,8($sp)
slt	$2,$18,2
sw	$16,4($sp)
move	$25,$5
bne	$2,$0,$L942
move	$17,$7

addu	$24,$5,$7
move	$14,$0
li	$15,1			# 0x1
li	$16,16			# 0x10
$L949:
move	$12,$25
move	$11,$24
move	$13,$0
$L947:
lbu	$4,1($11)
lbu	$2,0($11)
lbu	$3,1($12)
lbu	$5,0($12)
lbu	$7,2($11)
lbu	$6,2($12)
subu	$3,$3,$4
subu	$5,$5,$2
lbu	$4,3($12)
lbu	$10,3($11)
subu	$6,$6,$7
slt	$2,$5,0
slt	$7,$3,0
subu	$9,$0,$3
subu	$8,$0,$5
subu	$4,$4,$10
movn	$3,$9,$7
movn	$5,$8,$2
subu	$7,$0,$6
slt	$2,$6,0
movn	$6,$7,$2
addu	$3,$3,$5
subu	$7,$0,$4
slt	$2,$4,0
movn	$4,$7,$2
addu	$3,$3,$6
addu	$3,$3,$4
addiu	$13,$13,4
addu	$14,$14,$3
addiu	$12,$12,4
bne	$13,$16,$L947
addiu	$11,$11,4

addiu	$15,$15,1
slt	$2,$15,$18
beq	$2,$0,$L948
addu	$24,$24,$17

b	$L949
addu	$25,$25,$17

$L942:
move	$14,$0
$L948:
move	$2,$14
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	vsad_intra16_c
.align	2
.ent	vsad16_c
.type	vsad16_c, @function
vsad16_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
.mask	0x000f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
sw	$19,12($sp)
lw	$19,32($sp)
sw	$18,8($sp)
slt	$2,$19,2
sw	$17,4($sp)
sw	$16,0($sp)
move	$17,$5
move	$18,$6
bne	$2,$0,$L961
move	$16,$7

addu	$7,$5,$7
addu	$6,$6,$16
move	$13,$0
li	$5,1			# 0x1
move	$25,$0
li	$24,16			# 0x10
$L957:
addu	$15,$18,$25
addu	$14,$17,$25
move	$9,$7
move	$8,$6
b	$L956
move	$4,$0

$L955:
beq	$4,$24,$L962
addu	$13,$13,$2

$L956:
addu	$2,$14,$4
lbu	$11,0($8)
lbu	$12,0($2)
lbu	$10,0($9)
addu	$3,$15,$4
lbu	$3,0($3)
addu	$2,$11,$12
subu	$2,$2,$10
subu	$2,$2,$3
addiu	$4,$4,1
addiu	$9,$9,1
bgez	$2,$L955
addiu	$8,$8,1

addu	$2,$10,$3
subu	$2,$2,$11
subu	$2,$2,$12
bne	$4,$24,$L956
addu	$13,$13,$2

$L962:
addiu	$5,$5,1
slt	$2,$5,$19
addu	$25,$25,$16
addu	$7,$7,$16
bne	$2,$0,$L957
addu	$6,$6,$16

move	$2,$13
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,16

$L961:
move	$13,$0
move	$2,$13
lw	$19,12($sp)
lw	$18,8($sp)
lw	$17,4($sp)
lw	$16,0($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	vsad16_c
.align	2
.ent	vsse_intra16_c
.type	vsse_intra16_c, @function
vsse_intra16_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$24,16($sp)
slt	$2,$24,2
bne	$2,$0,$L964
move	$14,$5

addu	$13,$5,$7
move	$11,$0
li	$12,1			# 0x1
li	$15,16			# 0x10
$L967:
move	$9,$14
move	$8,$13
move	$10,$0
$L965:
lbu	$4,0($8)
lbu	$2,0($9)
lbu	$3,1($9)
subu	$2,$2,$4
lbu	$5,1($8)
mult	$2,$2
lbu	$4,3($9)
subu	$3,$3,$5
lbu	$6,3($8)
madd	$3,$3
lbu	$2,2($9)
lbu	$3,2($8)
subu	$4,$4,$6
madd	$4,$4
subu	$2,$2,$3
madd	$2,$2
addiu	$10,$10,4
mflo	$2
addiu	$9,$9,4
addu	$11,$11,$2
bne	$10,$15,$L965
addiu	$8,$8,4

addiu	$12,$12,1
slt	$2,$12,$24
beq	$2,$0,$L966
addu	$13,$13,$7

b	$L967
addu	$14,$14,$7

$L964:
move	$11,$0
$L966:
j	$31
move	$2,$11

.set	macro
.set	reorder
.end	vsse_intra16_c
.align	2
.ent	vsse16_c
.type	vsse16_c, @function
vsse16_c:
.set	nomips16
.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
.mask	0x00070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-16
sw	$18,12($sp)
lw	$18,32($sp)
sw	$17,8($sp)
slt	$2,$18,2
sw	$16,4($sp)
move	$17,$5
bne	$2,$0,$L978
move	$16,$6

addu	$25,$5,$7
addu	$24,$6,$7
mtlo	$0
li	$15,1			# 0x1
move	$14,$0
li	$13,16			# 0x10
$L974:
addu	$12,$16,$14
addu	$11,$17,$14
move	$10,$25
move	$9,$24
move	$8,$0
$L973:
addu	$3,$11,$8
lbu	$5,0($3)
lbu	$2,0($9)
lbu	$6,0($10)
addu	$3,$12,$8
addu	$2,$2,$5
lbu	$4,0($3)
subu	$2,$2,$6
subu	$2,$2,$4
addiu	$8,$8,1
madd	$2,$2
addiu	$10,$10,1
bne	$8,$13,$L973
addiu	$9,$9,1

addiu	$15,$15,1
slt	$2,$15,$18
addu	$14,$14,$7
addu	$25,$25,$7
bne	$2,$0,$L974
addu	$24,$24,$7

mflo	$2
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

$L978:
mtlo	$0
mflo	$2
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,16

.set	macro
.set	reorder
.end	vsse16_c
.align	2
.ent	ssd_int8_vs_int16_c
.type	ssd_int8_vs_int16_c, @function
ssd_int8_vs_int16_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$6,$L985
move	$8,$4

mtlo	$0
move	$7,$0
$L982:
addu	$2,$8,$7
lb	$3,0($2)
lh	$4,0($5)
addiu	$7,$7,1
subu	$3,$3,$4
slt	$2,$7,$6
madd	$3,$3
bne	$2,$0,$L982
addiu	$5,$5,2

$L981:
j	$31
mflo	$2

$L985:
b	$L981
mtlo	$0

.set	macro
.set	reorder
.end	ssd_int8_vs_int16_c
.align	2
.ent	hadamard8_diff16_c
.type	hadamard8_diff16_c, @function
hadamard8_diff16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	hadamard8_diff8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	hadamard8_diff8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L989
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L989:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	hadamard8_diff8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	hadamard8_diff8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	hadamard8_diff16_c
.align	2
.ent	hadamard8_intra16_c
.type	hadamard8_intra16_c, @function
hadamard8_intra16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	hadamard8_intra8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	hadamard8_intra8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L993
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L993:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	hadamard8_intra8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	hadamard8_intra8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	hadamard8_intra16_c
.align	2
.ent	dct_sad16_c
.type	dct_sad16_c, @function
dct_sad16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	dct_sad8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	dct_sad8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L997
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L997:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	dct_sad8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	dct_sad8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	dct_sad16_c
.align	2
.ent	dct264_sad16_c
.type	dct264_sad16_c, @function
dct264_sad16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	dct264_sad8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	dct264_sad8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L1001
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L1001:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	dct264_sad8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	dct264_sad8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	dct264_sad16_c
.align	2
.ent	dct_max16_c
.type	dct_max16_c, @function
dct_max16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	dct_max8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	dct_max8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L1005
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L1005:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	dct_max8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	dct_max8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	dct_max16_c
.align	2
.ent	bit16_c
.type	bit16_c, @function
bit16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	bit8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	bit8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L1009
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L1009:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	bit8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	bit8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	bit16_c
.globl	__mulsf3
.align	2
.ent	vector_fmul_c
.type	vector_fmul_c, @function
vector_fmul_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-48
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,44($sp)
sw	$19,40($sp)
sw	$18,36($sp)
sw	$17,32($sp)
sw	$16,28($sp)
.cprestore	16
blez	$6,$L1013
move	$19,$6

move	$16,$4
move	$18,$5
move	$17,$0
$L1012:
lw	$25,%call16(__mulsf3)($28)
lw	$4,0($16)
lw	$5,0($18)
jalr	$25
addiu	$17,$17,1

slt	$3,$17,$19
sw	$2,0($16)
lw	$28,16($sp)
addiu	$18,$18,4
bne	$3,$0,$L1012
addiu	$16,$16,4

$L1013:
lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	vector_fmul_c
.align	2
.ent	vector_fmul_reverse_c
.type	vector_fmul_reverse_c, @function
vector_fmul_reverse_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 6/0, args= 16, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-48
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,44($sp)
sw	$20,40($sp)
sw	$19,36($sp)
sw	$18,32($sp)
sw	$17,28($sp)
sw	$16,24($sp)
.cprestore	16
addiu	$2,$7,-1
sll	$2,$2,2
move	$20,$7
blez	$7,$L1018
addu	$6,$6,$2

move	$19,$5
move	$18,$6
move	$17,$4
move	$16,$0
$L1017:
lw	$25,%call16(__mulsf3)($28)
lw	$4,0($18)
lw	$5,0($19)
jalr	$25
addiu	$16,$16,1

slt	$3,$16,$20
sw	$2,0($17)
lw	$28,16($sp)
addiu	$19,$19,4
addiu	$18,$18,-4
bne	$3,$0,$L1017
addiu	$17,$17,4

$L1018:
lw	$31,44($sp)
lw	$20,40($sp)
lw	$19,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	vector_fmul_reverse_c
.globl	__floatsisf
.globl	__addsf3
.align	2
.globl	ff_vector_fmul_add_add_c
.ent	ff_vector_fmul_add_add_c
.type	ff_vector_fmul_add_add_c, @function
ff_vector_fmul_add_add_c:
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
lw	$22,84($sp)
move	$16,$4
move	$fp,$5
move	$23,$6
blez	$22,$L1023
move	$21,$7

lw	$25,%call16(__floatsisf)($28)
lw	$4,80($sp)
jalr	$25
move	$18,$16

move	$20,$2
lw	$2,88($sp)
lw	$28,16($sp)
sll	$19,$2,2
move	$17,$0
move	$16,$0
$L1022:
addu	$3,$fp,$16
addu	$2,$23,$16
lw	$25,%call16(__mulsf3)($28)
lw	$5,0($3)
lw	$4,0($2)
jalr	$25
addiu	$17,$17,1

lw	$28,16($sp)
addu	$3,$21,$16
lw	$5,0($3)
lw	$25,%call16(__addsf3)($28)
jalr	$25
move	$4,$2

lw	$28,16($sp)
move	$4,$2
lw	$25,%call16(__addsf3)($28)
jalr	$25
move	$5,$20

slt	$3,$17,$22
sw	$2,0($18)
lw	$28,16($sp)
addiu	$16,$16,4
bne	$3,$0,$L1022
addu	$18,$18,$19

$L1023:
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

.set	macro
.set	reorder
.end	ff_vector_fmul_add_add_c
.align	2
.globl	ff_float_to_int16_c
.ent	ff_float_to_int16_c
.type	ff_float_to_int16_c, @function
ff_float_to_int16_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$6,$L1031
li	$2,1136656384			# 0x43c00000

ori	$11,$2,0xffff
move	$7,$0
li	$10,983040			# 0xf0000
$L1028:
lw	$3,0($5)
addiu	$7,$7,1
and	$2,$3,$10
slt	$9,$7,$6
addiu	$5,$5,4
beq	$2,$0,$L1027
subu	$8,$11,$3

sra	$3,$8,31
$L1027:
addiu	$2,$3,-32768
sh	$2,0($4)
bne	$9,$0,$L1028
addiu	$4,$4,2

$L1031:
j	$31
nop

.set	macro
.set	reorder
.end	ff_float_to_int16_c
.align	2
.ent	ff_jref_idct1_put
.type	ff_jref_idct1_put, @function
ff_jref_idct1_put:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lh	$2,0($6)
lui	$3,%hi(ff_cropTbl+1024)
addiu	$2,$2,4
sra	$2,$2,3
addiu	$3,$3,%lo(ff_cropTbl+1024)
addu	$3,$3,$2
lbu	$5,0($3)
j	$31
sb	$5,0($4)

.set	macro
.set	reorder
.end	ff_jref_idct1_put
.align	2
.ent	ff_jref_idct1_add
.type	ff_jref_idct1_add, @function
ff_jref_idct1_add:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lh	$3,0($6)
lbu	$5,0($4)
addiu	$3,$3,4
sra	$3,$3,3
lui	$2,%hi(ff_cropTbl+1024)
addu	$3,$3,$5
addiu	$2,$2,%lo(ff_cropTbl+1024)
addu	$2,$2,$3
lbu	$5,0($2)
j	$31
sb	$5,0($4)

.set	macro
.set	reorder
.end	ff_jref_idct1_add
.align	2
.ent	just_return
.type	just_return, @function
just_return:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

j	$31
nop

.set	macro
.set	reorder
.end	just_return
.align	2
.globl	dsputil_static_init
.ent	dsputil_static_init
.type	dsputil_static_init, @function
dsputil_static_init:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$2,%hi(ff_cropTbl)
addiu	$5,$2,%lo(ff_cropTbl)
move	$3,$0
li	$4,256			# 0x100
addu	$2,$5,$3
$L1048:
sb	$3,1024($2)
addiu	$3,$3,1
bne	$3,$4,$L1048
addu	$2,$5,$3

lui	$2,%hi(ff_cropTbl+1024)
move	$3,$5
addiu	$2,$2,%lo(ff_cropTbl+1024)
li	$4,-1
$L1040:
sb	$0,0($3)
sb	$4,1280($3)
addiu	$3,$3,1
bne	$2,$3,$L1040
li	$5,256			# 0x100

lui	$2,%hi(ff_squareTbl)
addiu	$4,$2,%lo(ff_squareTbl)
li	$3,-256			# 0xffffffffffffff00
$L1041:
mul	$2,$3,$3
addiu	$3,$3,1
sw	$2,0($4)
bne	$3,$5,$L1041
addiu	$4,$4,4

lui	$2,%hi(ff_zigzag_direct)
lui	$3,%hi(inv_zigzag_direct16)
addiu	$7,$2,%lo(ff_zigzag_direct)
addiu	$6,$3,%lo(inv_zigzag_direct16)
li	$4,1			# 0x1
li	$5,65			# 0x41
addu	$3,$7,$4
$L1049:
lbu	$2,-1($3)
sll	$2,$2,1
addu	$2,$6,$2
sh	$4,0($2)
addiu	$4,$4,1
bne	$4,$5,$L1049
addu	$3,$7,$4

j	$31
nop

.set	macro
.set	reorder
.end	dsputil_static_init
.align	2
.globl	ff_check_alignment
.ent	ff_check_alignment
.type	ff_check_alignment, @function
ff_check_alignment:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

j	$31
move	$2,$0

.set	macro
.set	reorder
.end	ff_check_alignment
.align	2
.ent	ff_jref_idct4_add
.type	ff_jref_idct4_add, @function
ff_jref_idct4_add:
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
lw	$25,%call16(j_rev_dct4)($28)
move	$17,$4
move	$4,$6
move	$16,$6
jalr	$25
move	$18,$5

lui	$2,%hi(ff_cropTbl+1024)
lw	$28,16($sp)
addiu	$8,$2,%lo(ff_cropTbl+1024)
move	$7,$0
li	$9,4			# 0x4
$L1053:
lh	$2,0($16)
lbu	$3,0($17)
lbu	$4,1($17)
addu	$2,$2,$3
addu	$2,$8,$2
lbu	$3,0($2)
lbu	$5,2($17)
sb	$3,0($17)
lh	$2,2($16)
lbu	$6,3($17)
addu	$2,$2,$4
addu	$2,$8,$2
lbu	$3,0($2)
addiu	$7,$7,1
sb	$3,1($17)
lh	$2,4($16)
addu	$2,$2,$5
addu	$2,$8,$2
lbu	$3,0($2)
sb	$3,2($17)
lh	$2,6($16)
addiu	$16,$16,16
addu	$2,$2,$6
addu	$2,$8,$2
lbu	$3,0($2)
sb	$3,3($17)
bne	$7,$9,$L1053
addu	$17,$17,$18

lw	$31,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	ff_jref_idct4_add
.align	2
.ent	ff_jref_idct4_put
.type	ff_jref_idct4_put, @function
ff_jref_idct4_put:
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
lw	$25,%call16(j_rev_dct4)($28)
move	$17,$4
move	$4,$6
move	$16,$6
jalr	$25
move	$18,$5

lui	$2,%hi(ff_cropTbl+1024)
lw	$28,16($sp)
addiu	$5,$2,%lo(ff_cropTbl+1024)
move	$4,$0
li	$6,4			# 0x4
$L1057:
lh	$2,0($16)
addiu	$4,$4,1
addu	$2,$5,$2
lbu	$3,0($2)
sb	$3,0($17)
lh	$2,2($16)
addu	$2,$5,$2
lbu	$3,0($2)
sb	$3,1($17)
lh	$2,4($16)
addu	$2,$5,$2
lbu	$3,0($2)
sb	$3,2($17)
lh	$2,6($16)
addiu	$16,$16,16
addu	$2,$5,$2
lbu	$3,0($2)
sb	$3,3($17)
bne	$4,$6,$L1057
addu	$17,$17,$18

lw	$31,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	ff_jref_idct4_put
.align	2
.ent	ff_jref_idct2_add
.type	ff_jref_idct2_add, @function
ff_jref_idct2_add:
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
lw	$25,%call16(j_rev_dct2)($28)
move	$16,$4
move	$18,$6
move	$4,$6
jalr	$25
move	$17,$5

lh	$2,0($18)
lbu	$3,0($16)
lui	$4,%hi(ff_cropTbl+1024)
addiu	$4,$4,%lo(ff_cropTbl+1024)
addu	$2,$2,$3
addu	$2,$4,$2
lbu	$3,0($2)
lw	$28,16($sp)
sb	$3,0($16)
lbu	$5,1($16)
lh	$2,2($18)
addu	$17,$16,$17
addu	$2,$2,$5
addu	$2,$4,$2
lbu	$3,0($2)
sb	$3,1($16)
lh	$2,16($18)
lbu	$3,0($17)
lbu	$5,1($17)
addu	$2,$2,$3
addu	$2,$4,$2
lbu	$3,0($2)
sb	$3,0($17)
lh	$2,18($18)
addu	$2,$2,$5
addu	$4,$4,$2
lbu	$3,0($4)
sb	$3,1($17)
lw	$31,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	ff_jref_idct2_add
.align	2
.ent	ff_jref_idct2_put
.type	ff_jref_idct2_put, @function
ff_jref_idct2_put:
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
lw	$25,%call16(j_rev_dct2)($28)
move	$16,$6
move	$17,$4
move	$4,$6
jalr	$25
move	$18,$5

lh	$2,0($16)
lui	$4,%hi(ff_cropTbl+1024)
addiu	$4,$4,%lo(ff_cropTbl+1024)
addu	$2,$4,$2
lbu	$3,0($2)
lw	$28,16($sp)
sb	$3,0($17)
lh	$2,2($16)
addu	$18,$17,$18
addu	$2,$4,$2
lbu	$3,0($2)
sb	$3,1($17)
lh	$2,16($16)
addu	$2,$4,$2
lbu	$3,0($2)
sb	$3,0($18)
lh	$2,18($16)
addu	$4,$4,$2
lbu	$3,0($4)
sb	$3,1($18)
lw	$31,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	ff_jref_idct2_put
.align	2
.ent	ff_jref_idct_add
.type	ff_jref_idct_add, @function
ff_jref_idct_add:
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
lw	$25,%call16(j_rev_dct)($28)
move	$17,$4
move	$4,$6
move	$16,$6
jalr	$25
move	$18,$5

lw	$28,16($sp)
move	$4,$16
move	$5,$17
move	$6,$18
lw	$31,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
.option	pic0
j	add_pixels_clamped_c
.option	pic2
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	ff_jref_idct_add
.align	2
.ent	ff_jref_idct_put
.type	ff_jref_idct_put, @function
ff_jref_idct_put:
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
lw	$25,%call16(j_rev_dct)($28)
move	$17,$4
move	$4,$6
move	$16,$6
jalr	$25
move	$18,$5

lw	$28,16($sp)
move	$4,$16
move	$5,$17
move	$6,$18
lw	$31,36($sp)
lw	$18,32($sp)
lw	$17,28($sp)
lw	$16,24($sp)
.option	pic0
j	put_pixels_clamped_c
.option	pic2
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	ff_jref_idct_put
.align	2
.ent	clear_blocks_c
.type	clear_blocks_c, @function
clear_blocks_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$28,$28,%lo(__gnu_local_gp)
lw	$25,%call16(memset)($28)
move	$5,$0
jr	$25
li	$6,768			# 0x300

.set	macro
.set	reorder
.end	clear_blocks_c
.section	.rodata.str1.4,"aMS",@progbits,1
.align	2
$LC0:
.ascii	"Internal error, IDCT permutation not set\012\000"
.text
.align	2
.globl	dsputil_init
.ent	dsputil_init
.type	dsputil_init, @function
dsputil_init:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-48
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,44($sp)
sw	$19,40($sp)
sw	$18,36($sp)
sw	$17,32($sp)
sw	$16,28($sp)
.cprestore	16
lw	$3,344($5)
li	$2,1			# 0x1
move	$19,$5
beq	$3,$2,$L1105
move	$18,$4

li	$2,6			# 0x6
beq	$3,$2,$L1106
lw	$2,%got(ff_jpeg_fdct_islow)($28)

lw	$3,%got(ff_fdct248_islow)($28)
sw	$2,2880($4)
sw	$3,2884($4)
$L1072:
lw	$3,664($19)
li	$4,1			# 0x1
beq	$3,$4,$L1107
li	$5,2			# 0x2

$L1116:
beq	$3,$5,$L1108
li	$2,3			# 0x3

beq	$3,$2,$L1109
lui	$2,%hi(ff_jref_idct1_put)

lw	$3,372($19)
beq	$3,$4,$L1110
li	$2,12			# 0xc

beq	$3,$2,$L1111
lw	$2,%got(simple_idct_put)($28)

lw	$3,%got(simple_idct_add)($28)
sw	$2,2892($18)
lw	$2,%got(simple_idct)($28)
sw	$3,2896($18)
sw	$2,2888($18)
b	$L1077
sw	$4,2964($18)

$L1106:
lw	$3,%got(ff_faandct248)($28)
lw	$2,%got(ff_faandct)($28)
sw	$3,2884($4)
lw	$3,664($19)
sw	$2,2880($4)
li	$4,1			# 0x1
bne	$3,$4,$L1116
li	$5,2			# 0x2

$L1107:
lw	$2,372($19)
sltu	$2,$2,2
bne	$2,$0,$L1112
lw	$2,%got(ff_h264_lowres_idct_put_c)($28)

lw	$3,%got(ff_h264_lowres_idct_add_c)($28)
sw	$2,2892($18)
sw	$3,2896($18)
$L1076:
lw	$2,%got(j_rev_dct4)($28)
li	$3,1			# 0x1
sw	$2,2888($18)
sw	$3,2964($18)
$L1077:
lui	$2,%hi(put_qpel16_mc00_c)
lui	$3,%hi(put_qpel16_mc10_c)
addiu	$2,$2,%lo(put_qpel16_mc00_c)
addiu	$3,$3,%lo(put_qpel16_mc10_c)
sw	$2,808($18)
sw	$3,812($18)
lui	$2,%hi(put_qpel16_mc20_c)
lui	$3,%hi(put_qpel16_mc30_c)
addiu	$2,$2,%lo(put_qpel16_mc20_c)
addiu	$3,$3,%lo(put_qpel16_mc30_c)
sw	$2,816($18)
sw	$3,820($18)
lui	$2,%hi(put_qpel16_mc01_c)
lui	$3,%hi(put_qpel16_mc11_c)
addiu	$2,$2,%lo(put_qpel16_mc01_c)
addiu	$3,$3,%lo(put_qpel16_mc11_c)
sw	$2,824($18)
sw	$3,828($18)
lui	$2,%hi(put_qpel16_mc21_c)
lui	$3,%hi(put_qpel16_mc31_c)
addiu	$2,$2,%lo(put_qpel16_mc21_c)
addiu	$3,$3,%lo(put_qpel16_mc31_c)
sw	$2,832($18)
sw	$3,836($18)
lui	$2,%hi(put_qpel16_mc02_c)
lui	$3,%hi(put_qpel16_mc12_c)
addiu	$2,$2,%lo(put_qpel16_mc02_c)
addiu	$3,$3,%lo(put_qpel16_mc12_c)
sw	$2,840($18)
sw	$3,844($18)
lui	$2,%hi(put_qpel16_mc22_c)
lui	$3,%hi(put_qpel16_mc32_c)
addiu	$2,$2,%lo(put_qpel16_mc22_c)
addiu	$3,$3,%lo(put_qpel16_mc32_c)
sw	$2,848($18)
sw	$3,852($18)
lui	$2,%hi(put_qpel16_mc03_c)
lui	$3,%hi(put_qpel16_mc13_c)
addiu	$2,$2,%lo(put_qpel16_mc03_c)
addiu	$3,$3,%lo(put_qpel16_mc13_c)
sw	$2,856($18)
sw	$3,860($18)
lui	$2,%hi(put_qpel16_mc23_c)
lui	$3,%hi(put_qpel16_mc33_c)
addiu	$2,$2,%lo(put_qpel16_mc23_c)
addiu	$3,$3,%lo(put_qpel16_mc33_c)
sw	$2,864($18)
sw	$3,868($18)
lui	$2,%hi(put_no_rnd_qpel16_mc00_c)
lui	$3,%hi(put_no_rnd_qpel16_mc10_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc00_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc10_c)
sw	$2,1064($18)
sw	$3,1068($18)
lui	$2,%hi(put_no_rnd_qpel16_mc20_c)
lui	$3,%hi(put_no_rnd_qpel16_mc30_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc20_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc30_c)
sw	$2,1072($18)
sw	$3,1076($18)
lui	$2,%hi(put_no_rnd_qpel16_mc01_c)
lui	$3,%hi(put_no_rnd_qpel16_mc11_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc01_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc11_c)
sw	$2,1080($18)
sw	$3,1084($18)
lui	$2,%hi(put_no_rnd_qpel16_mc21_c)
lui	$3,%hi(put_no_rnd_qpel16_mc31_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc21_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc31_c)
sw	$2,1088($18)
sw	$3,1092($18)
lui	$2,%hi(put_no_rnd_qpel16_mc02_c)
lui	$3,%hi(put_no_rnd_qpel16_mc12_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc02_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc12_c)
sw	$2,1096($18)
sw	$3,1100($18)
lui	$2,%hi(put_no_rnd_qpel16_mc22_c)
lui	$3,%hi(put_no_rnd_qpel16_mc32_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc22_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc32_c)
sw	$2,1104($18)
sw	$3,1108($18)
lui	$2,%hi(put_no_rnd_qpel16_mc03_c)
lui	$3,%hi(put_no_rnd_qpel16_mc13_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc03_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc13_c)
sw	$2,1112($18)
sw	$3,1116($18)
lui	$2,%hi(put_no_rnd_qpel16_mc23_c)
lui	$3,%hi(put_no_rnd_qpel16_mc33_c)
addiu	$2,$2,%lo(put_no_rnd_qpel16_mc23_c)
addiu	$3,$3,%lo(put_no_rnd_qpel16_mc33_c)
sw	$2,1120($18)
sw	$3,1124($18)
lui	$2,%hi(avg_qpel16_mc00_c)
lui	$3,%hi(avg_qpel16_mc10_c)
addiu	$2,$2,%lo(avg_qpel16_mc00_c)
addiu	$3,$3,%lo(avg_qpel16_mc10_c)
sw	$2,936($18)
sw	$3,940($18)
lui	$2,%hi(avg_qpel16_mc20_c)
lui	$3,%hi(avg_qpel16_mc30_c)
addiu	$2,$2,%lo(avg_qpel16_mc20_c)
addiu	$3,$3,%lo(avg_qpel16_mc30_c)
sw	$2,944($18)
sw	$3,948($18)
lui	$2,%hi(avg_qpel16_mc01_c)
lui	$3,%hi(avg_qpel16_mc11_c)
addiu	$2,$2,%lo(avg_qpel16_mc01_c)
addiu	$3,$3,%lo(avg_qpel16_mc11_c)
sw	$2,952($18)
sw	$3,956($18)
lui	$2,%hi(avg_qpel16_mc21_c)
lui	$3,%hi(avg_qpel16_mc31_c)
addiu	$2,$2,%lo(avg_qpel16_mc21_c)
addiu	$3,$3,%lo(avg_qpel16_mc31_c)
sw	$2,960($18)
sw	$3,964($18)
lui	$2,%hi(avg_qpel16_mc02_c)
lui	$3,%hi(avg_qpel16_mc12_c)
addiu	$2,$2,%lo(avg_qpel16_mc02_c)
addiu	$3,$3,%lo(avg_qpel16_mc12_c)
sw	$2,968($18)
sw	$3,972($18)
lui	$2,%hi(avg_qpel16_mc22_c)
lui	$3,%hi(avg_qpel16_mc32_c)
addiu	$2,$2,%lo(avg_qpel16_mc22_c)
addiu	$3,$3,%lo(avg_qpel16_mc32_c)
sw	$2,976($18)
sw	$3,980($18)
lui	$2,%hi(avg_qpel16_mc03_c)
lui	$3,%hi(avg_qpel16_mc13_c)
addiu	$2,$2,%lo(avg_qpel16_mc03_c)
addiu	$3,$3,%lo(avg_qpel16_mc13_c)
sw	$2,984($18)
sw	$3,988($18)
lui	$2,%hi(avg_qpel16_mc23_c)
lui	$3,%hi(avg_qpel16_mc33_c)
addiu	$2,$2,%lo(avg_qpel16_mc23_c)
addiu	$3,$3,%lo(avg_qpel16_mc33_c)
sw	$2,992($18)
sw	$3,996($18)
lui	$2,%hi(put_qpel8_mc00_c)
lui	$3,%hi(put_qpel8_mc10_c)
addiu	$2,$2,%lo(put_qpel8_mc00_c)
addiu	$3,$3,%lo(put_qpel8_mc10_c)
sw	$2,872($18)
sw	$3,876($18)
lui	$2,%hi(put_qpel8_mc20_c)
lui	$3,%hi(put_qpel8_mc30_c)
addiu	$2,$2,%lo(put_qpel8_mc20_c)
addiu	$3,$3,%lo(put_qpel8_mc30_c)
sw	$2,880($18)
sw	$3,884($18)
lui	$2,%hi(put_qpel8_mc01_c)
lui	$3,%hi(put_qpel8_mc11_c)
addiu	$2,$2,%lo(put_qpel8_mc01_c)
addiu	$3,$3,%lo(put_qpel8_mc11_c)
sw	$2,888($18)
sw	$3,892($18)
lui	$2,%hi(put_qpel8_mc21_c)
lui	$3,%hi(put_qpel8_mc31_c)
addiu	$2,$2,%lo(put_qpel8_mc21_c)
addiu	$3,$3,%lo(put_qpel8_mc31_c)
sw	$2,896($18)
sw	$3,900($18)
lui	$2,%hi(put_qpel8_mc02_c)
lui	$3,%hi(put_qpel8_mc12_c)
addiu	$2,$2,%lo(put_qpel8_mc02_c)
addiu	$3,$3,%lo(put_qpel8_mc12_c)
sw	$2,904($18)
sw	$3,908($18)
lui	$2,%hi(put_qpel8_mc22_c)
lui	$3,%hi(put_qpel8_mc32_c)
addiu	$2,$2,%lo(put_qpel8_mc22_c)
addiu	$3,$3,%lo(put_qpel8_mc32_c)
sw	$2,912($18)
sw	$3,916($18)
lui	$2,%hi(put_qpel8_mc03_c)
lui	$3,%hi(put_qpel8_mc13_c)
addiu	$2,$2,%lo(put_qpel8_mc03_c)
addiu	$3,$3,%lo(put_qpel8_mc13_c)
sw	$2,920($18)
sw	$3,924($18)
lui	$2,%hi(put_qpel8_mc23_c)
lui	$3,%hi(put_qpel8_mc33_c)
addiu	$2,$2,%lo(put_qpel8_mc23_c)
addiu	$3,$3,%lo(put_qpel8_mc33_c)
sw	$2,928($18)
sw	$3,932($18)
lui	$2,%hi(put_no_rnd_qpel8_mc00_c)
lui	$3,%hi(put_no_rnd_qpel8_mc10_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc00_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc10_c)
sw	$2,1128($18)
sw	$3,1132($18)
lui	$2,%hi(put_no_rnd_qpel8_mc20_c)
lui	$3,%hi(put_no_rnd_qpel8_mc30_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc20_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc30_c)
sw	$2,1136($18)
sw	$3,1140($18)
lui	$2,%hi(put_no_rnd_qpel8_mc01_c)
lui	$3,%hi(put_no_rnd_qpel8_mc11_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc01_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc11_c)
sw	$2,1144($18)
sw	$3,1148($18)
lui	$2,%hi(put_no_rnd_qpel8_mc21_c)
lui	$3,%hi(put_no_rnd_qpel8_mc31_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc21_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc31_c)
sw	$2,1152($18)
sw	$3,1156($18)
lui	$2,%hi(put_no_rnd_qpel8_mc02_c)
lui	$3,%hi(put_no_rnd_qpel8_mc12_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc02_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc12_c)
sw	$2,1160($18)
sw	$3,1164($18)
lui	$2,%hi(put_no_rnd_qpel8_mc22_c)
lui	$3,%hi(put_no_rnd_qpel8_mc32_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc22_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc32_c)
sw	$2,1168($18)
sw	$3,1172($18)
lui	$2,%hi(put_no_rnd_qpel8_mc03_c)
lui	$3,%hi(put_no_rnd_qpel8_mc13_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc03_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc13_c)
sw	$2,1176($18)
sw	$3,1180($18)
lui	$2,%hi(put_no_rnd_qpel8_mc23_c)
lui	$3,%hi(put_no_rnd_qpel8_mc33_c)
addiu	$2,$2,%lo(put_no_rnd_qpel8_mc23_c)
addiu	$3,$3,%lo(put_no_rnd_qpel8_mc33_c)
sw	$2,1184($18)
sw	$3,1188($18)
lui	$2,%hi(avg_qpel8_mc00_c)
lui	$3,%hi(avg_qpel8_mc10_c)
addiu	$2,$2,%lo(avg_qpel8_mc00_c)
addiu	$3,$3,%lo(avg_qpel8_mc10_c)
sw	$2,1000($18)
sw	$3,1004($18)
lui	$2,%hi(avg_qpel8_mc20_c)
lui	$3,%hi(avg_qpel8_mc30_c)
addiu	$2,$2,%lo(avg_qpel8_mc20_c)
addiu	$3,$3,%lo(avg_qpel8_mc30_c)
sw	$2,1008($18)
sw	$3,1012($18)
lui	$2,%hi(avg_qpel8_mc01_c)
lui	$3,%hi(avg_qpel8_mc11_c)
addiu	$2,$2,%lo(avg_qpel8_mc01_c)
addiu	$3,$3,%lo(avg_qpel8_mc11_c)
sw	$2,1016($18)
sw	$3,1020($18)
lui	$2,%hi(avg_qpel8_mc21_c)
lui	$3,%hi(avg_qpel8_mc31_c)
addiu	$2,$2,%lo(avg_qpel8_mc21_c)
addiu	$3,$3,%lo(avg_qpel8_mc31_c)
sw	$2,1024($18)
sw	$3,1028($18)
lui	$2,%hi(avg_qpel8_mc02_c)
lui	$3,%hi(avg_qpel8_mc12_c)
addiu	$2,$2,%lo(avg_qpel8_mc02_c)
addiu	$3,$3,%lo(avg_qpel8_mc12_c)
sw	$2,1032($18)
sw	$3,1036($18)
lui	$2,%hi(avg_qpel8_mc22_c)
lui	$3,%hi(avg_qpel8_mc32_c)
addiu	$2,$2,%lo(avg_qpel8_mc22_c)
addiu	$3,$3,%lo(avg_qpel8_mc32_c)
sw	$2,1040($18)
sw	$3,1044($18)
lui	$2,%hi(avg_qpel8_mc03_c)
lui	$3,%hi(avg_qpel8_mc13_c)
addiu	$2,$2,%lo(avg_qpel8_mc03_c)
addiu	$3,$3,%lo(avg_qpel8_mc13_c)
sw	$2,1048($18)
sw	$3,1052($18)
lui	$2,%hi(avg_qpel8_mc23_c)
lui	$3,%hi(avg_qpel8_mc33_c)
lw	$25,%call16(h264dsputil_init)($28)
addiu	$2,$2,%lo(avg_qpel8_mc23_c)
addiu	$3,$3,%lo(avg_qpel8_mc33_c)
sw	$2,1056($18)
sw	$3,1060($18)
move	$4,$18
jalr	$25
move	$5,$19

lui	$2,%hi(get_pixels_c)
addiu	$2,$2,%lo(get_pixels_c)
sw	$2,0($18)
lui	$3,%hi(diff_pixels_c)
lui	$2,%hi(put_pixels_clamped_c)
addiu	$3,$3,%lo(diff_pixels_c)
addiu	$2,$2,%lo(put_pixels_clamped_c)
sw	$3,4($18)
sw	$2,8($18)
lui	$3,%hi(put_signed_pixels_clamped_c)
lui	$2,%hi(add_pixels_clamped_c)
addiu	$3,$3,%lo(put_signed_pixels_clamped_c)
addiu	$2,$2,%lo(add_pixels_clamped_c)
sw	$3,12($18)
sw	$2,16($18)
lui	$3,%hi(add_pixels8_c)
lui	$2,%hi(add_pixels4_c)
addiu	$3,$3,%lo(add_pixels8_c)
addiu	$2,$2,%lo(add_pixels4_c)
sw	$3,20($18)
sw	$2,24($18)
lui	$3,%hi(sum_abs_dctelem_c)
lui	$2,%hi(gmc1_c)
addiu	$3,$3,%lo(sum_abs_dctelem_c)
addiu	$2,$2,%lo(gmc1_c)
sw	$3,28($18)
sw	$2,32($18)
lui	$3,%hi(ff_gmc_c)
lui	$2,%hi(clear_blocks_c)
addiu	$3,$3,%lo(ff_gmc_c)
addiu	$2,$2,%lo(clear_blocks_c)
sw	$3,36($18)
sw	$2,40($18)
lui	$3,%hi(pix_sum_c)
lui	$2,%hi(pix_norm1_c)
addiu	$3,$3,%lo(pix_sum_c)
addiu	$2,$2,%lo(pix_norm1_c)
sw	$3,44($18)
sw	$2,48($18)
lui	$3,%hi(pix_abs16_x2_c)
lui	$2,%hi(pix_abs16_y2_c)
addiu	$3,$3,%lo(pix_abs16_x2_c)
addiu	$2,$2,%lo(pix_abs16_y2_c)
sw	$3,2772($18)
sw	$2,2776($18)
lui	$3,%hi(pix_abs16_xy2_c)
lui	$2,%hi(pix_abs8_x2_c)
addiu	$3,$3,%lo(pix_abs16_xy2_c)
addiu	$2,$2,%lo(pix_abs8_x2_c)
sw	$3,2780($18)
sw	$2,2788($18)
lui	$3,%hi(pix_abs8_y2_c)
lui	$2,%hi(pix_abs8_xy2_c)
addiu	$3,$3,%lo(pix_abs8_y2_c)
addiu	$2,$2,%lo(pix_abs8_xy2_c)
sw	$3,2792($18)
sw	$2,2796($18)
lui	$3,%hi(put_pixels16_c)
lui	$2,%hi(put_pixels16_x2_c)
addiu	$3,$3,%lo(put_pixels16_c)
addiu	$2,$2,%lo(put_pixels16_x2_c)
sw	$3,456($18)
sw	$2,460($18)
lui	$3,%hi(put_pixels16_y2_c)
lui	$2,%hi(put_pixels16_xy2_c)
addiu	$3,$3,%lo(put_pixels16_y2_c)
addiu	$2,$2,%lo(put_pixels16_xy2_c)
sw	$3,464($18)
sw	$2,468($18)
lui	$3,%hi(put_no_rnd_pixels16_c)
lui	$2,%hi(put_no_rnd_pixels16_x2_c)
addiu	$3,$3,%lo(put_no_rnd_pixels16_c)
addiu	$2,$2,%lo(put_no_rnd_pixels16_x2_c)
sw	$3,584($18)
sw	$2,588($18)
lui	$3,%hi(put_no_rnd_pixels16_y2_c)
lui	$2,%hi(put_no_rnd_pixels16_xy2_c)
addiu	$3,$3,%lo(put_no_rnd_pixels16_y2_c)
addiu	$2,$2,%lo(put_no_rnd_pixels16_xy2_c)
sw	$3,592($18)
sw	$2,596($18)
lui	$3,%hi(put_pixels8_c)
lui	$2,%hi(put_pixels8_x2_c)
addiu	$3,$3,%lo(put_pixels8_c)
addiu	$2,$2,%lo(put_pixels8_x2_c)
sw	$3,472($18)
sw	$2,476($18)
lui	$3,%hi(put_pixels8_y2_c)
lui	$2,%hi(put_pixels8_xy2_c)
addiu	$3,$3,%lo(put_pixels8_y2_c)
addiu	$2,$2,%lo(put_pixels8_xy2_c)
sw	$3,480($18)
sw	$2,484($18)
lui	$16,%hi(pix_abs16_c)
lui	$17,%hi(pix_abs8_c)
lui	$2,%hi(put_no_rnd_pixels8_c)
lui	$3,%hi(put_no_rnd_pixels8_x2_c)
addiu	$16,$16,%lo(pix_abs16_c)
addiu	$17,$17,%lo(pix_abs8_c)
addiu	$2,$2,%lo(put_no_rnd_pixels8_c)
addiu	$3,$3,%lo(put_no_rnd_pixels8_x2_c)
lw	$28,16($sp)
sw	$16,2768($18)
sw	$17,2784($18)
sw	$2,600($18)
sw	$3,604($18)
lui	$2,%hi(put_no_rnd_pixels8_y2_c)
lui	$3,%hi(put_no_rnd_pixels8_xy2_c)
addiu	$2,$2,%lo(put_no_rnd_pixels8_y2_c)
addiu	$3,$3,%lo(put_no_rnd_pixels8_xy2_c)
sw	$2,608($18)
sw	$3,612($18)
lui	$2,%hi(put_pixels4_c)
lui	$3,%hi(put_pixels4_x2_c)
addiu	$2,$2,%lo(put_pixels4_c)
addiu	$3,$3,%lo(put_pixels4_x2_c)
sw	$2,488($18)
sw	$3,492($18)
lui	$2,%hi(put_pixels4_y2_c)
lui	$3,%hi(put_pixels4_xy2_c)
addiu	$2,$2,%lo(put_pixels4_y2_c)
addiu	$3,$3,%lo(put_pixels4_xy2_c)
sw	$2,496($18)
sw	$3,500($18)
lui	$2,%hi(put_pixels2_c)
lui	$3,%hi(put_pixels2_x2_c)
addiu	$2,$2,%lo(put_pixels2_c)
addiu	$3,$3,%lo(put_pixels2_x2_c)
sw	$2,504($18)
sw	$3,508($18)
lui	$2,%hi(put_pixels2_y2_c)
lui	$3,%hi(put_pixels2_xy2_c)
addiu	$2,$2,%lo(put_pixels2_y2_c)
addiu	$3,$3,%lo(put_pixels2_xy2_c)
sw	$2,512($18)
sw	$3,516($18)
lui	$2,%hi(avg_pixels16_c)
lui	$3,%hi(avg_pixels16_x2_c)
addiu	$2,$2,%lo(avg_pixels16_c)
addiu	$3,$3,%lo(avg_pixels16_x2_c)
sw	$2,520($18)
sw	$3,524($18)
lui	$2,%hi(avg_pixels16_y2_c)
lui	$3,%hi(avg_pixels16_xy2_c)
addiu	$2,$2,%lo(avg_pixels16_y2_c)
addiu	$3,$3,%lo(avg_pixels16_xy2_c)
sw	$2,528($18)
sw	$3,532($18)
lui	$2,%hi(avg_no_rnd_pixels16_c)
lui	$3,%hi(avg_no_rnd_pixels16_x2_c)
addiu	$2,$2,%lo(avg_no_rnd_pixels16_c)
addiu	$3,$3,%lo(avg_no_rnd_pixels16_x2_c)
sw	$2,648($18)
sw	$3,652($18)
lui	$2,%hi(avg_no_rnd_pixels16_y2_c)
lui	$3,%hi(avg_no_rnd_pixels16_xy2_c)
addiu	$2,$2,%lo(avg_no_rnd_pixels16_y2_c)
addiu	$3,$3,%lo(avg_no_rnd_pixels16_xy2_c)
sw	$2,656($18)
sw	$3,660($18)
lui	$2,%hi(avg_pixels8_c)
lui	$3,%hi(avg_pixels8_x2_c)
addiu	$2,$2,%lo(avg_pixels8_c)
addiu	$3,$3,%lo(avg_pixels8_x2_c)
sw	$2,536($18)
sw	$3,540($18)
lui	$2,%hi(avg_pixels8_y2_c)
lui	$3,%hi(avg_pixels8_xy2_c)
addiu	$2,$2,%lo(avg_pixels8_y2_c)
addiu	$3,$3,%lo(avg_pixels8_xy2_c)
sw	$2,544($18)
sw	$3,548($18)
lui	$2,%hi(avg_no_rnd_pixels8_c)
lui	$3,%hi(avg_no_rnd_pixels8_x2_c)
addiu	$2,$2,%lo(avg_no_rnd_pixels8_c)
addiu	$3,$3,%lo(avg_no_rnd_pixels8_x2_c)
sw	$2,664($18)
sw	$3,668($18)
lui	$2,%hi(avg_no_rnd_pixels8_y2_c)
lui	$3,%hi(avg_no_rnd_pixels8_xy2_c)
addiu	$2,$2,%lo(avg_no_rnd_pixels8_y2_c)
addiu	$3,$3,%lo(avg_no_rnd_pixels8_xy2_c)
sw	$2,672($18)
sw	$3,676($18)
lui	$2,%hi(avg_pixels4_c)
lui	$3,%hi(avg_pixels4_x2_c)
addiu	$2,$2,%lo(avg_pixels4_c)
addiu	$3,$3,%lo(avg_pixels4_x2_c)
sw	$2,552($18)
sw	$3,556($18)
lui	$2,%hi(avg_pixels4_y2_c)
lui	$3,%hi(avg_pixels4_xy2_c)
addiu	$2,$2,%lo(avg_pixels4_y2_c)
addiu	$3,$3,%lo(avg_pixels4_xy2_c)
sw	$2,560($18)
sw	$3,564($18)
lui	$2,%hi(avg_pixels2_c)
lui	$3,%hi(avg_pixels2_x2_c)
addiu	$2,$2,%lo(avg_pixels2_c)
addiu	$3,$3,%lo(avg_pixels2_x2_c)
sw	$2,568($18)
sw	$3,572($18)
lui	$2,%hi(avg_pixels2_y2_c)
lui	$3,%hi(avg_pixels2_xy2_c)
addiu	$2,$2,%lo(avg_pixels2_y2_c)
addiu	$3,$3,%lo(avg_pixels2_xy2_c)
sw	$2,576($18)
sw	$3,580($18)
lui	$2,%hi(put_no_rnd_pixels16_l2_c)
lui	$3,%hi(put_no_rnd_pixels8_l2_c)
addiu	$2,$2,%lo(put_no_rnd_pixels16_l2_c)
addiu	$3,$3,%lo(put_no_rnd_pixels8_l2_c)
sw	$2,712($18)
sw	$3,716($18)
lui	$2,%hi(put_tpel_pixels_mc00_c)
lui	$3,%hi(put_tpel_pixels_mc10_c)
addiu	$2,$2,%lo(put_tpel_pixels_mc00_c)
addiu	$3,$3,%lo(put_tpel_pixels_mc10_c)
sw	$2,720($18)
sw	$3,724($18)
lui	$2,%hi(put_tpel_pixels_mc20_c)
lui	$3,%hi(put_tpel_pixels_mc01_c)
addiu	$2,$2,%lo(put_tpel_pixels_mc20_c)
addiu	$3,$3,%lo(put_tpel_pixels_mc01_c)
sw	$2,728($18)
sw	$3,736($18)
lui	$2,%hi(put_tpel_pixels_mc11_c)
lui	$3,%hi(put_tpel_pixels_mc21_c)
addiu	$2,$2,%lo(put_tpel_pixels_mc11_c)
addiu	$3,$3,%lo(put_tpel_pixels_mc21_c)
sw	$2,740($18)
sw	$3,744($18)
lui	$2,%hi(put_tpel_pixels_mc02_c)
lui	$3,%hi(put_tpel_pixels_mc12_c)
addiu	$2,$2,%lo(put_tpel_pixels_mc02_c)
addiu	$3,$3,%lo(put_tpel_pixels_mc12_c)
sw	$2,752($18)
sw	$3,756($18)
lui	$2,%hi(put_tpel_pixels_mc22_c)
lui	$3,%hi(avg_tpel_pixels_mc00_c)
addiu	$2,$2,%lo(put_tpel_pixels_mc22_c)
addiu	$3,$3,%lo(avg_tpel_pixels_mc00_c)
sw	$2,760($18)
sw	$3,764($18)
lui	$2,%hi(avg_tpel_pixels_mc10_c)
lui	$3,%hi(avg_tpel_pixels_mc20_c)
addiu	$2,$2,%lo(avg_tpel_pixels_mc10_c)
addiu	$3,$3,%lo(avg_tpel_pixels_mc20_c)
sw	$2,768($18)
sw	$3,772($18)
lui	$2,%hi(avg_tpel_pixels_mc01_c)
lui	$3,%hi(avg_tpel_pixels_mc11_c)
addiu	$2,$2,%lo(avg_tpel_pixels_mc01_c)
addiu	$3,$3,%lo(avg_tpel_pixels_mc11_c)
sw	$2,780($18)
sw	$3,784($18)
lui	$2,%hi(avg_tpel_pixels_mc21_c)
lui	$3,%hi(avg_tpel_pixels_mc02_c)
addiu	$2,$2,%lo(avg_tpel_pixels_mc21_c)
addiu	$3,$3,%lo(avg_tpel_pixels_mc02_c)
sw	$2,788($18)
sw	$3,796($18)
lui	$2,%hi(avg_tpel_pixels_mc12_c)
lui	$3,%hi(avg_tpel_pixels_mc22_c)
lw	$25,%call16(ff_cavsdsp_init)($28)
addiu	$2,$2,%lo(avg_tpel_pixels_mc12_c)
addiu	$3,$3,%lo(avg_tpel_pixels_mc22_c)
sw	$2,800($18)
sw	$3,804($18)
move	$4,$18
jalr	$25
move	$5,$19

lw	$28,16($sp)
move	$4,$18
lw	$25,%call16(ff_vc1dsp_init)($28)
jalr	$25
move	$5,$19

lui	$2,%hi(put_mspel8_mc00_c)
addiu	$2,$2,%lo(put_mspel8_mc00_c)
sw	$2,1320($18)
lui	$2,%hi(put_mspel8_mc20_c)
addiu	$2,$2,%lo(put_mspel8_mc20_c)
sw	$2,1328($18)
lui	$3,%hi(put_mspel8_mc10_c)
lui	$2,%hi(put_mspel8_mc02_c)
addiu	$3,$3,%lo(put_mspel8_mc10_c)
addiu	$2,$2,%lo(put_mspel8_mc02_c)
sw	$3,1324($18)
sw	$2,1336($18)
lui	$3,%hi(put_mspel8_mc30_c)
lui	$2,%hi(put_mspel8_mc22_c)
addiu	$3,$3,%lo(put_mspel8_mc30_c)
addiu	$2,$2,%lo(put_mspel8_mc22_c)
sw	$3,1332($18)
sw	$2,1344($18)
lui	$3,%hi(put_mspel8_mc12_c)
lui	$2,%hi(hadamard8_diff16_c)
addiu	$3,$3,%lo(put_mspel8_mc12_c)
addiu	$2,$2,%lo(hadamard8_diff16_c)
sw	$3,1340($18)
sw	$2,92($18)
lui	$3,%hi(put_mspel8_mc32_c)
lui	$2,%hi(hadamard8_intra16_c)
addiu	$3,$3,%lo(put_mspel8_mc32_c)
addiu	$2,$2,%lo(hadamard8_intra16_c)
sw	$3,1348($18)
sw	$2,108($18)
lui	$3,%hi(hadamard8_diff8x8_c)
lui	$2,%hi(dct_sad8x8_c)
addiu	$3,$3,%lo(hadamard8_diff8x8_c)
addiu	$2,$2,%lo(dct_sad8x8_c)
sw	$3,96($18)
sw	$2,116($18)
lui	$3,%hi(dct_sad16_c)
lui	$2,%hi(dct_max8x8_c)
addiu	$3,$3,%lo(dct_sad16_c)
addiu	$2,$2,%lo(dct_max8x8_c)
sw	$3,112($18)
sw	$2,296($18)
lui	$3,%hi(dct_max16_c)
lui	$2,%hi(dct264_sad8x8_c)
addiu	$3,$3,%lo(dct_max16_c)
addiu	$2,$2,%lo(dct264_sad8x8_c)
sw	$3,292($18)
sw	$2,316($18)
lui	$3,%hi(dct264_sad16_c)
lui	$2,%hi(sse8_c)
addiu	$3,$3,%lo(dct264_sad16_c)
addiu	$2,$2,%lo(sse8_c)
sw	$3,312($18)
sw	$2,76($18)
lui	$3,%hi(sse16_c)
lui	$2,%hi(quant_psnr16_c)
addiu	$3,$3,%lo(sse16_c)
addiu	$2,$2,%lo(quant_psnr16_c)
sw	$3,72($18)
sw	$2,132($18)
lui	$3,%hi(sse4_c)
lui	$2,%hi(rd16_c)
addiu	$3,$3,%lo(sse4_c)
addiu	$2,$2,%lo(rd16_c)
sw	$3,80($18)
sw	$2,172($18)
lui	$3,%hi(quant_psnr8x8_c)
lui	$2,%hi(bit16_c)
addiu	$3,$3,%lo(quant_psnr8x8_c)
addiu	$2,$2,%lo(bit16_c)
sw	$3,136($18)
sw	$2,152($18)
lui	$3,%hi(rd8x8_c)
lui	$2,%hi(vsad16_c)
addiu	$3,$3,%lo(rd8x8_c)
addiu	$2,$2,%lo(vsad16_c)
sw	$3,176($18)
sw	$2,192($18)
lui	$3,%hi(bit8x8_c)
lui	$2,%hi(vsse16_c)
addiu	$3,$3,%lo(bit8x8_c)
addiu	$2,$2,%lo(vsse16_c)
sw	$3,156($18)
sw	$2,212($18)
lui	$3,%hi(vsad_intra16_c)
lui	$2,%hi(nsse16_c)
addiu	$3,$3,%lo(vsad_intra16_c)
addiu	$2,$2,%lo(nsse16_c)
sw	$3,208($18)
sw	$2,232($18)
lui	$3,%hi(vsse_intra16_c)
lui	$2,%hi(nsse8_c)
addiu	$3,$3,%lo(vsse_intra16_c)
addiu	$2,$2,%lo(nsse8_c)
lw	$28,16($sp)
sw	$3,228($18)
sw	$16,52($18)
lui	$3,%hi(w53_16_c)
sw	$17,56($18)
sw	$2,236($18)
lui	$2,%hi(w53_8_c)
addiu	$3,$3,%lo(w53_16_c)
addiu	$2,$2,%lo(w53_8_c)
sw	$3,252($18)
sw	$2,256($18)
lui	$3,%hi(w97_16_c)
lui	$2,%hi(w97_8_c)
addiu	$3,$3,%lo(w97_16_c)
addiu	$2,$2,%lo(w97_8_c)
sw	$3,272($18)
sw	$2,276($18)
lui	$3,%hi(ssd_int8_vs_int16_c)
lui	$2,%hi(add_bytes_c)
addiu	$3,$3,%lo(ssd_int8_vs_int16_c)
addiu	$2,$2,%lo(add_bytes_c)
sw	$3,452($18)
sw	$2,2800($18)
lui	$3,%hi(diff_bytes_c)
lui	$2,%hi(sub_hfyu_median_prediction_c)
addiu	$3,$3,%lo(diff_bytes_c)
addiu	$2,$2,%lo(sub_hfyu_median_prediction_c)
sw	$3,2804($18)
sw	$2,2808($18)
lui	$3,%hi(bswap_buf)
lui	$2,%hi(h263_h_loop_filter_c)
addiu	$3,$3,%lo(bswap_buf)
addiu	$2,$2,%lo(h263_h_loop_filter_c)
sw	$3,2812($18)
sw	$2,2848($18)
lui	$3,%hi(h263_v_loop_filter_c)
lui	$2,%hi(h261_loop_filter_c)
addiu	$3,$3,%lo(h263_v_loop_filter_c)
addiu	$2,$2,%lo(h261_loop_filter_c)
sw	$3,2844($18)
sw	$2,2852($18)
lui	$3,%hi(try_8x8basis_c)
lui	$2,%hi(add_8x8basis_c)
addiu	$3,$3,%lo(try_8x8basis_c)
addiu	$2,$2,%lo(add_8x8basis_c)
sw	$3,2968($18)
sw	$2,2972($18)
lw	$3,%got(ff_snow_vertical_compose97i)($28)
lw	$2,%got(ff_snow_horizontal_compose97i)($28)
sw	$3,2996($18)
sw	$2,3000($18)
lw	$3,%got(ff_snow_inner_add_yblock)($28)
lw	$2,%got(vorbis_inverse_coupling)($28)
sw	$3,3004($18)
sw	$2,2856($18)
lw	$3,%got(ff_flac_compute_autocorr)($28)
lui	$2,%hi(vector_fmul_c)
addiu	$2,$2,%lo(vector_fmul_c)
sw	$3,2860($18)
sw	$2,2864($18)
lui	$3,%hi(vector_fmul_reverse_c)
lui	$2,%hi(ff_vector_fmul_add_add_c)
addiu	$3,$3,%lo(vector_fmul_reverse_c)
addiu	$2,$2,%lo(ff_vector_fmul_add_add_c)
sw	$3,2868($18)
sw	$2,2872($18)
lui	$3,%hi(ff_float_to_int16_c)
lw	$2,%got(ff_img_copy_plane)($28)
addiu	$3,$3,%lo(ff_float_to_int16_c)
sw	$3,2876($18)
sw	$2,3012($18)
lw	$3,%got(ff_shrink22)($28)
lw	$2,%got(ff_shrink44)($28)
sw	$3,3016($18)
sw	$2,3020($18)
lw	$3,%got(ff_shrink88)($28)
lui	$2,%hi(just_return)
lw	$25,%call16(memset)($28)
addiu	$2,$2,%lo(just_return)
sw	$3,3024($18)
addiu	$4,$18,1900
move	$5,$0
li	$6,256			# 0x100
jalr	$25
sw	$2,3008($18)

lw	$28,16($sp)
addiu	$4,$18,2156
lw	$25,%call16(memset)($28)
move	$5,$0
jalr	$25
li	$6,256			# 0x100

lw	$28,16($sp)
move	$3,$18
move	$4,$0
b	$L1084
li	$5,64			# 0x40

$L1082:
lw	$2,2156($3)
beq	$2,$0,$L1113
nop

$L1083:
addiu	$4,$4,1
beq	$4,$5,$L1114
addiu	$3,$3,4

$L1084:
lw	$2,1900($3)
bne	$2,$0,$L1082
nop

lw	$2,1388($3)
sw	$2,1900($3)
lw	$2,2156($3)
bne	$2,$0,$L1083
nop

$L1113:
lw	$2,1644($3)
addiu	$4,$4,1
sw	$2,2156($3)
bne	$4,$5,$L1084
addiu	$3,$3,4

$L1114:
lw	$3,2964($18)
sltu	$2,$3,6
bne	$2,$0,$L1115
sll	$2,$3,2

$L1085:
lui	$6,%hi($LC0)
lw	$25,%call16(av_log)($28)
move	$4,$19
lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
addiu	$6,$6,%lo($LC0)
move	$5,$0
jr	$25
addiu	$sp,$sp,48

$L1105:
lw	$2,%got(fdct_ifast)($28)
lw	$3,%got(fdct_ifast248)($28)
sw	$2,2880($4)
b	$L1072
sw	$3,2884($4)

$L1115:
lui	$3,%hi($L1091)
addiu	$3,$3,%lo($L1091)
addu	$3,$3,$2
lw	$4,0($3)
addu	$4,$4,$28
j	$4
nop

.rdata
.align	2
.align	2
$L1091:
.gpword	$L1085
.gpword	$L1086
.gpword	$L1087
.gpword	$L1088
.gpword	$L1089
.gpword	$L1090
.text
$L1108:
lui	$2,%hi(ff_jref_idct2_put)
addiu	$2,$2,%lo(ff_jref_idct2_put)
sw	$2,2892($18)
lui	$3,%hi(ff_jref_idct2_add)
lw	$2,%got(j_rev_dct2)($28)
addiu	$3,$3,%lo(ff_jref_idct2_add)
sw	$3,2896($18)
sw	$2,2888($18)
b	$L1077
sw	$4,2964($18)

$L1090:
move	$5,$0
li	$6,64			# 0x40
$L1097:
andi	$2,$5,0x3
andi	$4,$5,0x24
sra	$3,$5,3
sll	$2,$2,3
or	$2,$2,$4
andi	$3,$3,0x3
addu	$4,$18,$5
or	$2,$2,$3
addiu	$5,$5,1
bne	$5,$6,$L1097
sb	$2,2900($4)

lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,48

$L1089:
move	$5,$0
li	$6,64			# 0x40
$L1096:
andi	$2,$5,0x7
sra	$3,$5,3
sll	$2,$2,3
addu	$4,$18,$5
or	$2,$2,$3
addiu	$5,$5,1
bne	$5,$6,$L1096
sb	$2,2900($4)

lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,48

$L1088:
lui	$2,%hi(simple_mmx_permutation)
addiu	$7,$2,%lo(simple_mmx_permutation)
move	$5,$0
li	$6,64			# 0x40
$L1095:
addu	$2,$7,$5
lbu	$4,0($2)
addu	$3,$18,$5
addiu	$5,$5,1
bne	$5,$6,$L1095
sb	$4,2900($3)

lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,48

$L1087:
move	$5,$0
li	$6,64			# 0x40
$L1094:
andi	$2,$5,0x6
andi	$4,$5,0x38
andi	$3,$5,0x1
sra	$2,$2,1
or	$2,$2,$4
sll	$3,$3,2
addu	$4,$18,$5
or	$2,$2,$3
addiu	$5,$5,1
bne	$5,$6,$L1094
sb	$2,2900($4)

lw	$31,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,48

$L1086:
move	$3,$0
li	$4,64			# 0x40
$L1092:
addu	$2,$18,$3
sb	$3,2900($2)
addiu	$3,$3,1
bne	$3,$4,$L1092
lw	$31,44($sp)

lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,48

$L1111:
lw	$2,%got(ff_vp3_idct_put_c)($28)
lw	$3,%got(ff_vp3_idct_add_c)($28)
sw	$2,2892($18)
lw	$2,%got(ff_vp3_idct_c)($28)
sw	$3,2896($18)
sw	$2,2888($18)
b	$L1077
sw	$4,2964($18)

$L1109:
addiu	$2,$2,%lo(ff_jref_idct1_put)
sw	$2,2892($18)
lui	$3,%hi(ff_jref_idct1_add)
lw	$2,%got(j_rev_dct1)($28)
addiu	$3,$3,%lo(ff_jref_idct1_add)
sw	$3,2896($18)
sw	$2,2888($18)
b	$L1077
sw	$4,2964($18)

$L1110:
lui	$2,%hi(ff_jref_idct_put)
addiu	$2,$2,%lo(ff_jref_idct_put)
sw	$2,2892($18)
lui	$3,%hi(ff_jref_idct_add)
lw	$2,%got(j_rev_dct)($28)
addiu	$3,$3,%lo(ff_jref_idct_add)
sw	$3,2896($18)
sw	$2,2888($18)
b	$L1077
sw	$5,2964($18)

$L1112:
lui	$2,%hi(ff_jref_idct4_put)
lui	$3,%hi(ff_jref_idct4_add)
addiu	$2,$2,%lo(ff_jref_idct4_put)
addiu	$3,$3,%lo(ff_jref_idct4_add)
sw	$2,2892($18)
b	$L1076
sw	$3,2896($18)

.set	macro
.set	reorder
.end	dsputil_init
.section	.rodata.str1.4
.align	2
$LC1:
.ascii	"internal error in cmp function selection\012\000"
.text
.align	2
.globl	ff_set_cmp
.ent	ff_set_cmp
.type	ff_set_cmp, @function
ff_set_cmp:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 9/0, args= 16, gp= 8
.mask	0x80ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-64
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,60($sp)
sw	$23,56($sp)
sw	$22,52($sp)
sw	$21,48($sp)
sw	$20,44($sp)
sw	$19,40($sp)
sw	$18,36($sp)
sw	$17,32($sp)
sw	$16,28($sp)
.cprestore	16
andi	$6,$6,0x00ff
lui	$2,%hi($L1134)
sll	$3,$6,2
addiu	$2,$2,%lo($L1134)
addu	$21,$2,$3
lui	$2,%hi($LC1)
lui	$3,%hi(zero_cmp)
sw	$0,0($5)
sw	$0,4($5)
sw	$0,8($5)
sw	$0,12($5)
sw	$0,16($5)
move	$17,$4
move	$16,$5
addiu	$22,$2,%lo($LC1)
addiu	$23,$3,%lo(zero_cmp)
move	$18,$0
sltu	$19,$6,15
li	$20,5			# 0x5
$L1136:
bne	$19,$0,$L1139
lw	$25,%call16(av_log)($28)

move	$4,$0
move	$5,$0
move	$6,$22
jalr	$25
addiu	$18,$18,1

lw	$28,16($sp)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

lw	$31,60($sp)
$L1141:
lw	$23,56($sp)
lw	$22,52($sp)
lw	$21,48($sp)
lw	$20,44($sp)
lw	$19,40($sp)
lw	$18,36($sp)
lw	$17,32($sp)
lw	$16,28($sp)
j	$31
addiu	$sp,$sp,64

$L1139:
lw	$2,0($21)
addu	$2,$2,$28
j	$2
nop

.rdata
.align	2
.align	2
$L1134:
.gpword	$L1119
.gpword	$L1120
.gpword	$L1121
.gpword	$L1122
.gpword	$L1123
.gpword	$L1124
.gpword	$L1125
.gpword	$L1126
.gpword	$L1127
.gpword	$L1128
.gpword	$L1129
.gpword	$L1130
.gpword	$L1131
.gpword	$L1132
.gpword	$L1133
.text
$L1133:
lw	$2,312($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1132:
lw	$2,292($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1131:
lw	$2,272($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1130:
lw	$2,252($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1129:
lw	$2,232($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1128:
lw	$2,212($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1127:
lw	$2,192($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1126:
addiu	$18,$18,1
sw	$23,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1125:
lw	$2,172($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1124:
lw	$2,152($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1123:
lw	$2,132($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1122:
lw	$2,112($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1121:
lw	$2,92($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1120:
lw	$2,72($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

$L1119:
lw	$2,52($17)
addiu	$18,$18,1
sw	$2,0($16)
addiu	$17,$17,4
bne	$18,$20,$L1136
addiu	$16,$16,4

b	$L1141
lw	$31,60($sp)

.set	macro
.set	reorder
.end	ff_set_cmp
.align	2
.ent	w_c
.type	w_c, @function
w_c:
.set	nomips16
.frame	$sp,4152,$31		# vars= 4096, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-4152
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,4148($sp)
sw	$20,4144($sp)
sw	$19,4140($sp)
sw	$18,4136($sp)
sw	$17,4132($sp)
sw	$16,4128($sp)
.cprestore	24
lw	$16,4168($sp)
lw	$14,4172($sp)
li	$18,4			# 0x4
xori	$3,$16,0x8
li	$2,3			# 0x3
movz	$18,$2,$3
blez	$14,$L1166
lw	$19,4176($sp)

move	$12,$0
move	$13,$0
addiu	$17,$sp,32
$L1146:
blez	$16,$L1148
sll	$2,$12,7

addu	$10,$17,$2
addu	$9,$5,$13
addu	$8,$6,$13
move	$11,$0
$L1147:
lbu	$3,0($8)
lbu	$2,0($9)
addiu	$11,$11,4
subu	$2,$2,$3
sll	$2,$2,4
sw	$2,0($10)
lbu	$2,1($8)
lbu	$3,1($9)
slt	$4,$11,$16
subu	$3,$3,$2
sll	$3,$3,4
sw	$3,4($10)
lbu	$3,2($8)
lbu	$2,2($9)
subu	$2,$2,$3
sll	$2,$2,4
sw	$2,8($10)
lbu	$3,3($9)
lbu	$2,3($8)
addiu	$9,$9,4
subu	$3,$3,$2
sll	$3,$3,4
sw	$3,12($10)
addiu	$8,$8,4
bne	$4,$0,$L1147
addiu	$10,$10,16

$L1148:
addiu	$12,$12,1
slt	$2,$12,$14
bne	$2,$0,$L1146
addu	$13,$13,$7

$L1145:
lw	$25,%call16(ff_spatial_dwt)($28)
sw	$19,16($sp)
sw	$18,20($sp)
move	$6,$14
move	$4,$17
move	$5,$16
jalr	$25
li	$7,32			# 0x20

sll	$2,$19,1
addu	$2,$2,$18
addiu	$2,$2,-3
lui	$3,%hi(scale.7515)
lw	$28,24($sp)
addiu	$19,$3,%lo(scale.7515)
sll	$20,$2,2
move	$8,$0
move	$24,$0
li	$31,32			# 0x20
addu	$2,$20,$24
$L1167:
sll	$2,$2,2
sltu	$14,$0,$24
subu	$3,$18,$24
addu	$2,$2,$14
sll	$13,$31,$3
sll	$2,$2,2
addu	$15,$19,$2
sra	$9,$16,$3
sra	$25,$13,1
$L1157:
andi	$2,$14,0x1
move	$4,$0
andi	$3,$14,0x2
movn	$4,$9,$2
move	$2,$0
blez	$9,$L1153
movn	$2,$25,$3

lw	$10,0($15)
addu	$12,$2,$4
move	$11,$0
$L1154:
sll	$2,$12,2
addu	$7,$17,$2
move	$6,$0
$L1156:
lw	$2,0($7)
addiu	$6,$6,1
mul	$2,$10,$2
slt	$5,$6,$9
subu	$4,$0,$2
slt	$3,$2,0
movn	$2,$4,$3
addu	$8,$8,$2
bne	$5,$0,$L1156
addiu	$7,$7,4

addiu	$11,$11,1
slt	$2,$11,$9
bne	$2,$0,$L1154
addu	$12,$12,$13

$L1153:
addiu	$14,$14,1
slt	$2,$14,4
bne	$2,$0,$L1157
addiu	$15,$15,4

addiu	$24,$24,1
slt	$2,$24,$18
bne	$2,$0,$L1167
addu	$2,$20,$24

lw	$31,4148($sp)
sra	$2,$8,9
lw	$20,4144($sp)
lw	$19,4140($sp)
lw	$18,4136($sp)
lw	$17,4132($sp)
lw	$16,4128($sp)
j	$31
addiu	$sp,$sp,4152

$L1166:
b	$L1145
addiu	$17,$sp,32

.set	macro
.set	reorder
.end	w_c
.align	2
.ent	w97_8_c
.type	w97_8_c, @function
w97_8_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 1/0, args= 32, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
.cprestore	32
lw	$3,64($sp)
li	$2,8			# 0x8
sw	$2,16($sp)
sw	$3,20($sp)
.option	pic0
jal	w_c
.option	pic2
sw	$0,24($sp)

lw	$31,44($sp)
lw	$28,32($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	w97_8_c
.align	2
.ent	w97_16_c
.type	w97_16_c, @function
w97_16_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 1/0, args= 32, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
.cprestore	32
lw	$3,64($sp)
li	$2,16			# 0x10
sw	$2,16($sp)
sw	$3,20($sp)
.option	pic0
jal	w_c
.option	pic2
sw	$0,24($sp)

lw	$31,44($sp)
lw	$28,32($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	w97_16_c
.align	2
.ent	w53_8_c
.type	w53_8_c, @function
w53_8_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 1/0, args= 32, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
.cprestore	32
lw	$3,64($sp)
li	$2,8			# 0x8
sw	$2,16($sp)
li	$2,1			# 0x1
sw	$3,20($sp)
.option	pic0
jal	w_c
.option	pic2
sw	$2,24($sp)

lw	$31,44($sp)
lw	$28,32($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	w53_8_c
.align	2
.ent	w53_16_c
.type	w53_16_c, @function
w53_16_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 1/0, args= 32, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
.cprestore	32
lw	$3,64($sp)
li	$2,16			# 0x10
sw	$2,16($sp)
li	$2,1			# 0x1
sw	$3,20($sp)
.option	pic0
jal	w_c
.option	pic2
sw	$2,24($sp)

lw	$31,44($sp)
lw	$28,32($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	w53_16_c
.align	2
.globl	w97_32_c
.ent	w97_32_c
.type	w97_32_c, @function
w97_32_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 1/0, args= 32, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
.cprestore	32
lw	$3,64($sp)
li	$2,32			# 0x20
sw	$2,16($sp)
sw	$3,20($sp)
.option	pic0
jal	w_c
.option	pic2
sw	$0,24($sp)

lw	$31,44($sp)
lw	$28,32($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	w97_32_c
.align	2
.globl	w53_32_c
.ent	w53_32_c
.type	w53_32_c, @function
w53_32_c:
.set	nomips16
.frame	$sp,48,$31		# vars= 0, regs= 1/0, args= 32, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-48
sw	$31,44($sp)
.cprestore	32
lw	$3,64($sp)
li	$2,32			# 0x20
sw	$2,16($sp)
li	$2,1			# 0x1
sw	$3,20($sp)
.option	pic0
jal	w_c
.option	pic2
sw	$2,24($sp)

lw	$31,44($sp)
lw	$28,32($sp)
j	$31
addiu	$sp,$sp,48

.set	macro
.set	reorder
.end	w53_32_c
.align	2
.ent	rd8x8_c
.type	rd8x8_c, @function
rd8x8_c:
.set	nomips16
.frame	$fp,208,$31		# vars= 136, regs= 9/0, args= 24, gp= 8
.mask	0xc07f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-208
sw	$fp,200($sp)
move	$fp,$sp
sw	$31,204($sp)
sw	$22,196($sp)
sw	$21,192($sp)
sw	$20,188($sp)
sw	$19,184($sp)
sw	$18,180($sp)
sw	$17,176($sp)
sw	$16,172($sp)
.cprestore	24
sll	$2,$7,3
addiu	$2,$2,8
subu	$sp,$sp,$2
lw	$21,6780($4)
move	$19,$7
move	$18,$4
move	$22,$5
move	$10,$6
sw	$0,32($fp)
addiu	$16,$sp,24
addiu	$20,$fp,40
move	$9,$0
$L1181:
lw	$2,32($fp)
mul	$4,$9,$19
mul	$2,$19,$2
lw	$3,32($fp)
addiu	$2,$2,4
addu	$5,$10,$4
addu	$6,$10,$2
lw	$7,0($5)
lw	$8,0($6)
addiu	$9,$3,1
addu	$4,$16,$4
addu	$2,$16,$2
slt	$3,$9,8
sw	$7,0($4)
sw	$8,0($2)
bne	$3,$0,$L1181
sw	$9,32($fp)

lw	$25,2144($18)
move	$6,$10
move	$4,$20
move	$5,$22
jalr	$25
move	$7,$19

lw	$7,2056($18)
lw	$25,8692($18)
addiu	$2,$fp,32
sw	$2,16($sp)
move	$4,$18
move	$5,$20
jalr	$25
move	$6,$0

lw	$12,6180($18)
move	$9,$2
beq	$12,$0,$L1182
sw	$2,6856($18)

lh	$3,0($20)
lw	$2,6800($18)
lw	$11,6784($18)
addu	$2,$2,$3
lbu	$17,256($2)
lw	$13,6788($18)
li	$5,1			# 0x1
$L1183:
slt	$2,$9,$5
bne	$2,$0,$L1184
slt	$2,$5,$9

beq	$2,$0,$L1198
sw	$5,32($fp)

addu	$2,$18,$5
addiu	$7,$2,6908
move	$8,$0
b	$L1190
li	$10,-128			# 0xffffffffffffff80

$L1199:
sll	$2,$8,7
addu	$2,$2,$4
bne	$6,$0,$L1188
addu	$2,$11,$2

lbu	$2,0($2)
move	$8,$0
addu	$17,$17,$2
$L1189:
addiu	$5,$5,1
slt	$2,$5,$9
sw	$5,32($fp)
beq	$2,$0,$L1186
addiu	$7,$7,1

$L1190:
lbu	$2,0($7)
sll	$2,$2,1
addu	$2,$20,$2
lh	$3,0($2)
addiu	$4,$3,64
bne	$3,$0,$L1199
and	$6,$4,$10

addiu	$5,$5,1
slt	$2,$5,$9
addiu	$8,$8,1
sw	$5,32($fp)
bne	$2,$0,$L1190
addiu	$7,$7,1

$L1186:
addu	$3,$18,$9
lbu	$4,6908($3)
sll	$2,$4,1
addu	$2,$20,$2
lh	$3,0($2)
li	$2,-128			# 0xffffffffffffff80
addiu	$3,$3,64
and	$2,$3,$2
bne	$2,$0,$L1191
sw	$4,32($fp)

sll	$2,$8,7
addu	$2,$2,$3
addu	$2,$13,$2
lbu	$3,0($2)
addu	$17,$17,$3
$L1184:
bltz	$9,$L1192
nop

bne	$12,$0,$L1200
nop

lw	$25,8684($18)
$L1197:
lw	$7,2056($18)
move	$4,$18
move	$5,$20
jalr	$25
move	$6,$0

$L1192:
lw	$25,5036($18)
move	$6,$20
move	$4,$16
jalr	$25
move	$5,$19

lw	$25,2216($18)
li	$2,8			# 0x8
move	$5,$16
move	$6,$22
sw	$2,16($sp)
move	$7,$19
jalr	$25
move	$4,$0

lw	$4,2056($18)
move	$sp,$fp
mul	$4,$4,$4
lw	$31,204($sp)
sll	$6,$4,2
sll	$3,$4,4
subu	$3,$3,$6
sll	$5,$3,3
addu	$3,$3,$5
addu	$3,$3,$4
mul	$3,$3,$17
lw	$28,24($fp)
addiu	$3,$3,64
sra	$3,$3,7
addu	$2,$2,$3
lw	$fp,200($sp)
lw	$22,196($sp)
lw	$21,192($sp)
lw	$20,188($sp)
lw	$19,184($sp)
lw	$18,180($sp)
lw	$17,176($sp)
lw	$16,172($sp)
j	$31
addiu	$sp,$sp,208

$L1182:
lw	$11,6792($18)
lw	$13,6796($18)
move	$17,$0
b	$L1183
move	$5,$0

$L1200:
b	$L1197
lw	$25,8680($18)

$L1188:
addu	$17,$17,$21
b	$L1189
move	$8,$0

$L1191:
b	$L1184
addu	$17,$17,$21

$L1198:
b	$L1186
move	$8,$0

.set	macro
.set	reorder
.end	rd8x8_c
.align	2
.ent	rd16_c
.type	rd16_c, @function
rd16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	rd8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	rd8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L1204
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L1204:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	rd8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	rd8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	rd16_c
.align	2
.ent	quant_psnr8x8_c
.type	quant_psnr8x8_c, @function
quant_psnr8x8_c:
.set	nomips16
.frame	$sp,312,$31		# vars= 264, regs= 4/0, args= 24, gp= 8
.mask	0x80070000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lui	$28,%hi(__gnu_local_gp)
addiu	$sp,$sp,-312
addiu	$28,$28,%lo(__gnu_local_gp)
sw	$31,308($sp)
sw	$18,304($sp)
sw	$17,300($sp)
sw	$16,296($sp)
.cprestore	24
addiu	$18,$sp,40
lw	$25,2144($4)
sw	$0,6180($4)
move	$17,$4
addiu	$16,$sp,168
jalr	$25
move	$4,$18

move	$6,$18
move	$7,$16
$L1206:
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
bne	$6,$16,$L1206
addiu	$7,$7,16

lw	$7,2056($17)
lw	$25,8692($17)
addiu	$2,$sp,32
move	$4,$17
move	$5,$18
move	$6,$0
jalr	$25
sw	$2,16($sp)

lw	$7,2056($17)
lw	$25,8684($17)
move	$4,$17
sw	$2,6856($17)
move	$5,$18
jalr	$25
move	$6,$0

lw	$28,24($sp)
lw	$25,%call16(simple_idct)($28)
jalr	$25
move	$4,$18

lw	$28,24($sp)
move	$4,$18
mtlo	$0
$L1207:
lh	$2,0($4)
lh	$3,128($4)
addiu	$4,$4,2
subu	$2,$2,$3
bne	$16,$4,$L1207
madd	$2,$2

lw	$31,308($sp)
mflo	$2
lw	$18,304($sp)
lw	$17,300($sp)
lw	$16,296($sp)
j	$31
addiu	$sp,$sp,312

.set	macro
.set	reorder
.end	quant_psnr8x8_c
.align	2
.ent	quant_psnr16_c
.type	quant_psnr16_c, @function
quant_psnr16_c:
.set	nomips16
.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
.mask	0x807f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-64
sw	$31,60($sp)
sw	$22,56($sp)
sw	$21,52($sp)
sw	$20,48($sp)
sw	$19,44($sp)
sw	$18,40($sp)
sw	$17,36($sp)
sw	$16,32($sp)
.cprestore	24
move	$21,$4
move	$22,$5
move	$17,$6
move	$20,$7
li	$19,8			# 0x8
.option	pic0
jal	quant_psnr8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$22,8
addiu	$6,$17,8
move	$7,$20
move	$16,$2
.option	pic0
jal	quant_psnr8x8_c
.option	pic2
sw	$19,16($sp)

addu	$18,$2,$16
lw	$2,80($sp)
li	$3,16			# 0x10
beq	$2,$3,$L1214
lw	$28,24($sp)

lw	$31,60($sp)
move	$2,$18
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

$L1214:
sll	$16,$20,3
addu	$17,$17,$16
addu	$16,$22,$16
move	$4,$21
move	$5,$16
move	$6,$17
move	$7,$20
.option	pic0
jal	quant_psnr8x8_c
.option	pic2
sw	$19,16($sp)

move	$4,$21
addiu	$5,$16,8
addiu	$6,$17,8
move	$7,$20
sw	$19,16($sp)
.option	pic0
jal	quant_psnr8x8_c
.option	pic2
move	$16,$2

addu	$16,$16,$2
lw	$31,60($sp)
addu	$18,$18,$16
move	$2,$18
lw	$28,24($sp)
lw	$22,56($sp)
lw	$21,52($sp)
lw	$20,48($sp)
lw	$19,44($sp)
lw	$18,40($sp)
lw	$17,36($sp)
lw	$16,32($sp)
j	$31
addiu	$sp,$sp,64

.set	macro
.set	reorder
.end	quant_psnr16_c
.align	2
.ent	put_qpel16_mc02_c
.type	put_qpel16_mc02_c, @function
put_qpel16_mc02_c:
.set	nomips16
.frame	$sp,440,$31		# vars= 408, regs= 1/0, args= 16, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-440
sw	$31,436($sp)
.cprestore	16
addiu	$9,$sp,24
move	$7,$9
addiu	$8,$sp,432
$L1216:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($7)
swr	$2,0($7)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($7)
swr	$3,4($7)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($7)
swr	$2,8($7)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($7)
swr	$3,12($7)
lbu	$2,16($5)
sb	$2,16($7)
addiu	$7,$7,24
bne	$7,$8,$L1216
addu	$5,$5,$6

move	$5,$9
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

lw	$31,436($sp)
lw	$28,16($sp)
j	$31
addiu	$sp,$sp,440

.set	macro
.set	reorder
.end	put_qpel16_mc02_c
.align	2
.ent	put_no_rnd_qpel16_mc02_c
.type	put_no_rnd_qpel16_mc02_c, @function
put_no_rnd_qpel16_mc02_c:
.set	nomips16
.frame	$sp,440,$31		# vars= 408, regs= 1/0, args= 16, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-440
sw	$31,436($sp)
.cprestore	16
addiu	$9,$sp,24
move	$7,$9
addiu	$8,$sp,432
$L1220:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($7)
swr	$2,0($7)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($7)
swr	$3,4($7)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($7)
swr	$2,8($7)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($7)
swr	$3,12($7)
lbu	$2,16($5)
sb	$2,16($7)
addiu	$7,$7,24
bne	$7,$8,$L1220
addu	$5,$5,$6

move	$5,$9
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

lw	$31,436($sp)
lw	$28,16($sp)
j	$31
addiu	$sp,$sp,440

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc02_c
.align	2
.ent	avg_qpel16_mc02_c
.type	avg_qpel16_mc02_c, @function
avg_qpel16_mc02_c:
.set	nomips16
.frame	$sp,440,$31		# vars= 408, regs= 1/0, args= 16, gp= 8
.mask	0x80000000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-440
sw	$31,436($sp)
.cprestore	16
addiu	$9,$sp,24
move	$7,$9
addiu	$8,$sp,432
$L1224:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($7)
swr	$2,0($7)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($7)
swr	$3,4($7)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($7)
swr	$2,8($7)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($7)
swr	$3,12($7)
lbu	$2,16($5)
sb	$2,16($7)
addiu	$7,$7,24
bne	$7,$8,$L1224
addu	$5,$5,$6

move	$5,$9
.option	pic0
jal	avg_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

lw	$31,436($sp)
lw	$28,16($sp)
j	$31
addiu	$sp,$sp,440

.set	macro
.set	reorder
.end	avg_qpel16_mc02_c
.align	2
.ent	avg_no_rnd_pixels8_x2_c
.type	avg_no_rnd_pixels8_x2_c, @function
avg_no_rnd_pixels8_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1232
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L1229:
lwl	$3,3($8)
lwl	$4,4($8)
lwr	$3,0($8)
lwr	$4,1($8)
lw	$5,0($9)
xor	$2,$4,$3
and	$2,$2,$11
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($9)
lwl	$3,7($8)
lwl	$4,8($8)
lwr	$3,4($8)
lwr	$4,5($8)
lw	$5,4($9)
xor	$2,$4,$3
and	$2,$2,$11
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$11
srl	$3,$3,1
addiu	$10,$10,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$10,$7
sw	$2,4($9)
addu	$8,$8,$6
bne	$4,$0,$L1229
addu	$9,$9,$6

$L1232:
j	$31
nop

.set	macro
.set	reorder
.end	avg_no_rnd_pixels8_x2_c
.align	2
.ent	avg_no_rnd_pixels8_y2_c
.type	avg_no_rnd_pixels8_y2_c, @function
avg_no_rnd_pixels8_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1238
li	$2,-16908288			# 0xfffffffffefe0000

move	$9,$5
move	$10,$4
ori	$12,$2,0xfefe
addu	$8,$5,$6
move	$11,$0
$L1235:
lwl	$3,3($9)
lwl	$4,3($8)
lwr	$3,0($9)
lwr	$4,0($8)
lw	$5,0($10)
xor	$2,$4,$3
and	$2,$2,$12
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($10)
lwl	$3,7($9)
lwl	$4,7($8)
lwr	$3,4($9)
lwr	$4,4($8)
lw	$5,4($10)
xor	$2,$4,$3
and	$2,$2,$12
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$12
srl	$3,$3,1
addiu	$11,$11,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$11,$7
sw	$2,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$4,$0,$L1235
addu	$10,$10,$6

$L1238:
j	$31
nop

.set	macro
.set	reorder
.end	avg_no_rnd_pixels8_y2_c
.align	2
.ent	avg_no_rnd_pixels16_x2_c
.type	avg_no_rnd_pixels16_x2_c, @function
avg_no_rnd_pixels16_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1246
move	$13,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$10,$4
ori	$12,$2,0xfefe
move	$8,$5
move	$9,$4
move	$11,$0
$L1241:
lwl	$3,3($8)
lwl	$4,4($8)
lwr	$3,0($8)
lwr	$4,1($8)
lw	$5,0($9)
xor	$2,$4,$3
and	$2,$2,$12
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($9)
lwl	$3,7($8)
lwl	$4,8($8)
lwr	$3,4($8)
lwr	$4,5($8)
lw	$5,4($9)
xor	$2,$4,$3
and	$2,$2,$12
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$12
srl	$3,$3,1
addiu	$11,$11,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$11,$7
sw	$2,4($9)
addu	$8,$8,$6
bne	$4,$0,$L1241
addu	$9,$9,$6

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$8,$13,8
ori	$11,$2,0xfefe
move	$9,$0
$L1242:
lwl	$3,3($8)
lwl	$4,4($8)
lwr	$3,0($8)
lwr	$4,1($8)
lw	$5,8($10)
xor	$2,$4,$3
and	$2,$2,$11
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,8($10)
lwl	$3,7($8)
lwl	$4,8($8)
lwr	$3,4($8)
lwr	$4,5($8)
lw	$5,12($10)
xor	$2,$4,$3
and	$2,$2,$11
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$11
srl	$3,$3,1
addiu	$9,$9,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$9,$7
sw	$2,12($10)
addu	$8,$8,$6
bne	$4,$0,$L1242
addu	$10,$10,$6

$L1246:
j	$31
nop

.set	macro
.set	reorder
.end	avg_no_rnd_pixels16_x2_c
.align	2
.ent	avg_no_rnd_pixels16_y2_c
.type	avg_no_rnd_pixels16_y2_c, @function
avg_no_rnd_pixels16_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1254
move	$14,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$11,$4
ori	$13,$2,0xfefe
move	$9,$5
addu	$8,$5,$6
move	$10,$4
move	$12,$0
$L1249:
lwl	$3,3($9)
lwl	$4,3($8)
lwr	$3,0($9)
lwr	$4,0($8)
lw	$5,0($10)
xor	$2,$4,$3
and	$2,$2,$13
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$13
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($10)
lwl	$3,7($9)
lwl	$4,7($8)
lwr	$3,4($9)
lwr	$4,4($8)
lw	$5,4($10)
xor	$2,$4,$3
and	$2,$2,$13
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$13
srl	$3,$3,1
addiu	$12,$12,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$12,$7
sw	$2,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$4,$0,$L1249
addu	$10,$10,$6

addiu	$9,$14,8
li	$2,-16908288			# 0xfffffffffefe0000
ori	$12,$2,0xfefe
addu	$8,$9,$6
move	$10,$0
$L1250:
lwl	$3,3($9)
lwl	$4,3($8)
lwr	$3,0($9)
lwr	$4,0($8)
lw	$5,8($11)
xor	$2,$4,$3
and	$2,$2,$12
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,8($11)
lwl	$3,7($9)
lwl	$4,7($8)
lwr	$3,4($9)
lwr	$4,4($8)
lw	$5,12($11)
xor	$2,$4,$3
and	$2,$2,$12
and	$4,$4,$3
srl	$2,$2,1
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$12
srl	$3,$3,1
addiu	$10,$10,1
or	$2,$2,$5
subu	$2,$2,$3
slt	$4,$10,$7
sw	$2,12($11)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$4,$0,$L1250
addu	$11,$11,$6

$L1254:
j	$31
nop

.set	macro
.set	reorder
.end	avg_no_rnd_pixels16_y2_c
.align	2
.ent	put_pixels16_xy2_c
.type	put_pixels16_xy2_c, @function
put_pixels16_xy2_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 9/0, args= 0, gp= 0
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
nor	$3,$0,$7
mul	$3,$3,$6
sw	$4,40($sp)
addiu	$2,$7,-1
mul	$4,$7,$6
srl	$2,$2,1
addiu	$2,$2,1
sll	$14,$6,1
sw	$22,28($sp)
mul	$22,$2,$14
li	$2,4			# 0x4
sw	$fp,36($sp)
sw	$23,32($sp)
subu	$fp,$2,$4
addiu	$23,$3,4
li	$2,50528256			# 0x3030000
li	$3,33685504			# 0x2020000
sw	$20,20($sp)
sw	$18,12($sp)
ori	$24,$2,0x303
ori	$20,$3,0x202
li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,252641280			# 0xf0f0000
lw	$18,40($sp)
sw	$21,24($sp)
sw	$19,16($sp)
sw	$17,8($sp)
sw	$16,4($sp)
ori	$17,$3,0xf0f
move	$25,$7
move	$21,$6
sw	$5,44($sp)
ori	$15,$2,0xfcfc
move	$3,$5
move	$19,$0
$L1259:
lwl	$4,3($3)
lwl	$2,4($3)
lwr	$4,0($3)
lwr	$2,1($3)
blez	$25,$L1256
addu	$16,$3,$21

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$20
addu	$9,$16,$21
addu	$13,$18,$21
move	$8,$16
move	$12,$18
move	$11,$0
$L1257:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$3,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$3,$3,2
addu	$2,$5,$6
and	$3,$3,$17
addu	$2,$2,$3
sw	$2,0($12)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$20
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
addu	$6,$5,$6
and	$7,$7,$17
addiu	$11,$11,2
addu	$6,$6,$7
slt	$2,$11,$25
sw	$6,0($13)
addu	$8,$8,$14
addu	$12,$12,$14
addu	$9,$9,$14
bne	$2,$0,$L1257
addu	$13,$13,$14

addu	$18,$18,$22
addu	$16,$16,$22
$L1256:
addiu	$19,$19,1
li	$2,2			# 0x2
beq	$19,$2,$L1258
addu	$3,$16,$23

b	$L1259
addu	$18,$18,$fp

$L1258:
addiu	$2,$25,-1
srl	$2,$2,1
addiu	$2,$2,1
sll	$14,$21,1
mul	$22,$2,$14
lw	$2,40($sp)
li	$3,33685504			# 0x2020000
addiu	$18,$2,8
lw	$4,44($sp)
li	$2,50528256			# 0x3030000
ori	$24,$2,0x303
ori	$20,$3,0x202
li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,252641280			# 0xf0f0000
addiu	$5,$4,8
ori	$15,$2,0xfcfc
ori	$17,$3,0xf0f
move	$19,$0
$L1263:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$25,$L1260
addu	$16,$5,$21

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$20
addu	$9,$16,$21
addu	$13,$18,$21
move	$8,$16
move	$12,$18
move	$11,$0
$L1261:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$3,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$3,$3,2
addu	$2,$5,$6
and	$3,$3,$17
addu	$2,$2,$3
sw	$2,0($12)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$20
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
addu	$6,$5,$6
and	$7,$7,$17
addiu	$11,$11,2
addu	$6,$6,$7
slt	$2,$11,$25
sw	$6,0($13)
addu	$8,$8,$14
addu	$12,$12,$14
addu	$9,$9,$14
bne	$2,$0,$L1261
addu	$13,$13,$14

addu	$18,$18,$22
addu	$16,$16,$22
$L1260:
addiu	$19,$19,1
li	$2,2			# 0x2
beq	$19,$2,$L1264
addu	$5,$16,$23

b	$L1263
addu	$18,$18,$fp

$L1264:
lw	$fp,36($sp)
lw	$23,32($sp)
lw	$22,28($sp)
lw	$21,24($sp)
lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_pixels16_xy2_c
.align	2
.ent	put_no_rnd_pixels16_xy2_c
.type	put_no_rnd_pixels16_xy2_c, @function
put_no_rnd_pixels16_xy2_c:
.set	nomips16
.frame	$sp,40,$31		# vars= 0, regs= 9/0, args= 0, gp= 0
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-40
nor	$3,$0,$7
mul	$3,$3,$6
sw	$4,40($sp)
addiu	$2,$7,-1
mul	$4,$7,$6
srl	$2,$2,1
addiu	$2,$2,1
sll	$14,$6,1
sw	$22,28($sp)
mul	$22,$2,$14
li	$2,4			# 0x4
sw	$fp,36($sp)
sw	$23,32($sp)
subu	$fp,$2,$4
addiu	$23,$3,4
li	$2,50528256			# 0x3030000
li	$3,16842752			# 0x1010000
sw	$20,20($sp)
sw	$18,12($sp)
ori	$24,$2,0x303
ori	$20,$3,0x101
li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,252641280			# 0xf0f0000
lw	$18,40($sp)
sw	$21,24($sp)
sw	$19,16($sp)
sw	$17,8($sp)
sw	$16,4($sp)
ori	$17,$3,0xf0f
move	$25,$7
move	$21,$6
sw	$5,44($sp)
ori	$15,$2,0xfcfc
move	$3,$5
move	$19,$0
$L1271:
lwl	$4,3($3)
lwl	$2,4($3)
lwr	$4,0($3)
lwr	$2,1($3)
blez	$25,$L1268
addu	$16,$3,$21

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$20
addu	$9,$16,$21
addu	$13,$18,$21
move	$8,$16
move	$12,$18
move	$11,$0
$L1269:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$3,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$3,$3,2
addu	$2,$5,$6
and	$3,$3,$17
addu	$2,$2,$3
sw	$2,0($12)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$20
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
addu	$6,$5,$6
and	$7,$7,$17
addiu	$11,$11,2
addu	$6,$6,$7
slt	$2,$11,$25
sw	$6,0($13)
addu	$8,$8,$14
addu	$12,$12,$14
addu	$9,$9,$14
bne	$2,$0,$L1269
addu	$13,$13,$14

addu	$18,$18,$22
addu	$16,$16,$22
$L1268:
addiu	$19,$19,1
li	$2,2			# 0x2
beq	$19,$2,$L1270
addu	$3,$16,$23

b	$L1271
addu	$18,$18,$fp

$L1270:
addiu	$2,$25,-1
srl	$2,$2,1
addiu	$2,$2,1
sll	$14,$21,1
mul	$22,$2,$14
lw	$2,40($sp)
li	$3,16842752			# 0x1010000
addiu	$18,$2,8
lw	$4,44($sp)
li	$2,50528256			# 0x3030000
ori	$24,$2,0x303
ori	$20,$3,0x101
li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,252641280			# 0xf0f0000
addiu	$5,$4,8
ori	$15,$2,0xfcfc
ori	$17,$3,0xf0f
move	$19,$0
$L1275:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$25,$L1272
addu	$16,$5,$21

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$20
addu	$9,$16,$21
addu	$13,$18,$21
move	$8,$16
move	$12,$18
move	$11,$0
$L1273:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$3,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$3,$3,2
addu	$2,$5,$6
and	$3,$3,$17
addu	$2,$2,$3
sw	$2,0($12)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$20
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
addu	$6,$5,$6
and	$7,$7,$17
addiu	$11,$11,2
addu	$6,$6,$7
slt	$2,$11,$25
sw	$6,0($13)
addu	$8,$8,$14
addu	$12,$12,$14
addu	$9,$9,$14
bne	$2,$0,$L1273
addu	$13,$13,$14

addu	$18,$18,$22
addu	$16,$16,$22
$L1272:
addiu	$19,$19,1
li	$2,2			# 0x2
beq	$19,$2,$L1276
addu	$5,$16,$23

b	$L1275
addu	$18,$18,$fp

$L1276:
lw	$fp,36($sp)
lw	$23,32($sp)
lw	$22,28($sp)
lw	$21,24($sp)
lw	$20,20($sp)
lw	$19,16($sp)
lw	$18,12($sp)
lw	$17,8($sp)
lw	$16,4($sp)
j	$31
addiu	$sp,$sp,40

.set	macro
.set	reorder
.end	put_no_rnd_pixels16_xy2_c
.align	2
.ent	avg_pixels16_xy2_c
.type	avg_pixels16_xy2_c, @function
avg_pixels16_xy2_c:
.set	nomips16
.frame	$sp,56,$31		# vars= 8, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-56
sw	$fp,52($sp)
sw	$23,48($sp)
sw	$22,44($sp)
sw	$21,40($sp)
sw	$20,36($sp)
sw	$19,32($sp)
sw	$18,28($sp)
sw	$17,24($sp)
sw	$16,20($sp)
.cprestore	0
addiu	$2,$7,-1
srl	$2,$2,1
addiu	$2,$2,1
nor	$3,$0,$7
sll	$14,$6,1
mul	$3,$3,$6
mul	$23,$2,$14
li	$2,4			# 0x4
mtlo	$2
msub	$7,$6
li	$2,50528256			# 0x3030000
sw	$4,56($sp)
addiu	$fp,$3,4
mflo	$4
li	$3,33685504			# 0x2020000
ori	$24,$2,0x303
li	$2,-50593792			# 0xfffffffffcfc0000
ori	$21,$3,0x202
ori	$15,$2,0xfcfc
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$18,56($sp)
ori	$19,$3,0xf0f
move	$25,$7
move	$22,$6
sw	$5,60($sp)
sw	$4,8($sp)
ori	$17,$2,0xfefe
move	$3,$5
move	$20,$0
$L1283:
lwl	$4,3($3)
lwl	$2,4($3)
lwr	$4,0($3)
lwr	$2,1($3)
blez	$25,$L1280
addu	$16,$3,$22

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$21
addu	$9,$16,$22
addu	$12,$18,$22
move	$8,$16
move	$11,$18
move	$13,$0
$L1281:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$4,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$4,$4,2
addu	$2,$5,$6
and	$4,$4,$19
lw	$5,0($11)
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$17
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($11)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$21
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
lw	$3,0($12)
addu	$6,$5,$6
and	$7,$7,$19
addu	$6,$6,$7
xor	$2,$6,$3
and	$2,$2,$17
or	$6,$6,$3
srl	$2,$2,1
addiu	$13,$13,2
subu	$6,$6,$2
slt	$3,$13,$25
sw	$6,0($12)
addu	$8,$8,$14
addu	$11,$11,$14
addu	$9,$9,$14
bne	$3,$0,$L1281
addu	$12,$12,$14

addu	$18,$18,$23
addu	$16,$16,$23
$L1280:
addiu	$20,$20,1
li	$2,2			# 0x2
beq	$20,$2,$L1282
lw	$2,8($sp)

addu	$3,$16,$fp
b	$L1283
addu	$18,$18,$2

$L1282:
addiu	$2,$25,-1
srl	$2,$2,1
addiu	$2,$2,1
sll	$14,$22,1
mul	$23,$2,$14
lw	$2,56($sp)
li	$3,33685504			# 0x2020000
addiu	$19,$2,8
li	$2,50528256			# 0x3030000
lw	$4,60($sp)
ori	$24,$2,0x303
li	$2,-50593792			# 0xfffffffffcfc0000
ori	$21,$3,0x202
ori	$15,$2,0xfcfc
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
addiu	$5,$4,8
ori	$18,$3,0xf0f
ori	$17,$2,0xfefe
move	$20,$0
$L1287:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$25,$L1284
addu	$16,$5,$22

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$21
addu	$9,$16,$22
addu	$12,$19,$22
move	$8,$16
move	$11,$19
move	$13,$0
$L1285:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$4,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$4,$4,2
addu	$2,$5,$6
and	$4,$4,$18
lw	$5,0($11)
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$17
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($11)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$21
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
lw	$3,0($12)
addu	$6,$5,$6
and	$7,$7,$18
addu	$6,$6,$7
xor	$2,$6,$3
and	$2,$2,$17
or	$6,$6,$3
srl	$2,$2,1
addiu	$13,$13,2
subu	$6,$6,$2
slt	$3,$13,$25
sw	$6,0($12)
addu	$8,$8,$14
addu	$11,$11,$14
addu	$9,$9,$14
bne	$3,$0,$L1285
addu	$12,$12,$14

addu	$19,$19,$23
addu	$16,$16,$23
$L1284:
addiu	$20,$20,1
li	$2,2			# 0x2
beq	$20,$2,$L1288
lw	$2,8($sp)

addu	$5,$16,$fp
b	$L1287
addu	$19,$19,$2

$L1288:
lw	$fp,52($sp)
lw	$23,48($sp)
lw	$22,44($sp)
lw	$21,40($sp)
lw	$20,36($sp)
lw	$19,32($sp)
lw	$18,28($sp)
lw	$17,24($sp)
lw	$16,20($sp)
j	$31
addiu	$sp,$sp,56

.set	macro
.set	reorder
.end	avg_pixels16_xy2_c
.align	2
.ent	avg_no_rnd_pixels16_xy2_c
.type	avg_no_rnd_pixels16_xy2_c, @function
avg_no_rnd_pixels16_xy2_c:
.set	nomips16
.frame	$sp,56,$31		# vars= 8, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-56
sw	$fp,52($sp)
sw	$23,48($sp)
sw	$22,44($sp)
sw	$21,40($sp)
sw	$20,36($sp)
sw	$19,32($sp)
sw	$18,28($sp)
sw	$17,24($sp)
sw	$16,20($sp)
.cprestore	0
addiu	$2,$7,-1
srl	$2,$2,1
addiu	$2,$2,1
nor	$3,$0,$7
sll	$14,$6,1
mul	$3,$3,$6
mul	$23,$2,$14
li	$2,4			# 0x4
mtlo	$2
msub	$7,$6
li	$2,50528256			# 0x3030000
sw	$4,56($sp)
addiu	$fp,$3,4
mflo	$4
li	$3,16842752			# 0x1010000
ori	$24,$2,0x303
li	$2,-50593792			# 0xfffffffffcfc0000
ori	$21,$3,0x101
ori	$15,$2,0xfcfc
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$18,56($sp)
ori	$19,$3,0xf0f
move	$25,$7
move	$22,$6
sw	$5,60($sp)
sw	$4,8($sp)
ori	$17,$2,0xfefe
move	$3,$5
move	$20,$0
$L1295:
lwl	$4,3($3)
lwl	$2,4($3)
lwr	$4,0($3)
lwr	$2,1($3)
blez	$25,$L1292
addu	$16,$3,$22

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$21
addu	$9,$16,$22
addu	$12,$18,$22
move	$8,$16
move	$11,$18
move	$13,$0
$L1293:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$4,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$4,$4,2
addu	$2,$5,$6
and	$4,$4,$19
lw	$5,0($11)
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$17
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($11)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$21
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
lw	$3,0($12)
addu	$6,$5,$6
and	$7,$7,$19
addu	$6,$6,$7
xor	$2,$6,$3
and	$2,$2,$17
or	$6,$6,$3
srl	$2,$2,1
addiu	$13,$13,2
subu	$6,$6,$2
slt	$3,$13,$25
sw	$6,0($12)
addu	$8,$8,$14
addu	$11,$11,$14
addu	$9,$9,$14
bne	$3,$0,$L1293
addu	$12,$12,$14

addu	$18,$18,$23
addu	$16,$16,$23
$L1292:
addiu	$20,$20,1
li	$2,2			# 0x2
beq	$20,$2,$L1294
lw	$2,8($sp)

addu	$3,$16,$fp
b	$L1295
addu	$18,$18,$2

$L1294:
addiu	$2,$25,-1
srl	$2,$2,1
addiu	$2,$2,1
sll	$14,$22,1
mul	$23,$2,$14
lw	$2,56($sp)
li	$3,16842752			# 0x1010000
addiu	$19,$2,8
li	$2,50528256			# 0x3030000
lw	$4,60($sp)
ori	$24,$2,0x303
li	$2,-50593792			# 0xfffffffffcfc0000
ori	$21,$3,0x101
ori	$15,$2,0xfcfc
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
addiu	$5,$4,8
ori	$18,$3,0xf0f
ori	$17,$2,0xfefe
move	$20,$0
$L1299:
lwl	$4,3($5)
lwl	$2,4($5)
lwr	$4,0($5)
lwr	$2,1($5)
blez	$25,$L1296
addu	$16,$5,$22

and	$5,$2,$15
and	$3,$4,$15
and	$2,$2,$24
and	$4,$4,$24
addu	$4,$4,$2
srl	$5,$5,2
srl	$3,$3,2
addu	$5,$5,$3
addu	$10,$4,$21
addu	$9,$16,$22
addu	$12,$19,$22
move	$8,$16
move	$11,$19
move	$13,$0
$L1297:
lwl	$2,3($8)
lwl	$6,4($8)
lwr	$2,0($8)
lwr	$6,1($8)
and	$3,$2,$24
and	$7,$6,$24
addu	$7,$7,$3
and	$6,$6,$15
and	$2,$2,$15
addu	$4,$10,$7
srl	$2,$2,2
srl	$6,$6,2
addu	$6,$6,$2
srl	$4,$4,2
addu	$2,$5,$6
and	$4,$4,$18
lw	$5,0($11)
addu	$2,$2,$4
xor	$3,$2,$5
and	$3,$3,$17
srl	$3,$3,1
or	$2,$2,$5
subu	$2,$2,$3
sw	$2,0($11)
lwl	$4,3($9)
lwl	$3,4($9)
lwr	$4,0($9)
lwr	$3,1($9)
and	$2,$4,$24
and	$5,$3,$24
addu	$2,$2,$5
addu	$10,$2,$21
and	$3,$3,$15
and	$4,$4,$15
srl	$3,$3,2
srl	$4,$4,2
addu	$7,$10,$7
addu	$5,$3,$4
srl	$7,$7,2
lw	$3,0($12)
addu	$6,$5,$6
and	$7,$7,$18
addu	$6,$6,$7
xor	$2,$6,$3
and	$2,$2,$17
or	$6,$6,$3
srl	$2,$2,1
addiu	$13,$13,2
subu	$6,$6,$2
slt	$3,$13,$25
sw	$6,0($12)
addu	$8,$8,$14
addu	$11,$11,$14
addu	$9,$9,$14
bne	$3,$0,$L1297
addu	$12,$12,$14

addu	$19,$19,$23
addu	$16,$16,$23
$L1296:
addiu	$20,$20,1
li	$2,2			# 0x2
beq	$20,$2,$L1300
lw	$2,8($sp)

addu	$5,$16,$fp
b	$L1299
addu	$19,$19,$2

$L1300:
lw	$fp,52($sp)
lw	$23,48($sp)
lw	$22,44($sp)
lw	$21,40($sp)
lw	$20,36($sp)
lw	$19,32($sp)
lw	$18,28($sp)
lw	$17,24($sp)
lw	$16,20($sp)
j	$31
addiu	$sp,$sp,56

.set	macro
.set	reorder
.end	avg_no_rnd_pixels16_xy2_c
.align	2
.ent	put_no_rnd_pixels8_x2_c
.type	put_no_rnd_pixels8_x2_c, @function
put_no_rnd_pixels8_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1308
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L1305:
lwl	$4,3($8)
lwl	$3,4($8)
lwr	$4,0($8)
lwr	$3,1($8)
addiu	$10,$10,1
xor	$2,$3,$4
and	$2,$2,$11
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($9)
lwl	$4,7($8)
lwl	$3,8($8)
lwr	$4,4($8)
lwr	$3,5($8)
slt	$5,$10,$7
xor	$2,$3,$4
and	$2,$2,$11
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($9)
addu	$8,$8,$6
bne	$5,$0,$L1305
addu	$9,$9,$6

$L1308:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels8_x2_c
.align	2
.ent	put_no_rnd_pixels8_y2_c
.type	put_no_rnd_pixels8_y2_c, @function
put_no_rnd_pixels8_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1314
li	$2,-16908288			# 0xfffffffffefe0000

move	$9,$5
move	$10,$4
ori	$12,$2,0xfefe
addu	$8,$5,$6
move	$11,$0
$L1311:
lwl	$4,3($9)
lwl	$3,3($8)
lwr	$4,0($9)
lwr	$3,0($8)
addiu	$11,$11,1
xor	$2,$3,$4
and	$2,$2,$12
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($10)
lwl	$4,7($9)
lwl	$3,7($8)
lwr	$4,4($9)
lwr	$3,4($8)
slt	$5,$11,$7
xor	$2,$3,$4
and	$2,$2,$12
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$5,$0,$L1311
addu	$10,$10,$6

$L1314:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels8_y2_c
.align	2
.ent	put_no_rnd_pixels8_l2_c
.type	put_no_rnd_pixels8_l2_c, @function
put_no_rnd_pixels8_l2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$12,16($sp)
blez	$12,$L1320
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L1317:
lwl	$4,3($8)
lwl	$3,3($6)
lwr	$4,0($8)
lwr	$3,0($6)
addiu	$10,$10,1
xor	$2,$3,$4
and	$2,$2,$11
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($9)
lwl	$4,7($8)
lwl	$3,7($6)
lwr	$4,4($8)
lwr	$3,4($6)
slt	$5,$10,$12
xor	$2,$3,$4
and	$2,$2,$11
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($9)
addu	$8,$8,$7
addu	$6,$6,$7
bne	$5,$0,$L1317
addu	$9,$9,$7

$L1320:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels8_l2_c
.align	2
.ent	put_no_rnd_qpel8_mc10_c
.type	put_no_rnd_qpel8_mc10_c, @function
put_no_rnd_qpel8_mc10_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$18,$4
move	$7,$19
move	$4,$17
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
move	$16,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$5,$2,0xfefe
addiu	$6,$sp,96
$L1322:
lwl	$4,3($16)
lwl	$3,3($17)
lwr	$4,0($16)
lwr	$3,0($17)
xor	$2,$3,$4
and	$2,$2,$5
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($16)
lwl	$3,7($17)
lwr	$4,4($16)
lwr	$3,4($17)
addiu	$17,$17,8
xor	$2,$3,$4
and	$2,$2,$5
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($18)
addu	$16,$16,$19
bne	$17,$6,$L1322
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc10_c
.align	2
.ent	put_no_rnd_qpel8_mc30_c
.type	put_no_rnd_qpel8_mc30_c, @function
put_no_rnd_qpel8_mc30_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$18,$4
move	$7,$19
move	$4,$17
move	$16,$5
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
addiu	$16,$16,1
ori	$5,$2,0xfefe
addiu	$6,$sp,96
$L1326:
lwl	$4,3($16)
lwl	$3,3($17)
lwr	$4,0($16)
lwr	$3,0($17)
xor	$2,$3,$4
and	$2,$2,$5
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($16)
lwl	$3,7($17)
lwr	$4,4($16)
lwr	$3,4($17)
addiu	$17,$17,8
xor	$2,$3,$4
and	$2,$2,$5
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($18)
addu	$16,$16,$19
bne	$17,$6,$L1326
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc30_c
.align	2
.ent	put_no_rnd_qpel8_mc01_c
.type	put_no_rnd_qpel8_mc01_c, @function
put_no_rnd_qpel8_mc01_c:
.set	nomips16
.frame	$sp,256,$31		# vars= 208, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-256
sw	$31,252($sp)
sw	$19,248($sp)
sw	$18,244($sp)
sw	$17,240($sp)
sw	$16,236($sp)
.cprestore	16
addiu	$18,$sp,88
move	$19,$4
move	$17,$6
move	$4,$18
addiu	$6,$sp,232
$L1330:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1330
addu	$5,$5,$17

addiu	$16,$sp,24
move	$5,$18
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$5,$18
move	$6,$19
ori	$7,$2,0xfefe
addiu	$8,$sp,216
$L1331:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$5,$8,$L1331
addu	$6,$6,$17

lw	$31,252($sp)
lw	$19,248($sp)
lw	$18,244($sp)
lw	$17,240($sp)
lw	$16,236($sp)
j	$31
addiu	$sp,$sp,256

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc01_c
.align	2
.ent	put_no_rnd_qpel8_mc03_c
.type	put_no_rnd_qpel8_mc03_c, @function
put_no_rnd_qpel8_mc03_c:
.set	nomips16
.frame	$sp,256,$31		# vars= 208, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-256
sw	$31,252($sp)
sw	$19,248($sp)
sw	$18,244($sp)
sw	$17,240($sp)
sw	$16,236($sp)
.cprestore	16
addiu	$7,$sp,88
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$17,$sp,232
$L1336:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$17,$L1336
addu	$5,$5,$18

addiu	$16,$sp,24
move	$5,$7
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,104
$L1337:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$5,$17,$L1337
addu	$6,$6,$18

lw	$31,252($sp)
lw	$19,248($sp)
lw	$18,244($sp)
lw	$17,240($sp)
lw	$16,236($sp)
j	$31
addiu	$sp,$sp,256

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc03_c
.align	2
.ent	put_no_rnd_qpel8_mc11_c
.type	put_no_rnd_qpel8_mc11_c, @function
put_no_rnd_qpel8_mc11_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$19,328($sp)
sw	$18,324($sp)
sw	$17,320($sp)
sw	$16,316($sp)
.cprestore	24
addiu	$16,$sp,168
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1342:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1342
addu	$5,$5,$18

addiu	$17,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
move	$6,$16
$L1343:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1343
addiu	$6,$6,16

addiu	$16,$sp,32
move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,100
$L1344:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,8
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1344
addu	$6,$6,$18

lw	$31,332($sp)
lw	$19,328($sp)
lw	$18,324($sp)
lw	$17,320($sp)
lw	$16,316($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc11_c
.align	2
.ent	put_no_rnd_qpel8_mc31_c
.type	put_no_rnd_qpel8_mc31_c, @function
put_no_rnd_qpel8_mc31_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$19,328($sp)
sw	$18,324($sp)
sw	$17,320($sp)
sw	$16,316($sp)
.cprestore	24
addiu	$16,$sp,168
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1350:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1350
addu	$5,$5,$18

addiu	$17,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
addiu	$6,$sp,169
$L1351:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1351
addiu	$6,$6,16

addiu	$16,$sp,32
move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,100
$L1352:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,8
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1352
addu	$6,$6,$18

lw	$31,332($sp)
lw	$19,328($sp)
lw	$18,324($sp)
lw	$17,320($sp)
lw	$16,316($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc31_c
.align	2
.ent	put_no_rnd_qpel8_mc13_c
.type	put_no_rnd_qpel8_mc13_c, @function
put_no_rnd_qpel8_mc13_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$20,328($sp)
sw	$19,324($sp)
sw	$18,320($sp)
sw	$17,316($sp)
sw	$16,312($sp)
.cprestore	24
addiu	$16,$sp,168
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1358:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1358
addu	$5,$5,$18

addiu	$19,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
move	$4,$19
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$19
move	$5,$16
$L1359:
lwl	$4,3($17)
lwl	$3,3($5)
lwr	$4,0($17)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$3,7($5)
lwr	$4,4($17)
lwr	$3,4($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,8
bne	$17,$16,$L1359
addiu	$5,$5,16

addiu	$16,$sp,32
move	$5,$19
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$20
ori	$7,$2,0xfefe
addiu	$5,$sp,104
$L1360:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,8
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$17,$5,$L1360
addu	$6,$6,$18

lw	$31,332($sp)
lw	$20,328($sp)
lw	$19,324($sp)
lw	$18,320($sp)
lw	$17,316($sp)
lw	$16,312($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc13_c
.align	2
.ent	put_no_rnd_qpel8_mc33_c
.type	put_no_rnd_qpel8_mc33_c, @function
put_no_rnd_qpel8_mc33_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$20,328($sp)
sw	$19,324($sp)
sw	$18,320($sp)
sw	$17,316($sp)
sw	$16,312($sp)
.cprestore	24
addiu	$16,$sp,168
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1366:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1366
addu	$5,$5,$18

addiu	$19,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
move	$4,$19
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$19
addiu	$5,$sp,169
$L1367:
lwl	$4,3($17)
lwl	$3,3($5)
lwr	$4,0($17)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$3,7($5)
lwr	$4,4($17)
lwr	$3,4($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,8
bne	$17,$16,$L1367
addiu	$5,$5,16

addiu	$16,$sp,32
move	$5,$19
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$20
ori	$7,$2,0xfefe
addiu	$5,$sp,104
$L1368:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,8
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$17,$5,$L1368
addu	$6,$6,$18

lw	$31,332($sp)
lw	$20,328($sp)
lw	$19,324($sp)
lw	$18,320($sp)
lw	$17,316($sp)
lw	$16,312($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc33_c
.align	2
.ent	put_no_rnd_qpel8_mc21_c
.type	put_no_rnd_qpel8_mc21_c, @function
put_no_rnd_qpel8_mc21_c:
.set	nomips16
.frame	$sp,192,$31		# vars= 136, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-192
sw	$31,188($sp)
sw	$19,184($sp)
sw	$18,180($sp)
sw	$17,176($sp)
sw	$16,172($sp)
.cprestore	24
move	$19,$6
addiu	$18,$sp,96
li	$2,9			# 0x9
li	$6,8			# 0x8
move	$7,$19
move	$17,$4
addiu	$16,$sp,32
move	$4,$18
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$18
li	$6,8			# 0x8
move	$4,$16
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$6,$2,0xfefe
addiu	$5,$sp,100
$L1374:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($17)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,8
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($17)
addiu	$5,$5,8
bne	$16,$18,$L1374
addu	$17,$17,$19

lw	$31,188($sp)
lw	$19,184($sp)
lw	$18,180($sp)
lw	$17,176($sp)
lw	$16,172($sp)
j	$31
addiu	$sp,$sp,192

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc21_c
.align	2
.ent	put_no_rnd_qpel8_mc23_c
.type	put_no_rnd_qpel8_mc23_c, @function
put_no_rnd_qpel8_mc23_c:
.set	nomips16
.frame	$sp,192,$31		# vars= 136, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-192
sw	$31,188($sp)
sw	$19,184($sp)
sw	$18,180($sp)
sw	$17,176($sp)
sw	$16,172($sp)
.cprestore	24
move	$19,$6
addiu	$16,$sp,96
li	$2,9			# 0x9
li	$6,8			# 0x8
move	$7,$19
move	$18,$4
addiu	$17,$sp,32
move	$4,$16
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$6,$2,0xfefe
addiu	$5,$sp,104
addiu	$7,$sp,168
$L1378:
lwl	$4,3($5)
lwl	$3,3($17)
lwr	$4,0($5)
lwr	$3,0($17)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($5)
lwl	$3,7($17)
lwr	$4,4($5)
lwr	$3,4($17)
addiu	$5,$5,8
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($18)
addiu	$17,$17,8
bne	$5,$7,$L1378
addu	$18,$18,$19

lw	$31,188($sp)
lw	$19,184($sp)
lw	$18,180($sp)
lw	$17,176($sp)
lw	$16,172($sp)
j	$31
addiu	$sp,$sp,192

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc23_c
.align	2
.globl	ff_put_no_rnd_qpel8_mc12_old_c
.ent	ff_put_no_rnd_qpel8_mc12_old_c
.type	ff_put_no_rnd_qpel8_mc12_old_c, @function
ff_put_no_rnd_qpel8_mc12_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$16,$sp,232
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,376
$L1382:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1382
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$16
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
addiu	$16,$sp,96

move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,36
$L1383:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,8
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1383
addu	$6,$6,$18

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel8_mc12_old_c
.align	2
.ent	put_no_rnd_qpel8_mc12_c
.type	put_no_rnd_qpel8_mc12_c, @function
put_no_rnd_qpel8_mc12_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$19,264($sp)
sw	$18,260($sp)
sw	$17,256($sp)
sw	$16,252($sp)
.cprestore	24
addiu	$16,$sp,104
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,248
$L1388:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1388
addu	$5,$5,$18

addiu	$17,$sp,32
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
move	$6,$16
$L1389:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1389
addiu	$6,$6,16

move	$4,$19
move	$5,$17
move	$6,$18
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,268($sp)
lw	$28,24($sp)
lw	$19,264($sp)
lw	$18,260($sp)
lw	$17,256($sp)
lw	$16,252($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc12_c
.align	2
.globl	ff_put_no_rnd_qpel8_mc32_old_c
.ent	ff_put_no_rnd_qpel8_mc32_old_c
.type	ff_put_no_rnd_qpel8_mc32_old_c, @function
ff_put_no_rnd_qpel8_mc32_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$7,$sp,232
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,376
$L1394:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1394
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
addiu	$5,$sp,233
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,36
$L1395:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,8
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1395
addu	$6,$6,$18

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel8_mc32_old_c
.align	2
.ent	put_no_rnd_qpel8_mc32_c
.type	put_no_rnd_qpel8_mc32_c, @function
put_no_rnd_qpel8_mc32_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$19,264($sp)
sw	$18,260($sp)
sw	$17,256($sp)
sw	$16,252($sp)
.cprestore	24
addiu	$16,$sp,104
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,248
$L1400:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1400
addu	$5,$5,$18

addiu	$17,$sp,32
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
addiu	$6,$sp,105
$L1401:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1401
addiu	$6,$6,16

move	$4,$19
move	$5,$17
move	$6,$18
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,268($sp)
lw	$28,24($sp)
lw	$19,264($sp)
lw	$18,260($sp)
lw	$17,256($sp)
lw	$16,252($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	put_no_rnd_qpel8_mc32_c
.align	2
.ent	put_no_rnd_pixels16_x2_c
.type	put_no_rnd_pixels16_x2_c, @function
put_no_rnd_pixels16_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1412
move	$13,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$11,$4
ori	$12,$2,0xfefe
move	$8,$5
move	$9,$4
move	$10,$0
$L1407:
lwl	$4,3($8)
lwl	$3,4($8)
lwr	$4,0($8)
lwr	$3,1($8)
addiu	$10,$10,1
xor	$2,$3,$4
and	$2,$2,$12
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($9)
lwl	$4,7($8)
lwl	$3,8($8)
lwr	$4,4($8)
lwr	$3,5($8)
slt	$5,$10,$7
xor	$2,$3,$4
and	$2,$2,$12
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($9)
addu	$8,$8,$6
bne	$5,$0,$L1407
addu	$9,$9,$6

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$8,$13,8
ori	$10,$2,0xfefe
move	$9,$0
$L1408:
lwl	$4,3($8)
lwl	$3,4($8)
lwr	$4,0($8)
lwr	$3,1($8)
addiu	$9,$9,1
xor	$2,$3,$4
and	$2,$2,$10
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($11)
lwl	$4,7($8)
lwl	$3,8($8)
lwr	$4,4($8)
lwr	$3,5($8)
slt	$5,$9,$7
xor	$2,$3,$4
and	$2,$2,$10
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($11)
addu	$8,$8,$6
bne	$5,$0,$L1408
addu	$11,$11,$6

$L1412:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels16_x2_c
.align	2
.globl	ff_avg_qpel16_mc12_old_c
.ent	ff_avg_qpel16_mc12_old_c
.type	ff_avg_qpel16_mc12_old_c, @function
ff_avg_qpel16_mc12_old_c:
.set	nomips16
.frame	$sp,1256,$31		# vars= 1192, regs= 6/0, args= 32, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1256
sw	$31,1252($sp)
sw	$20,1248($sp)
sw	$19,1244($sp)
sw	$18,1240($sp)
sw	$17,1236($sp)
sw	$16,1232($sp)
.cprestore	32
addiu	$17,$sp,824
move	$20,$4
move	$19,$6
move	$4,$17
addiu	$6,$sp,1232
$L1414:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1414
addu	$5,$5,$19

addiu	$16,$sp,552
li	$2,17			# 0x11
addiu	$18,$sp,40
move	$4,$16
move	$5,$17
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$17
move	$4,$18
addiu	$17,$sp,296
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$16
move	$4,$17
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$16,16			# 0x10
move	$5,$18
move	$6,$17
move	$4,$20
move	$7,$19
sw	$16,16($sp)
sw	$16,20($sp)
.option	pic0
jal	avg_pixels8_l2
.option	pic2
sw	$16,24($sp)

addiu	$4,$20,8
move	$7,$19
addiu	$5,$sp,48
addiu	$6,$sp,304
sw	$16,24($sp)
sw	$16,16($sp)
.option	pic0
jal	avg_pixels8_l2
.option	pic2
sw	$16,20($sp)

lw	$31,1252($sp)
lw	$28,32($sp)
lw	$20,1248($sp)
lw	$19,1244($sp)
lw	$18,1240($sp)
lw	$17,1236($sp)
lw	$16,1232($sp)
j	$31
addiu	$sp,$sp,1256

.set	macro
.set	reorder
.end	ff_avg_qpel16_mc12_old_c
.align	2
.ent	put_no_rnd_pixels16_y2_c
.type	put_no_rnd_pixels16_y2_c, @function
put_no_rnd_pixels16_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1424
move	$14,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$12,$4
ori	$13,$2,0xfefe
move	$9,$5
addu	$8,$5,$6
move	$10,$4
move	$11,$0
$L1419:
lwl	$4,3($9)
lwl	$3,3($8)
lwr	$4,0($9)
lwr	$3,0($8)
addiu	$11,$11,1
xor	$2,$3,$4
and	$2,$2,$13
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($10)
lwl	$4,7($9)
lwl	$3,7($8)
lwr	$4,4($9)
lwr	$3,4($8)
slt	$5,$11,$7
xor	$2,$3,$4
and	$2,$2,$13
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$5,$0,$L1419
addu	$10,$10,$6

addiu	$9,$14,8
li	$2,-16908288			# 0xfffffffffefe0000
ori	$11,$2,0xfefe
addu	$8,$9,$6
move	$10,$0
$L1420:
lwl	$4,3($9)
lwl	$3,3($8)
lwr	$4,0($9)
lwr	$3,0($8)
addiu	$10,$10,1
xor	$2,$3,$4
and	$2,$2,$11
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($12)
lwl	$4,7($9)
lwl	$3,7($8)
lwr	$4,4($9)
lwr	$3,4($8)
slt	$5,$10,$7
xor	$2,$3,$4
and	$2,$2,$11
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($12)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$5,$0,$L1420
addu	$12,$12,$6

$L1424:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels16_y2_c
.align	2
.globl	ff_avg_qpel8_mc12_old_c
.ent	ff_avg_qpel8_mc12_old_c
.type	ff_avg_qpel8_mc12_old_c, @function
ff_avg_qpel8_mc12_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$16,$sp,232
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,376
$L1426:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1426
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$16
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
addiu	$16,$sp,96

li	$6,8			# 0x8
li	$7,8			# 0x8
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$5,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$6,$sp,36
$L1427:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,8
sw	$4,4($7)
addiu	$6,$6,8
bne	$16,$17,$L1427
addu	$7,$7,$18

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_avg_qpel8_mc12_old_c
.align	2
.globl	ff_avg_qpel8_mc32_old_c
.ent	ff_avg_qpel8_mc32_old_c
.type	ff_avg_qpel8_mc32_old_c, @function
ff_avg_qpel8_mc32_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$7,$sp,232
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,376
$L1432:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1432
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
addiu	$5,$sp,233
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$6,8			# 0x8
li	$7,8			# 0x8
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$5,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$6,$sp,36
$L1433:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,8
sw	$4,4($7)
addiu	$6,$6,8
bne	$16,$17,$L1433
addu	$7,$7,$18

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_avg_qpel8_mc32_old_c
.align	2
.ent	avg_qpel8_mc21_c
.type	avg_qpel8_mc21_c, @function
avg_qpel8_mc21_c:
.set	nomips16
.frame	$sp,192,$31		# vars= 136, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-192
sw	$31,188($sp)
sw	$19,184($sp)
sw	$18,180($sp)
sw	$17,176($sp)
sw	$16,172($sp)
.cprestore	24
move	$19,$6
addiu	$18,$sp,96
li	$2,9			# 0x9
li	$6,8			# 0x8
move	$7,$19
move	$17,$4
addiu	$16,$sp,32
move	$4,$18
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$6,8			# 0x8
li	$7,8			# 0x8
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$5,$18

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$6,$sp,100
$L1438:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($17)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$7
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($17)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($17)
xor	$2,$4,$3
and	$2,$2,$7
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$7
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,8
sw	$4,4($17)
addiu	$6,$6,8
bne	$16,$18,$L1438
addu	$17,$17,$19

lw	$31,188($sp)
lw	$19,184($sp)
lw	$18,180($sp)
lw	$17,176($sp)
lw	$16,172($sp)
j	$31
addiu	$sp,$sp,192

.set	macro
.set	reorder
.end	avg_qpel8_mc21_c
.align	2
.ent	avg_qpel8_mc23_c
.type	avg_qpel8_mc23_c, @function
avg_qpel8_mc23_c:
.set	nomips16
.frame	$sp,192,$31		# vars= 136, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-192
sw	$31,188($sp)
sw	$19,184($sp)
sw	$18,180($sp)
sw	$17,176($sp)
sw	$16,172($sp)
.cprestore	24
move	$19,$6
addiu	$16,$sp,96
li	$2,9			# 0x9
li	$6,8			# 0x8
move	$7,$19
move	$18,$4
addiu	$17,$sp,32
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$6,8			# 0x8
li	$7,8			# 0x8
move	$5,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$6,$sp,104
addiu	$8,$sp,168
$L1442:
lwl	$4,3($6)
lwl	$2,3($17)
lwr	$4,0($6)
lwr	$2,0($17)
lw	$5,0($18)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$7
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($18)
lwl	$3,7($6)
lwl	$4,7($17)
lwr	$3,4($6)
lwr	$4,4($17)
lw	$5,4($18)
xor	$2,$4,$3
and	$2,$2,$7
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$7
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,8
sw	$4,4($18)
addiu	$17,$17,8
bne	$6,$8,$L1442
addu	$18,$18,$19

lw	$31,188($sp)
lw	$19,184($sp)
lw	$18,180($sp)
lw	$17,176($sp)
lw	$16,172($sp)
j	$31
addiu	$sp,$sp,192

.set	macro
.set	reorder
.end	avg_qpel8_mc23_c
.align	2
.ent	avg_pixels8_x2_c
.type	avg_pixels8_x2_c, @function
avg_pixels8_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1450
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L1447:
lwl	$4,3($8)
lwl	$2,4($8)
lwr	$4,0($8)
lwr	$2,1($8)
lw	$5,0($9)
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$11
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($9)
lwl	$4,7($8)
lwl	$3,8($8)
lwr	$4,4($8)
lwr	$3,5($8)
lw	$5,4($9)
xor	$2,$3,$4
and	$2,$2,$11
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$11
srl	$4,$4,1
addiu	$10,$10,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$10,$7
sw	$3,4($9)
addu	$8,$8,$6
bne	$2,$0,$L1447
addu	$9,$9,$6

$L1450:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels8_x2_c
.align	2
.ent	avg_pixels8_y2_c
.type	avg_pixels8_y2_c, @function
avg_pixels8_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1456
li	$2,-16908288			# 0xfffffffffefe0000

move	$9,$5
move	$10,$4
ori	$12,$2,0xfefe
addu	$8,$5,$6
move	$11,$0
$L1453:
lwl	$4,3($9)
lwl	$2,3($8)
lwr	$4,0($9)
lwr	$2,0($8)
lw	$5,0($10)
xor	$3,$2,$4
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$12
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($10)
lwl	$4,7($9)
lwl	$3,7($8)
lwr	$4,4($9)
lwr	$3,4($8)
lw	$5,4($10)
xor	$2,$3,$4
and	$2,$2,$12
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$12
srl	$4,$4,1
addiu	$11,$11,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$11,$7
sw	$3,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$2,$0,$L1453
addu	$10,$10,$6

$L1456:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels8_y2_c
.align	2
.ent	avg_qpel8_mc10_c
.type	avg_qpel8_mc10_c, @function
avg_qpel8_mc10_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$7,$19
move	$18,$4
move	$4,$17
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
move	$16,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$6,$2,0xfefe
addiu	$7,$sp,96
$L1458:
lwl	$4,3($16)
lwl	$2,3($17)
lwr	$4,0($16)
lwr	$2,0($17)
lw	$5,0($18)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$6
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($18)
lwl	$3,7($16)
lwl	$4,7($17)
lwr	$3,4($16)
lwr	$4,4($17)
lw	$5,4($18)
xor	$2,$4,$3
and	$2,$2,$6
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$6
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$17,$17,8
sw	$4,4($18)
addu	$16,$16,$19
bne	$17,$7,$L1458
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	avg_qpel8_mc10_c
.align	2
.ent	avg_qpel8_mc30_c
.type	avg_qpel8_mc30_c, @function
avg_qpel8_mc30_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$7,$19
move	$18,$4
move	$4,$17
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
move	$16,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
addiu	$16,$16,1
ori	$6,$2,0xfefe
addiu	$7,$sp,96
$L1462:
lwl	$4,3($16)
lwl	$2,3($17)
lwr	$4,0($16)
lwr	$2,0($17)
lw	$5,0($18)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$6
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($18)
lwl	$3,7($16)
lwl	$4,7($17)
lwr	$3,4($16)
lwr	$4,4($17)
lw	$5,4($18)
xor	$2,$4,$3
and	$2,$2,$6
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$6
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$17,$17,8
sw	$4,4($18)
addu	$16,$16,$19
bne	$17,$7,$L1462
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	avg_qpel8_mc30_c
.align	2
.ent	avg_qpel8_mc01_c
.type	avg_qpel8_mc01_c, @function
avg_qpel8_mc01_c:
.set	nomips16
.frame	$sp,256,$31		# vars= 208, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-256
sw	$31,252($sp)
sw	$19,248($sp)
sw	$18,244($sp)
sw	$17,240($sp)
sw	$16,236($sp)
.cprestore	16
addiu	$18,$sp,88
move	$19,$4
move	$17,$6
move	$4,$18
addiu	$6,$sp,232
$L1466:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1466
addu	$5,$5,$17

addiu	$16,$sp,24
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$5,$18

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$6,$18
move	$7,$19
ori	$8,$2,0xfefe
addiu	$9,$sp,216
$L1467:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,4($7)
addiu	$16,$16,8
bne	$6,$9,$L1467
addu	$7,$7,$17

lw	$31,252($sp)
lw	$19,248($sp)
lw	$18,244($sp)
lw	$17,240($sp)
lw	$16,236($sp)
j	$31
addiu	$sp,$sp,256

.set	macro
.set	reorder
.end	avg_qpel8_mc01_c
.align	2
.ent	avg_qpel8_mc03_c
.type	avg_qpel8_mc03_c, @function
avg_qpel8_mc03_c:
.set	nomips16
.frame	$sp,256,$31		# vars= 208, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-256
sw	$31,252($sp)
sw	$19,248($sp)
sw	$18,244($sp)
sw	$17,240($sp)
sw	$16,236($sp)
.cprestore	16
addiu	$7,$sp,88
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$17,$sp,232
$L1472:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$17,$L1472
addu	$5,$5,$18

addiu	$16,$sp,24
move	$5,$7
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$6,$sp,104
$L1473:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,4($7)
addiu	$16,$16,8
bne	$6,$17,$L1473
addu	$7,$7,$18

lw	$31,252($sp)
lw	$19,248($sp)
lw	$18,244($sp)
lw	$17,240($sp)
lw	$16,236($sp)
j	$31
addiu	$sp,$sp,256

.set	macro
.set	reorder
.end	avg_qpel8_mc03_c
.align	2
.globl	ff_avg_qpel16_mc32_old_c
.ent	ff_avg_qpel16_mc32_old_c
.type	ff_avg_qpel16_mc32_old_c, @function
ff_avg_qpel16_mc32_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$7,$sp,816
move	$19,$4
move	$17,$6
move	$4,$7
addiu	$6,$sp,1224
$L1478:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1478
addu	$5,$5,$17

addiu	$18,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$18
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
addiu	$5,$sp,817
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

li	$6,16			# 0x10
li	$7,16			# 0x10
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$5,$18

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$8,$19
ori	$9,$2,0xfefe
addiu	$6,$sp,36
move	$7,$19
$L1479:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,16
sw	$4,4($7)
addiu	$6,$6,16
bne	$16,$18,$L1479
addu	$7,$7,$17

addiu	$10,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$9,$2,0xfefe
addiu	$6,$sp,40
move	$7,$10
$L1480:
lwl	$4,3($6)
lwl	$2,3($7)
lwr	$4,0($6)
lwr	$2,0($7)
lw	$5,8($8)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($8)
lwl	$3,7($6)
lwl	$4,7($7)
lwr	$3,4($6)
lwr	$4,4($7)
lw	$5,12($8)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,12($8)
addiu	$7,$7,16
bne	$6,$10,$L1480
addu	$8,$8,$17

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_avg_qpel16_mc32_old_c
.align	2
.ent	put_qpel16_mc23_c
.type	put_qpel16_mc23_c, @function
put_qpel16_mc23_c:
.set	nomips16
.frame	$sp,584,$31		# vars= 528, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-584
sw	$31,580($sp)
sw	$19,576($sp)
sw	$18,572($sp)
sw	$17,568($sp)
sw	$16,564($sp)
.cprestore	24
move	$19,$6
addiu	$16,$sp,288
li	$2,17			# 0x11
move	$18,$4
li	$6,16			# 0x10
move	$4,$16
move	$7,$19
addiu	$17,$sp,32
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$5,$sp,304
move	$6,$18
addiu	$8,$sp,560
$L1486:
lwl	$4,3($5)
lwl	$2,3($17)
lwr	$4,0($5)
lwr	$2,0($17)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($17)
lwr	$4,4($5)
lwr	$2,4($17)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$17,$17,16
bne	$5,$8,$L1486
addu	$6,$6,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,40
addiu	$8,$sp,568
$L1487:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($18)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($18)
addiu	$6,$6,16
bne	$5,$8,$L1487
addu	$18,$18,$19

lw	$31,580($sp)
lw	$19,576($sp)
lw	$18,572($sp)
lw	$17,568($sp)
lw	$16,564($sp)
j	$31
addiu	$sp,$sp,584

.set	macro
.set	reorder
.end	put_qpel16_mc23_c
.align	2
.ent	put_pixels8_x2_c
.type	put_pixels8_x2_c, @function
put_pixels8_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1496
li	$2,-16908288			# 0xfffffffffefe0000

move	$8,$5
move	$9,$4
ori	$11,$2,0xfefe
move	$10,$0
$L1493:
lwl	$4,3($8)
lwl	$2,4($8)
lwr	$4,0($8)
lwr	$2,1($8)
addiu	$10,$10,1
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($9)
lwl	$4,7($8)
lwl	$2,8($8)
lwr	$4,4($8)
lwr	$2,5($8)
slt	$5,$10,$7
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($9)
addu	$8,$8,$6
bne	$5,$0,$L1493
addu	$9,$9,$6

$L1496:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels8_x2_c
.align	2
.ent	put_pixels8_y2_c
.type	put_pixels8_y2_c, @function
put_pixels8_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1502
li	$2,-16908288			# 0xfffffffffefe0000

move	$9,$5
move	$10,$4
ori	$12,$2,0xfefe
addu	$8,$5,$6
move	$11,$0
$L1499:
lwl	$4,3($9)
lwl	$2,3($8)
lwr	$4,0($9)
lwr	$2,0($8)
addiu	$11,$11,1
xor	$3,$2,$4
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($10)
lwl	$4,7($9)
lwl	$2,7($8)
lwr	$4,4($9)
lwr	$2,4($8)
slt	$5,$11,$7
xor	$3,$2,$4
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$5,$0,$L1499
addu	$10,$10,$6

$L1502:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels8_y2_c
.align	2
.ent	put_qpel8_mc10_c
.type	put_qpel8_mc10_c, @function
put_qpel8_mc10_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$18,$4
move	$7,$19
move	$4,$17
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
move	$16,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$5,$2,0xfefe
addiu	$6,$sp,96
$L1504:
lwl	$4,3($16)
lwl	$2,3($17)
lwr	$4,0($16)
lwr	$2,0($17)
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($16)
lwl	$2,7($17)
lwr	$4,4($16)
lwr	$2,4($17)
addiu	$17,$17,8
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addu	$16,$16,$19
bne	$17,$6,$L1504
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_qpel8_mc10_c
.align	2
.ent	put_qpel8_mc30_c
.type	put_qpel8_mc30_c, @function
put_qpel8_mc30_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$18,$4
move	$7,$19
move	$4,$17
move	$16,$5
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
addiu	$16,$16,1
ori	$5,$2,0xfefe
addiu	$6,$sp,96
$L1508:
lwl	$4,3($16)
lwl	$2,3($17)
lwr	$4,0($16)
lwr	$2,0($17)
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($16)
lwl	$2,7($17)
lwr	$4,4($16)
lwr	$2,4($17)
addiu	$17,$17,8
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addu	$16,$16,$19
bne	$17,$6,$L1508
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_qpel8_mc30_c
.align	2
.ent	put_qpel8_mc01_c
.type	put_qpel8_mc01_c, @function
put_qpel8_mc01_c:
.set	nomips16
.frame	$sp,256,$31		# vars= 208, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-256
sw	$31,252($sp)
sw	$19,248($sp)
sw	$18,244($sp)
sw	$17,240($sp)
sw	$16,236($sp)
.cprestore	16
addiu	$18,$sp,88
move	$19,$4
move	$17,$6
move	$4,$18
addiu	$6,$sp,232
$L1512:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1512
addu	$5,$5,$17

addiu	$16,$sp,24
move	$5,$18
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$5,$18
move	$6,$19
ori	$7,$2,0xfefe
addiu	$8,$sp,216
$L1513:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$5,$8,$L1513
addu	$6,$6,$17

lw	$31,252($sp)
lw	$19,248($sp)
lw	$18,244($sp)
lw	$17,240($sp)
lw	$16,236($sp)
j	$31
addiu	$sp,$sp,256

.set	macro
.set	reorder
.end	put_qpel8_mc01_c
.align	2
.ent	put_qpel8_mc03_c
.type	put_qpel8_mc03_c, @function
put_qpel8_mc03_c:
.set	nomips16
.frame	$sp,256,$31		# vars= 208, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-256
sw	$31,252($sp)
sw	$19,248($sp)
sw	$18,244($sp)
sw	$17,240($sp)
sw	$16,236($sp)
.cprestore	16
addiu	$7,$sp,88
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$17,$sp,232
$L1518:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$17,$L1518
addu	$5,$5,$18

addiu	$16,$sp,24
move	$5,$7
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,104
$L1519:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$5,$17,$L1519
addu	$6,$6,$18

lw	$31,252($sp)
lw	$19,248($sp)
lw	$18,244($sp)
lw	$17,240($sp)
lw	$16,236($sp)
j	$31
addiu	$sp,$sp,256

.set	macro
.set	reorder
.end	put_qpel8_mc03_c
.align	2
.ent	put_qpel8_mc11_c
.type	put_qpel8_mc11_c, @function
put_qpel8_mc11_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$19,328($sp)
sw	$18,324($sp)
sw	$17,320($sp)
sw	$16,316($sp)
.cprestore	24
addiu	$16,$sp,168
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1524:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1524
addu	$5,$5,$18

addiu	$17,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
move	$6,$16
$L1525:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1525
addiu	$6,$6,16

addiu	$16,$sp,32
move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,100
$L1526:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,8
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1526
addu	$6,$6,$18

lw	$31,332($sp)
lw	$19,328($sp)
lw	$18,324($sp)
lw	$17,320($sp)
lw	$16,316($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_qpel8_mc11_c
.align	2
.ent	put_qpel8_mc31_c
.type	put_qpel8_mc31_c, @function
put_qpel8_mc31_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$19,328($sp)
sw	$18,324($sp)
sw	$17,320($sp)
sw	$16,316($sp)
.cprestore	24
addiu	$16,$sp,168
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1532:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1532
addu	$5,$5,$18

addiu	$17,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
addiu	$6,$sp,169
$L1533:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1533
addiu	$6,$6,16

addiu	$16,$sp,32
move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,100
$L1534:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,8
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1534
addu	$6,$6,$18

lw	$31,332($sp)
lw	$19,328($sp)
lw	$18,324($sp)
lw	$17,320($sp)
lw	$16,316($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_qpel8_mc31_c
.align	2
.ent	put_qpel8_mc13_c
.type	put_qpel8_mc13_c, @function
put_qpel8_mc13_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$20,328($sp)
sw	$19,324($sp)
sw	$18,320($sp)
sw	$17,316($sp)
sw	$16,312($sp)
.cprestore	24
addiu	$16,$sp,168
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1540:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1540
addu	$5,$5,$18

addiu	$19,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
move	$4,$19
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$19
move	$5,$16
$L1541:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,8
bne	$17,$16,$L1541
addiu	$5,$5,16

addiu	$16,$sp,32
move	$5,$19
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$20
ori	$7,$2,0xfefe
addiu	$5,$sp,104
$L1542:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,8
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$17,$5,$L1542
addu	$6,$6,$18

lw	$31,332($sp)
lw	$20,328($sp)
lw	$19,324($sp)
lw	$18,320($sp)
lw	$17,316($sp)
lw	$16,312($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_qpel8_mc13_c
.align	2
.ent	put_qpel8_mc33_c
.type	put_qpel8_mc33_c, @function
put_qpel8_mc33_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$20,328($sp)
sw	$19,324($sp)
sw	$18,320($sp)
sw	$17,316($sp)
sw	$16,312($sp)
.cprestore	24
addiu	$16,$sp,168
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1548:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1548
addu	$5,$5,$18

addiu	$19,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
move	$4,$19
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$19
addiu	$5,$sp,169
$L1549:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,8
bne	$17,$16,$L1549
addiu	$5,$5,16

addiu	$16,$sp,32
move	$5,$19
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$20
ori	$7,$2,0xfefe
addiu	$5,$sp,104
$L1550:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,8
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,8
bne	$17,$5,$L1550
addu	$6,$6,$18

lw	$31,332($sp)
lw	$20,328($sp)
lw	$19,324($sp)
lw	$18,320($sp)
lw	$17,316($sp)
lw	$16,312($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	put_qpel8_mc33_c
.align	2
.ent	put_qpel8_mc21_c
.type	put_qpel8_mc21_c, @function
put_qpel8_mc21_c:
.set	nomips16
.frame	$sp,192,$31		# vars= 136, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-192
sw	$31,188($sp)
sw	$19,184($sp)
sw	$18,180($sp)
sw	$17,176($sp)
sw	$16,172($sp)
.cprestore	24
move	$19,$6
addiu	$18,$sp,96
li	$2,9			# 0x9
li	$6,8			# 0x8
move	$7,$19
move	$17,$4
addiu	$16,$sp,32
move	$4,$18
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$18
li	$6,8			# 0x8
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$6,$2,0xfefe
addiu	$5,$sp,100
$L1556:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,8
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$5,$5,8
bne	$16,$18,$L1556
addu	$17,$17,$19

lw	$31,188($sp)
lw	$19,184($sp)
lw	$18,180($sp)
lw	$17,176($sp)
lw	$16,172($sp)
j	$31
addiu	$sp,$sp,192

.set	macro
.set	reorder
.end	put_qpel8_mc21_c
.align	2
.ent	put_qpel8_mc23_c
.type	put_qpel8_mc23_c, @function
put_qpel8_mc23_c:
.set	nomips16
.frame	$sp,192,$31		# vars= 136, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-192
sw	$31,188($sp)
sw	$19,184($sp)
sw	$18,180($sp)
sw	$17,176($sp)
sw	$16,172($sp)
.cprestore	24
move	$19,$6
addiu	$16,$sp,96
li	$2,9			# 0x9
li	$6,8			# 0x8
move	$7,$19
move	$18,$4
addiu	$17,$sp,32
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$6,$2,0xfefe
addiu	$5,$sp,104
addiu	$7,$sp,168
$L1560:
lwl	$4,3($5)
lwl	$2,3($17)
lwr	$4,0($5)
lwr	$2,0($17)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($5)
lwl	$2,7($17)
lwr	$4,4($5)
lwr	$2,4($17)
addiu	$5,$5,8
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addiu	$17,$17,8
bne	$5,$7,$L1560
addu	$18,$18,$19

lw	$31,188($sp)
lw	$19,184($sp)
lw	$18,180($sp)
lw	$17,176($sp)
lw	$16,172($sp)
j	$31
addiu	$sp,$sp,192

.set	macro
.set	reorder
.end	put_qpel8_mc23_c
.align	2
.globl	ff_put_qpel8_mc12_old_c
.ent	ff_put_qpel8_mc12_old_c
.type	ff_put_qpel8_mc12_old_c, @function
ff_put_qpel8_mc12_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$16,$sp,232
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,376
$L1564:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1564
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$16
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
addiu	$16,$sp,96

move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,36
$L1565:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,8
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1565
addu	$6,$6,$18

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_qpel8_mc12_old_c
.align	2
.ent	put_qpel8_mc12_c
.type	put_qpel8_mc12_c, @function
put_qpel8_mc12_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$19,264($sp)
sw	$18,260($sp)
sw	$17,256($sp)
sw	$16,252($sp)
.cprestore	24
addiu	$16,$sp,104
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,248
$L1570:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1570
addu	$5,$5,$18

addiu	$17,$sp,32
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
move	$6,$16
$L1571:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1571
addiu	$6,$6,16

move	$4,$19
move	$5,$17
move	$6,$18
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,268($sp)
lw	$28,24($sp)
lw	$19,264($sp)
lw	$18,260($sp)
lw	$17,256($sp)
lw	$16,252($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	put_qpel8_mc12_c
.align	2
.globl	ff_put_qpel8_mc32_old_c
.ent	ff_put_qpel8_mc32_old_c
.type	ff_put_qpel8_mc32_old_c, @function
ff_put_qpel8_mc32_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$7,$sp,232
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,376
$L1576:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1576
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
addiu	$5,$sp,233
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
li	$6,8			# 0x8
li	$7,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$6,$19
ori	$7,$2,0xfefe
addiu	$5,$sp,36
$L1577:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,8
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,8
bne	$16,$17,$L1577
addu	$6,$6,$18

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_qpel8_mc32_old_c
.align	2
.ent	put_qpel8_mc32_c
.type	put_qpel8_mc32_c, @function
put_qpel8_mc32_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$19,264($sp)
sw	$18,260($sp)
sw	$17,256($sp)
sw	$16,252($sp)
.cprestore	24
addiu	$16,$sp,104
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,248
$L1582:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1582
addu	$5,$5,$18

addiu	$17,$sp,32
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
addiu	$6,$sp,105
$L1583:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1583
addiu	$6,$6,16

move	$4,$19
move	$5,$17
move	$6,$18
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,268($sp)
lw	$28,24($sp)
lw	$19,264($sp)
lw	$18,260($sp)
lw	$17,256($sp)
lw	$16,252($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	put_qpel8_mc32_c
.align	2
.ent	avg_qpel8_mc11_c
.type	avg_qpel8_mc11_c, @function
avg_qpel8_mc11_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$19,328($sp)
sw	$18,324($sp)
sw	$17,320($sp)
sw	$16,316($sp)
.cprestore	24
addiu	$16,$sp,168
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1588:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1588
addu	$5,$5,$18

addiu	$17,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
move	$6,$16
$L1589:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1589
addiu	$6,$6,16

addiu	$16,$sp,32
li	$6,8			# 0x8
li	$7,8			# 0x8
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$5,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$6,$sp,100
$L1590:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,8
sw	$4,4($7)
addiu	$6,$6,8
bne	$16,$17,$L1590
addu	$7,$7,$18

lw	$31,332($sp)
lw	$19,328($sp)
lw	$18,324($sp)
lw	$17,320($sp)
lw	$16,316($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	avg_qpel8_mc11_c
.align	2
.ent	avg_qpel8_mc31_c
.type	avg_qpel8_mc31_c, @function
avg_qpel8_mc31_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$19,328($sp)
sw	$18,324($sp)
sw	$17,320($sp)
sw	$16,316($sp)
.cprestore	24
addiu	$16,$sp,168
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,312
$L1596:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1596
addu	$5,$5,$18

addiu	$17,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
addiu	$6,$sp,169
$L1597:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1597
addiu	$6,$6,16

addiu	$16,$sp,32
li	$6,8			# 0x8
li	$7,8			# 0x8
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$5,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$6,$sp,100
$L1598:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,8
sw	$4,4($7)
addiu	$6,$6,8
bne	$16,$17,$L1598
addu	$7,$7,$18

lw	$31,332($sp)
lw	$19,328($sp)
lw	$18,324($sp)
lw	$17,320($sp)
lw	$16,316($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	avg_qpel8_mc31_c
.align	2
.ent	avg_qpel8_mc13_c
.type	avg_qpel8_mc13_c, @function
avg_qpel8_mc13_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$20,328($sp)
sw	$19,324($sp)
sw	$18,320($sp)
sw	$17,316($sp)
sw	$16,312($sp)
.cprestore	24
addiu	$16,$sp,168
move	$20,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,312
$L1604:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1604
addu	$5,$5,$19

addiu	$18,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
move	$4,$18
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$18
move	$5,$16
$L1605:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,8
bne	$17,$16,$L1605
addiu	$5,$5,16

addiu	$16,$sp,32
li	$6,8			# 0x8
li	$7,8			# 0x8
move	$5,$18
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$20
ori	$8,$2,0xfefe
addiu	$6,$sp,104
$L1606:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,8
sw	$4,4($7)
addiu	$16,$16,8
bne	$17,$6,$L1606
addu	$7,$7,$19

lw	$31,332($sp)
lw	$20,328($sp)
lw	$19,324($sp)
lw	$18,320($sp)
lw	$17,316($sp)
lw	$16,312($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	avg_qpel8_mc13_c
.align	2
.ent	avg_qpel8_mc33_c
.type	avg_qpel8_mc33_c, @function
avg_qpel8_mc33_c:
.set	nomips16
.frame	$sp,336,$31		# vars= 280, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-336
sw	$31,332($sp)
sw	$20,328($sp)
sw	$19,324($sp)
sw	$18,320($sp)
sw	$17,316($sp)
sw	$16,312($sp)
.cprestore	24
addiu	$16,$sp,168
move	$20,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,312
$L1612:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1612
addu	$5,$5,$19

addiu	$18,$sp,96
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
move	$4,$18
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$18
addiu	$5,$sp,169
$L1613:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,8
bne	$17,$16,$L1613
addiu	$5,$5,16

addiu	$16,$sp,32
li	$6,8			# 0x8
li	$7,8			# 0x8
move	$5,$18
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$20
ori	$8,$2,0xfefe
addiu	$6,$sp,104
$L1614:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,8
sw	$4,4($7)
addiu	$16,$16,8
bne	$17,$6,$L1614
addu	$7,$7,$19

lw	$31,332($sp)
lw	$20,328($sp)
lw	$19,324($sp)
lw	$18,320($sp)
lw	$17,316($sp)
lw	$16,312($sp)
j	$31
addiu	$sp,$sp,336

.set	macro
.set	reorder
.end	avg_qpel8_mc33_c
.align	2
.ent	avg_qpel8_mc12_c
.type	avg_qpel8_mc12_c, @function
avg_qpel8_mc12_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$19,264($sp)
sw	$18,260($sp)
sw	$17,256($sp)
sw	$16,252($sp)
.cprestore	24
addiu	$16,$sp,104
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,248
$L1620:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1620
addu	$5,$5,$18

addiu	$17,$sp,32
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
move	$6,$16
$L1621:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1621
addiu	$6,$6,16

move	$4,$19
move	$5,$17
move	$6,$18
.option	pic0
jal	avg_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,268($sp)
lw	$28,24($sp)
lw	$19,264($sp)
lw	$18,260($sp)
lw	$17,256($sp)
lw	$16,252($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	avg_qpel8_mc12_c
.align	2
.ent	avg_qpel8_mc32_c
.type	avg_qpel8_mc32_c, @function
avg_qpel8_mc32_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$19,264($sp)
sw	$18,260($sp)
sw	$17,256($sp)
sw	$16,252($sp)
.cprestore	24
addiu	$16,$sp,104
move	$19,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,248
$L1626:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1626
addu	$5,$5,$18

addiu	$17,$sp,32
li	$2,9			# 0x9
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
move	$4,$17
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$17
addiu	$6,$sp,105
$L1627:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,8
bne	$5,$16,$L1627
addiu	$6,$6,16

move	$4,$19
move	$5,$17
move	$6,$18
.option	pic0
jal	avg_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

lw	$31,268($sp)
lw	$28,24($sp)
lw	$19,264($sp)
lw	$18,260($sp)
lw	$17,256($sp)
lw	$16,252($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	avg_qpel8_mc32_c
.align	2
.ent	put_mspel8_mc10_c
.type	put_mspel8_mc10_c, @function
put_mspel8_mc10_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$18,$4
move	$7,$19
move	$4,$17
sw	$2,16($sp)
.option	pic0
jal	wmv2_mspel8_h_lowpass
.option	pic2
move	$16,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$5,$2,0xfefe
addiu	$6,$sp,96
$L1632:
lwl	$4,3($16)
lwl	$2,3($17)
lwr	$4,0($16)
lwr	$2,0($17)
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($16)
lwl	$2,7($17)
lwr	$4,4($16)
lwr	$2,4($17)
addiu	$17,$17,8
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addu	$16,$16,$19
bne	$17,$6,$L1632
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_mspel8_mc10_c
.align	2
.ent	put_mspel8_mc30_c
.type	put_mspel8_mc30_c, @function
put_mspel8_mc30_c:
.set	nomips16
.frame	$sp,120,$31		# vars= 64, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-120
sw	$31,116($sp)
sw	$19,112($sp)
sw	$18,108($sp)
sw	$17,104($sp)
sw	$16,100($sp)
.cprestore	24
move	$19,$6
addiu	$17,$sp,32
li	$2,8			# 0x8
li	$6,8			# 0x8
move	$18,$4
move	$7,$19
move	$4,$17
move	$16,$5
.option	pic0
jal	wmv2_mspel8_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
addiu	$16,$16,1
ori	$5,$2,0xfefe
addiu	$6,$sp,96
$L1636:
lwl	$4,3($16)
lwl	$2,3($17)
lwr	$4,0($16)
lwr	$2,0($17)
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($16)
lwl	$2,7($17)
lwr	$4,4($16)
lwr	$2,4($17)
addiu	$17,$17,8
xor	$3,$2,$4
and	$3,$3,$5
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addu	$16,$16,$19
bne	$17,$6,$L1636
addu	$18,$18,$19

lw	$31,116($sp)
lw	$19,112($sp)
lw	$18,108($sp)
lw	$17,104($sp)
lw	$16,100($sp)
j	$31
addiu	$sp,$sp,120

.set	macro
.set	reorder
.end	put_mspel8_mc30_c
.align	2
.ent	put_mspel8_mc12_c
.type	put_mspel8_mc12_c, @function
put_mspel8_mc12_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$20,264($sp)
sw	$19,260($sp)
sw	$18,256($sp)
sw	$17,252($sp)
sw	$16,248($sp)
.cprestore	24
move	$19,$6
addiu	$20,$sp,160
li	$2,11			# 0xb
move	$16,$5
move	$7,$19
subu	$5,$5,$6
move	$18,$4
li	$6,8			# 0x8
move	$4,$20
sw	$2,16($sp)
.option	pic0
jal	wmv2_mspel8_h_lowpass
.option	pic2
li	$17,8			# 0x8

move	$5,$16
addiu	$4,$sp,32
li	$6,8			# 0x8
move	$7,$19
addiu	$16,$sp,96
.option	pic0
jal	wmv2_mspel8_v_lowpass
.option	pic2
sw	$17,16($sp)

addiu	$5,$sp,168
li	$6,8			# 0x8
move	$4,$16
li	$7,8			# 0x8
.option	pic0
jal	wmv2_mspel8_v_lowpass
.option	pic2
sw	$17,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$6,$2,0xfefe
addiu	$5,$sp,36
$L1640:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,8
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addiu	$5,$5,8
bne	$16,$20,$L1640
addu	$18,$18,$19

lw	$31,268($sp)
lw	$20,264($sp)
lw	$19,260($sp)
lw	$18,256($sp)
lw	$17,252($sp)
lw	$16,248($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	put_mspel8_mc12_c
.align	2
.ent	put_mspel8_mc32_c
.type	put_mspel8_mc32_c, @function
put_mspel8_mc32_c:
.set	nomips16
.frame	$sp,272,$31		# vars= 216, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-272
sw	$31,268($sp)
sw	$20,264($sp)
sw	$19,260($sp)
sw	$18,256($sp)
sw	$17,252($sp)
sw	$16,248($sp)
.cprestore	24
move	$19,$6
addiu	$20,$sp,160
li	$2,11			# 0xb
move	$16,$5
move	$7,$19
subu	$5,$5,$6
move	$18,$4
li	$6,8			# 0x8
move	$4,$20
sw	$2,16($sp)
.option	pic0
jal	wmv2_mspel8_h_lowpass
.option	pic2
li	$17,8			# 0x8

addiu	$5,$16,1
addiu	$4,$sp,32
li	$6,8			# 0x8
move	$7,$19
addiu	$16,$sp,96
.option	pic0
jal	wmv2_mspel8_v_lowpass
.option	pic2
sw	$17,16($sp)

addiu	$5,$sp,168
li	$6,8			# 0x8
move	$4,$16
li	$7,8			# 0x8
.option	pic0
jal	wmv2_mspel8_v_lowpass
.option	pic2
sw	$17,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$6,$2,0xfefe
addiu	$5,$sp,36
$L1644:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,8
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addiu	$5,$5,8
bne	$16,$20,$L1644
addu	$18,$18,$19

lw	$31,268($sp)
lw	$20,264($sp)
lw	$19,260($sp)
lw	$18,256($sp)
lw	$17,252($sp)
lw	$16,248($sp)
j	$31
addiu	$sp,$sp,272

.set	macro
.set	reorder
.end	put_mspel8_mc32_c
.align	2
.globl	ff_put_qpel8_mc11_old_c
.ent	ff_put_qpel8_mc11_old_c
.type	ff_put_qpel8_mc11_old_c, @function
ff_put_qpel8_mc11_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$18,$sp,232
move	$20,$4
move	$19,$6
move	$4,$18
addiu	$6,$sp,376
$L1648:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1648
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$4,$17
move	$5,$18
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
move	$5,$18
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$9,$18
move	$13,$20
ori	$15,$2,0x202
ori	$14,$3,0xf0f
addiu	$10,$sp,164
addiu	$8,$sp,36
addiu	$17,$sp,360
$L1649:
lwl	$5,3($9)
lwl	$2,-1($10)
lwr	$5,0($9)
lwr	$2,-4($10)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($9)
lwl	$2,3($10)
lwr	$5,4($9)
lwr	$2,0($10)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
addiu	$9,$9,16
sw	$2,4($13)
addiu	$16,$16,8
addu	$13,$13,$19
addiu	$10,$10,8
bne	$9,$17,$L1649
addiu	$8,$8,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_qpel8_mc11_old_c
.align	2
.globl	ff_put_qpel16_mc13_old_c
.ent	ff_put_qpel16_mc13_old_c
.type	ff_put_qpel16_mc13_old_c, @function
ff_put_qpel16_mc13_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$16,$sp,816
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$19,$sp,1224
$L1654:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$19,$L1654
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$4,$17
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$14,$20
ori	$17,$2,0x202
ori	$15,$3,0xf0f
addiu	$8,$sp,840
addiu	$10,$sp,560
addiu	$9,$sp,36
move	$13,$20
$L1655:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,4($13)
addiu	$10,$10,16
addiu	$16,$16,16
addu	$13,$13,$18
bne	$8,$19,$L1655
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x202
ori	$15,$3,0xf0f
addiu	$8,$sp,848
addiu	$11,$sp,568
addiu	$10,$sp,40
addiu	$9,$sp,296
addiu	$17,$sp,1232
$L1656:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,3($10)
lwl	$7,3($9)
lwr	$6,0($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,7($10)
lwl	$7,7($9)
lwr	$6,4($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addiu	$9,$9,16
bne	$8,$17,$L1656
addu	$14,$14,$18

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_qpel16_mc13_old_c
.align	2
.globl	ff_put_qpel8_mc31_old_c
.ent	ff_put_qpel8_mc31_old_c
.type	ff_put_qpel8_mc31_old_c, @function
ff_put_qpel8_mc31_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$7,$sp,232
move	$20,$4
move	$19,$6
move	$4,$7
addiu	$6,$sp,376
$L1662:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1662
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
addiu	$18,$sp,233
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
move	$5,$18
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$11,$2,0xfcfc
ori	$10,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$12,$20
ori	$14,$2,0x202
ori	$13,$3,0xf0f
addiu	$9,$sp,164
addiu	$8,$sp,36
addiu	$15,$sp,361
$L1663:
lwl	$5,3($18)
lwl	$2,-1($9)
lwr	$5,0($18)
lwr	$2,-4($9)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$14
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$10
srl	$2,$2,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
sw	$2,0($12)
lwl	$5,7($18)
lwl	$2,3($9)
lwr	$5,4($18)
lwr	$2,0($9)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$14
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$10
srl	$5,$5,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
addiu	$18,$18,16
sw	$2,4($12)
addiu	$16,$16,8
addu	$12,$12,$19
addiu	$9,$9,8
bne	$18,$15,$L1663
addiu	$8,$8,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_qpel8_mc31_old_c
.align	2
.globl	ff_put_qpel8_mc13_old_c
.ent	ff_put_qpel8_mc13_old_c
.type	ff_put_qpel8_mc13_old_c, @function
ff_put_qpel8_mc13_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$16,$sp,232
move	$20,$4
move	$19,$6
move	$4,$16
addiu	$18,$sp,376
$L1668:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$18,$L1668
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$16
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
addiu	$16,$sp,96

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$13,$20
ori	$15,$2,0x202
ori	$14,$3,0xf0f
addiu	$8,$sp,248
addiu	$10,$sp,168
addiu	$9,$sp,36
$L1669:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
addiu	$8,$8,16
sw	$2,4($13)
addiu	$10,$10,8
addiu	$16,$16,8
addu	$13,$13,$19
bne	$8,$18,$L1669
addiu	$9,$9,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_qpel8_mc13_old_c
.align	2
.globl	ff_put_qpel8_mc33_old_c
.ent	ff_put_qpel8_mc33_old_c
.type	ff_put_qpel8_mc33_old_c, @function
ff_put_qpel8_mc33_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$7,$sp,232
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,376
$L1674:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1674
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
addiu	$5,$sp,233
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$13,$19
ori	$15,$2,0x202
ori	$14,$3,0xf0f
addiu	$8,$sp,249
addiu	$10,$sp,168
addiu	$9,$sp,36
addiu	$17,$sp,377
$L1675:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
addiu	$8,$8,16
sw	$2,4($13)
addiu	$10,$10,8
addiu	$16,$16,8
addu	$13,$13,$18
bne	$8,$17,$L1675
addiu	$9,$9,8

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_qpel8_mc33_old_c
.align	2
.globl	ff_put_no_rnd_qpel16_mc13_old_c
.ent	ff_put_no_rnd_qpel16_mc13_old_c
.type	ff_put_no_rnd_qpel16_mc13_old_c, @function
ff_put_no_rnd_qpel16_mc13_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$16,$sp,816
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$19,$sp,1224
$L1680:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$19,$L1680
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$4,$17
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$14,$20
ori	$17,$2,0x101
ori	$15,$3,0xf0f
addiu	$8,$sp,840
addiu	$10,$sp,560
addiu	$9,$sp,36
move	$13,$20
$L1681:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,4($13)
addiu	$10,$10,16
addiu	$16,$16,16
addu	$13,$13,$18
bne	$8,$19,$L1681
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x101
ori	$15,$3,0xf0f
addiu	$8,$sp,848
addiu	$11,$sp,568
addiu	$10,$sp,40
addiu	$9,$sp,296
addiu	$17,$sp,1232
$L1682:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,3($10)
lwl	$7,3($9)
lwr	$6,0($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,7($10)
lwl	$7,7($9)
lwr	$6,4($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addiu	$9,$9,16
bne	$8,$17,$L1682
addu	$14,$14,$18

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel16_mc13_old_c
.align	2
.globl	ff_put_no_rnd_qpel8_mc11_old_c
.ent	ff_put_no_rnd_qpel8_mc11_old_c
.type	ff_put_no_rnd_qpel8_mc11_old_c, @function
ff_put_no_rnd_qpel8_mc11_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$18,$sp,232
move	$20,$4
move	$19,$6
move	$4,$18
addiu	$6,$sp,376
$L1688:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1688
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$4,$17
move	$5,$18
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
move	$5,$18
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$9,$18
move	$13,$20
ori	$15,$2,0x101
ori	$14,$3,0xf0f
addiu	$10,$sp,164
addiu	$8,$sp,36
addiu	$17,$sp,360
$L1689:
lwl	$5,3($9)
lwl	$2,-1($10)
lwr	$5,0($9)
lwr	$2,-4($10)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($9)
lwl	$2,3($10)
lwr	$5,4($9)
lwr	$2,0($10)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
addiu	$9,$9,16
sw	$2,4($13)
addiu	$16,$16,8
addu	$13,$13,$19
addiu	$10,$10,8
bne	$9,$17,$L1689
addiu	$8,$8,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel8_mc11_old_c
.align	2
.globl	ff_put_no_rnd_qpel8_mc31_old_c
.ent	ff_put_no_rnd_qpel8_mc31_old_c
.type	ff_put_no_rnd_qpel8_mc31_old_c, @function
ff_put_no_rnd_qpel8_mc31_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$7,$sp,232
move	$20,$4
move	$19,$6
move	$4,$7
addiu	$6,$sp,376
$L1694:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1694
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
addiu	$18,$sp,233
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
move	$5,$18
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$11,$2,0xfcfc
ori	$10,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$12,$20
ori	$14,$2,0x101
ori	$13,$3,0xf0f
addiu	$9,$sp,164
addiu	$8,$sp,36
addiu	$15,$sp,361
$L1695:
lwl	$5,3($18)
lwl	$2,-1($9)
lwr	$5,0($18)
lwr	$2,-4($9)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$14
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$10
srl	$2,$2,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
sw	$2,0($12)
lwl	$5,7($18)
lwl	$2,3($9)
lwr	$5,4($18)
lwr	$2,0($9)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$14
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$10
srl	$5,$5,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
addiu	$18,$18,16
sw	$2,4($12)
addiu	$16,$16,8
addu	$12,$12,$19
addiu	$9,$9,8
bne	$18,$15,$L1695
addiu	$8,$8,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel8_mc31_old_c
.align	2
.globl	ff_put_no_rnd_qpel8_mc13_old_c
.ent	ff_put_no_rnd_qpel8_mc13_old_c
.type	ff_put_no_rnd_qpel8_mc13_old_c, @function
ff_put_no_rnd_qpel8_mc13_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$16,$sp,232
move	$20,$4
move	$19,$6
move	$4,$16
addiu	$18,$sp,376
$L1700:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$18,$L1700
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$16
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
addiu	$16,$sp,96

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$13,$20
ori	$15,$2,0x101
ori	$14,$3,0xf0f
addiu	$8,$sp,248
addiu	$10,$sp,168
addiu	$9,$sp,36
$L1701:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
addiu	$8,$8,16
sw	$2,4($13)
addiu	$10,$10,8
addiu	$16,$16,8
addu	$13,$13,$19
bne	$8,$18,$L1701
addiu	$9,$9,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel8_mc13_old_c
.align	2
.globl	ff_put_no_rnd_qpel8_mc33_old_c
.ent	ff_put_no_rnd_qpel8_mc33_old_c
.type	ff_put_no_rnd_qpel8_mc33_old_c, @function
ff_put_no_rnd_qpel8_mc33_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$7,$sp,232
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,376
$L1706:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1706
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
addiu	$5,$sp,233
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_no_rnd_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$13,$19
ori	$15,$2,0x101
ori	$14,$3,0xf0f
addiu	$8,$sp,249
addiu	$10,$sp,168
addiu	$9,$sp,36
addiu	$17,$sp,377
$L1707:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$14
addu	$2,$2,$4
addiu	$8,$8,16
sw	$2,4($13)
addiu	$10,$10,8
addiu	$16,$16,8
addu	$13,$13,$18
bne	$8,$17,$L1707
addiu	$9,$9,8

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel8_mc33_old_c
.align	2
.ent	put_pixels16_y2_c
.type	put_pixels16_y2_c, @function
put_pixels16_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1718
move	$14,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$12,$4
ori	$13,$2,0xfefe
move	$9,$5
addu	$8,$5,$6
move	$10,$4
move	$11,$0
$L1713:
lwl	$4,3($9)
lwl	$2,3($8)
lwr	$4,0($9)
lwr	$2,0($8)
addiu	$11,$11,1
xor	$3,$2,$4
and	$3,$3,$13
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($10)
lwl	$4,7($9)
lwl	$2,7($8)
lwr	$4,4($9)
lwr	$2,4($8)
slt	$5,$11,$7
xor	$3,$2,$4
and	$3,$3,$13
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$5,$0,$L1713
addu	$10,$10,$6

addiu	$9,$14,8
li	$2,-16908288			# 0xfffffffffefe0000
ori	$11,$2,0xfefe
addu	$8,$9,$6
move	$10,$0
$L1714:
lwl	$4,3($9)
lwl	$2,3($8)
lwr	$4,0($9)
lwr	$2,0($8)
addiu	$10,$10,1
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($12)
lwl	$4,7($9)
lwl	$2,7($8)
lwr	$4,4($9)
lwr	$2,4($8)
slt	$5,$10,$7
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($12)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$5,$0,$L1714
addu	$12,$12,$6

$L1718:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels16_y2_c
.align	2
.ent	put_pixels16_x2_c
.type	put_pixels16_x2_c, @function
put_pixels16_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1726
move	$13,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$11,$4
ori	$12,$2,0xfefe
move	$8,$5
move	$9,$4
move	$10,$0
$L1721:
lwl	$4,3($8)
lwl	$2,4($8)
lwr	$4,0($8)
lwr	$2,1($8)
addiu	$10,$10,1
xor	$3,$2,$4
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($9)
lwl	$4,7($8)
lwl	$2,8($8)
lwr	$4,4($8)
lwr	$2,5($8)
slt	$5,$10,$7
xor	$3,$2,$4
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($9)
addu	$8,$8,$6
bne	$5,$0,$L1721
addu	$9,$9,$6

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$8,$13,8
ori	$10,$2,0xfefe
move	$9,$0
$L1722:
lwl	$4,3($8)
lwl	$2,4($8)
lwr	$4,0($8)
lwr	$2,1($8)
addiu	$9,$9,1
xor	$3,$2,$4
and	$3,$3,$10
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($11)
lwl	$4,7($8)
lwl	$2,8($8)
lwr	$4,4($8)
lwr	$2,5($8)
slt	$5,$9,$7
xor	$3,$2,$4
and	$3,$3,$10
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($11)
addu	$8,$8,$6
bne	$5,$0,$L1722
addu	$11,$11,$6

$L1726:
j	$31
nop

.set	macro
.set	reorder
.end	put_pixels16_x2_c
.align	2
.ent	avg_pixels16_y2_c
.type	avg_pixels16_y2_c, @function
avg_pixels16_y2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1734
move	$14,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$11,$4
ori	$13,$2,0xfefe
move	$9,$5
addu	$8,$5,$6
move	$10,$4
move	$12,$0
$L1729:
lwl	$4,3($9)
lwl	$2,3($8)
lwr	$4,0($9)
lwr	$2,0($8)
lw	$5,0($10)
xor	$3,$2,$4
and	$3,$3,$13
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$13
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($10)
lwl	$4,7($9)
lwl	$3,7($8)
lwr	$4,4($9)
lwr	$3,4($8)
lw	$5,4($10)
xor	$2,$3,$4
and	$2,$2,$13
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$13
srl	$4,$4,1
addiu	$12,$12,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$12,$7
sw	$3,4($10)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$2,$0,$L1729
addu	$10,$10,$6

addiu	$9,$14,8
li	$2,-16908288			# 0xfffffffffefe0000
ori	$12,$2,0xfefe
addu	$8,$9,$6
move	$10,$0
$L1730:
lwl	$4,3($9)
lwl	$2,3($8)
lwr	$4,0($9)
lwr	$2,0($8)
lw	$5,8($11)
xor	$3,$2,$4
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$12
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($11)
lwl	$4,7($9)
lwl	$3,7($8)
lwr	$4,4($9)
lwr	$3,4($8)
lw	$5,12($11)
xor	$2,$3,$4
and	$2,$2,$12
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$12
srl	$4,$4,1
addiu	$10,$10,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$10,$7
sw	$3,12($11)
addu	$9,$9,$6
addu	$8,$8,$6
bne	$2,$0,$L1730
addu	$11,$11,$6

$L1734:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels16_y2_c
.align	2
.ent	put_no_rnd_qpel16_mc23_c
.type	put_no_rnd_qpel16_mc23_c, @function
put_no_rnd_qpel16_mc23_c:
.set	nomips16
.frame	$sp,584,$31		# vars= 528, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-584
sw	$31,580($sp)
sw	$19,576($sp)
sw	$18,572($sp)
sw	$17,568($sp)
sw	$16,564($sp)
.cprestore	24
move	$19,$6
addiu	$16,$sp,288
li	$2,17			# 0x11
move	$18,$4
li	$6,16			# 0x10
move	$4,$16
move	$7,$19
addiu	$17,$sp,32
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$5,$sp,304
move	$6,$18
addiu	$8,$sp,560
$L1736:
lwl	$4,3($5)
lwl	$3,3($17)
lwr	$4,0($5)
lwr	$3,0($17)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($17)
lwr	$4,4($5)
lwr	$3,4($17)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$17,$17,16
bne	$5,$8,$L1736
addu	$6,$6,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,40
addiu	$8,$sp,568
$L1737:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($18)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($18)
addiu	$6,$6,16
bne	$5,$8,$L1737
addu	$18,$18,$19

lw	$31,580($sp)
lw	$19,576($sp)
lw	$18,572($sp)
lw	$17,568($sp)
lw	$16,564($sp)
j	$31
addiu	$sp,$sp,584

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc23_c
.align	2
.globl	ff_put_no_rnd_qpel16_mc12_old_c
.ent	ff_put_no_rnd_qpel16_mc12_old_c
.type	ff_put_no_rnd_qpel16_mc12_old_c, @function
ff_put_no_rnd_qpel16_mc12_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$16,$sp,816
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,1224
$L1742:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1742
addu	$5,$5,$17

addiu	$18,$sp,544
li	$2,17			# 0x11
move	$5,$16
move	$4,$18
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$18
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$5,$sp,36
move	$6,$19
$L1743:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$18,$L1743
addu	$6,$6,$17

addiu	$9,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,40
move	$6,$9
$L1744:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L1744
addu	$7,$7,$17

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel16_mc12_old_c
.align	2
.ent	put_no_rnd_qpel16_mc12_c
.type	put_no_rnd_qpel16_mc12_c, @function
put_no_rnd_qpel16_mc12_c:
.set	nomips16
.frame	$sp,736,$31		# vars= 680, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-736
sw	$31,732($sp)
sw	$19,728($sp)
sw	$18,724($sp)
sw	$17,720($sp)
sw	$16,716($sp)
.cprestore	24
addiu	$16,$sp,304
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,712
$L1750:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1750
addu	$5,$5,$17

addiu	$18,$sp,32
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$18
move	$6,$16
$L1751:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1751
addiu	$6,$6,24

addiu	$8,$sp,312
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,40
move	$6,$8
$L1752:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1752
addiu	$6,$6,24

move	$4,$19
move	$5,$18
move	$6,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,732($sp)
lw	$28,24($sp)
lw	$19,728($sp)
lw	$18,724($sp)
lw	$17,720($sp)
lw	$16,716($sp)
j	$31
addiu	$sp,$sp,736

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc12_c
.align	2
.globl	ff_put_no_rnd_qpel16_mc32_old_c
.ent	ff_put_no_rnd_qpel16_mc32_old_c
.type	ff_put_no_rnd_qpel16_mc32_old_c, @function
ff_put_no_rnd_qpel16_mc32_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$7,$sp,816
move	$19,$4
move	$17,$6
move	$4,$7
addiu	$6,$sp,1224
$L1758:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1758
addu	$5,$5,$17

addiu	$18,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$18
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
addiu	$5,$sp,817
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$18
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$5,$sp,36
move	$6,$19
$L1759:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$18,$L1759
addu	$6,$6,$17

addiu	$9,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,40
move	$6,$9
$L1760:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L1760
addu	$7,$7,$17

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel16_mc32_old_c
.align	2
.ent	put_no_rnd_qpel16_mc32_c
.type	put_no_rnd_qpel16_mc32_c, @function
put_no_rnd_qpel16_mc32_c:
.set	nomips16
.frame	$sp,736,$31		# vars= 680, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-736
sw	$31,732($sp)
sw	$19,728($sp)
sw	$18,724($sp)
sw	$17,720($sp)
sw	$16,716($sp)
.cprestore	24
addiu	$16,$sp,304
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,712
$L1766:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1766
addu	$5,$5,$17

addiu	$18,$sp,32
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$18
addiu	$6,$sp,305
$L1767:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1767
addiu	$6,$6,24

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,40
addiu	$6,$sp,313
addiu	$8,$sp,312
$L1768:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1768
addiu	$6,$6,24

move	$4,$19
move	$5,$18
move	$6,$17
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,732($sp)
lw	$28,24($sp)
lw	$19,728($sp)
lw	$18,724($sp)
lw	$17,720($sp)
lw	$16,716($sp)
j	$31
addiu	$sp,$sp,736

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc32_c
.align	2
.ent	avg_pixels16_x2_c
.type	avg_pixels16_x2_c, @function
avg_pixels16_x2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

blez	$7,$L1780
move	$13,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$10,$4
ori	$12,$2,0xfefe
move	$8,$5
move	$9,$4
move	$11,$0
$L1775:
lwl	$4,3($8)
lwl	$2,4($8)
lwr	$4,0($8)
lwr	$2,1($8)
lw	$5,0($9)
xor	$3,$2,$4
and	$3,$3,$12
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$12
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($9)
lwl	$4,7($8)
lwl	$3,8($8)
lwr	$4,4($8)
lwr	$3,5($8)
lw	$5,4($9)
xor	$2,$3,$4
and	$2,$2,$12
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$12
srl	$4,$4,1
addiu	$11,$11,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$11,$7
sw	$3,4($9)
addu	$8,$8,$6
bne	$2,$0,$L1775
addu	$9,$9,$6

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$8,$13,8
ori	$11,$2,0xfefe
move	$9,$0
$L1776:
lwl	$4,3($8)
lwl	$2,4($8)
lwr	$4,0($8)
lwr	$2,1($8)
lw	$5,8($10)
xor	$3,$2,$4
and	$3,$3,$11
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$11
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($10)
lwl	$4,7($8)
lwl	$3,8($8)
lwr	$4,4($8)
lwr	$3,5($8)
lw	$5,12($10)
xor	$2,$3,$4
and	$2,$2,$11
srl	$2,$2,1
or	$3,$3,$4
subu	$3,$3,$2
xor	$4,$3,$5
and	$4,$4,$11
srl	$4,$4,1
addiu	$9,$9,1
or	$3,$3,$5
subu	$3,$3,$4
slt	$2,$9,$7
sw	$3,12($10)
addu	$8,$8,$6
bne	$2,$0,$L1776
addu	$10,$10,$6

$L1780:
j	$31
nop

.set	macro
.set	reorder
.end	avg_pixels16_x2_c
.align	2
.ent	put_no_rnd_qpel16_mc11_c
.type	put_no_rnd_qpel16_mc11_c, @function
put_no_rnd_qpel16_mc11_c:
.set	nomips16
.frame	$sp,992,$31		# vars= 936, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-992
sw	$31,988($sp)
sw	$20,984($sp)
sw	$19,980($sp)
sw	$18,976($sp)
sw	$17,972($sp)
sw	$16,968($sp)
.cprestore	24
addiu	$16,$sp,560
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,968
$L1782:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1782
addu	$5,$5,$18

addiu	$19,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$19
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$19
move	$6,$16
$L1783:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1783
addiu	$6,$6,24

addiu	$17,$sp,296
addiu	$8,$sp,568
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$6,$8
move	$5,$17
$L1784:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1784
addiu	$6,$6,24

addiu	$16,$sp,32
move	$5,$19
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$20
ori	$8,$2,0xfefe
addiu	$5,$sp,292
move	$6,$20
$L1785:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$19,$L1785
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$5,$sp,40
addiu	$8,$sp,552
$L1786:
lwl	$4,3($17)
lwl	$3,3($5)
lwr	$4,0($17)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($17)
lwl	$3,7($5)
lwr	$4,4($17)
lwr	$3,4($5)
addiu	$17,$17,16
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$5,$5,16
bne	$17,$8,$L1786
addu	$7,$7,$18

lw	$31,988($sp)
lw	$20,984($sp)
lw	$19,980($sp)
lw	$18,976($sp)
lw	$17,972($sp)
lw	$16,968($sp)
j	$31
addiu	$sp,$sp,992

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc11_c
.align	2
.ent	put_no_rnd_qpel16_mc31_c
.type	put_no_rnd_qpel16_mc31_c, @function
put_no_rnd_qpel16_mc31_c:
.set	nomips16
.frame	$sp,992,$31		# vars= 936, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-992
sw	$31,988($sp)
sw	$20,984($sp)
sw	$19,980($sp)
sw	$18,976($sp)
sw	$17,972($sp)
sw	$16,968($sp)
.cprestore	24
addiu	$16,$sp,560
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,968
$L1794:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1794
addu	$5,$5,$18

addiu	$19,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$19
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$19
addiu	$6,$sp,561
$L1795:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1795
addiu	$6,$6,24

addiu	$17,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$6,$sp,569
move	$5,$17
addiu	$8,$sp,568
$L1796:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1796
addiu	$6,$6,24

addiu	$16,$sp,32
move	$5,$19
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$20
ori	$8,$2,0xfefe
addiu	$5,$sp,292
move	$6,$20
$L1797:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$19,$L1797
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$5,$sp,40
addiu	$8,$sp,552
$L1798:
lwl	$4,3($17)
lwl	$3,3($5)
lwr	$4,0($17)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($17)
lwl	$3,7($5)
lwr	$4,4($17)
lwr	$3,4($5)
addiu	$17,$17,16
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$5,$5,16
bne	$17,$8,$L1798
addu	$7,$7,$18

lw	$31,988($sp)
lw	$20,984($sp)
lw	$19,980($sp)
lw	$18,976($sp)
lw	$17,972($sp)
lw	$16,968($sp)
j	$31
addiu	$sp,$sp,992

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc31_c
.align	2
.ent	put_no_rnd_qpel16_mc13_c
.type	put_no_rnd_qpel16_mc13_c, @function
put_no_rnd_qpel16_mc13_c:
.set	nomips16
.frame	$sp,1000,$31		# vars= 936, regs= 7/0, args= 24, gp= 8
.mask	0x803f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1000
sw	$31,996($sp)
sw	$21,992($sp)
sw	$20,988($sp)
sw	$19,984($sp)
sw	$18,980($sp)
sw	$17,976($sp)
sw	$16,972($sp)
.cprestore	24
addiu	$16,$sp,560
move	$21,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,968
$L1806:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1806
addu	$5,$5,$19

addiu	$20,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
move	$4,$20
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$20
move	$5,$16
$L1807:
lwl	$4,3($17)
lwl	$3,3($5)
lwr	$4,0($17)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$3,7($5)
lwr	$4,4($17)
lwr	$3,4($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,16
bne	$17,$16,$L1807
addiu	$5,$5,24

addiu	$7,$sp,568
li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$18,$sp,296
move	$5,$7
$L1808:
lwl	$4,3($18)
lwl	$3,3($5)
lwr	$4,0($18)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($18)
lwl	$3,7($5)
lwr	$4,4($18)
lwr	$3,4($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($18)
addiu	$18,$18,16
bne	$18,$7,$L1808
addiu	$5,$5,24

addiu	$16,$sp,32
move	$5,$20
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$21
ori	$8,$2,0xfefe
addiu	$5,$sp,304
move	$6,$21
$L1809:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$17,$5,$L1809
addu	$6,$6,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,40
$L1810:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$18,$L1810
addu	$7,$7,$19

lw	$31,996($sp)
lw	$21,992($sp)
lw	$20,988($sp)
lw	$19,984($sp)
lw	$18,980($sp)
lw	$17,976($sp)
lw	$16,972($sp)
j	$31
addiu	$sp,$sp,1000

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc13_c
.align	2
.ent	put_no_rnd_qpel16_mc33_c
.type	put_no_rnd_qpel16_mc33_c, @function
put_no_rnd_qpel16_mc33_c:
.set	nomips16
.frame	$sp,1000,$31		# vars= 936, regs= 7/0, args= 24, gp= 8
.mask	0x803f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1000
sw	$31,996($sp)
sw	$21,992($sp)
sw	$20,988($sp)
sw	$19,984($sp)
sw	$18,980($sp)
sw	$17,976($sp)
sw	$16,972($sp)
.cprestore	24
addiu	$16,$sp,560
move	$21,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,968
$L1818:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1818
addu	$5,$5,$19

addiu	$20,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
move	$4,$20
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$20
addiu	$5,$sp,561
$L1819:
lwl	$4,3($17)
lwl	$3,3($5)
lwr	$4,0($17)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$3,7($5)
lwr	$4,4($17)
lwr	$3,4($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,16
bne	$17,$16,$L1819
addiu	$5,$5,24

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$18,$sp,296
addiu	$5,$sp,569
addiu	$7,$sp,568
$L1820:
lwl	$4,3($18)
lwl	$3,3($5)
lwr	$4,0($18)
lwr	$3,0($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($18)
lwl	$3,7($5)
lwr	$4,4($18)
lwr	$3,4($5)
xor	$2,$3,$4
and	$2,$2,$6
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($18)
addiu	$18,$18,16
bne	$18,$7,$L1820
addiu	$5,$5,24

addiu	$16,$sp,32
move	$5,$20
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$21
ori	$8,$2,0xfefe
addiu	$5,$sp,304
move	$6,$21
$L1821:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$17,$5,$L1821
addu	$6,$6,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,40
$L1822:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$18,$L1822
addu	$7,$7,$19

lw	$31,996($sp)
lw	$21,992($sp)
lw	$20,988($sp)
lw	$19,984($sp)
lw	$18,980($sp)
lw	$17,976($sp)
lw	$16,972($sp)
j	$31
addiu	$sp,$sp,1000

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc33_c
.align	2
.ent	put_no_rnd_qpel16_mc21_c
.type	put_no_rnd_qpel16_mc21_c, @function
put_no_rnd_qpel16_mc21_c:
.set	nomips16
.frame	$sp,584,$31		# vars= 528, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-584
sw	$31,580($sp)
sw	$19,576($sp)
sw	$18,572($sp)
sw	$17,568($sp)
sw	$16,564($sp)
.cprestore	24
move	$18,$6
addiu	$19,$sp,288
li	$2,17			# 0x11
move	$17,$4
li	$6,16			# 0x10
move	$4,$19
move	$7,$18
addiu	$16,$sp,32
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$19
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$5,$sp,292
move	$6,$17
$L1830:
lwl	$4,-1($5)
lwl	$3,3($16)
lwr	$4,-4($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$3,7($16)
lwr	$4,0($5)
lwr	$3,4($16)
addiu	$16,$16,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$19,$L1830
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,296
addiu	$6,$sp,40
addiu	$8,$sp,552
$L1831:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($17)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($17)
addiu	$6,$6,16
bne	$5,$8,$L1831
addu	$17,$17,$18

lw	$31,580($sp)
lw	$19,576($sp)
lw	$18,572($sp)
lw	$17,568($sp)
lw	$16,564($sp)
j	$31
addiu	$sp,$sp,584

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc21_c
.align	2
.ent	put_no_rnd_pixels16_l2_c
.type	put_no_rnd_pixels16_l2_c, @function
put_no_rnd_pixels16_l2_c:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

lw	$14,16($sp)
blez	$14,$L1842
move	$15,$5

li	$2,-16908288			# 0xfffffffffefe0000
move	$12,$4
ori	$13,$2,0xfefe
move	$9,$5
move	$8,$6
move	$10,$4
move	$11,$0
$L1837:
lwl	$4,3($9)
lwl	$3,3($8)
lwr	$4,0($9)
lwr	$3,0($8)
addiu	$11,$11,1
xor	$2,$3,$4
and	$2,$2,$13
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($10)
lwl	$4,7($9)
lwl	$3,7($8)
lwr	$4,4($9)
lwr	$3,4($8)
slt	$5,$11,$14
xor	$2,$3,$4
and	$2,$2,$13
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($10)
addu	$9,$9,$7
addu	$8,$8,$7
bne	$5,$0,$L1837
addu	$10,$10,$7

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$8,$15,8
addiu	$6,$6,8
ori	$10,$2,0xfefe
move	$9,$0
$L1838:
lwl	$4,3($8)
lwl	$3,3($6)
lwr	$4,0($8)
lwr	$3,0($6)
addiu	$9,$9,1
xor	$2,$3,$4
and	$2,$2,$10
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($12)
lwl	$4,7($8)
lwl	$3,7($6)
lwr	$4,4($8)
lwr	$3,4($6)
slt	$5,$9,$14
xor	$2,$3,$4
and	$2,$2,$10
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($12)
addu	$8,$8,$7
addu	$6,$6,$7
bne	$5,$0,$L1838
addu	$12,$12,$7

$L1842:
j	$31
nop

.set	macro
.set	reorder
.end	put_no_rnd_pixels16_l2_c
.align	2
.ent	put_no_rnd_qpel16_mc10_c
.type	put_no_rnd_qpel16_mc10_c, @function
put_no_rnd_qpel16_mc10_c:
.set	nomips16
.frame	$sp,312,$31		# vars= 256, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-312
sw	$31,308($sp)
sw	$19,304($sp)
sw	$18,300($sp)
sw	$17,296($sp)
sw	$16,292($sp)
.cprestore	24
move	$18,$6
addiu	$16,$sp,32
li	$2,16			# 0x10
move	$17,$4
li	$6,16			# 0x10
move	$7,$18
move	$4,$16
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
move	$19,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
move	$5,$19
move	$6,$17
addiu	$8,$sp,288
$L1844:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$16,$16,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addu	$5,$5,$18
bne	$16,$8,$L1844
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$5,$19,8
ori	$7,$2,0xfefe
addiu	$6,$sp,40
addiu	$8,$sp,296
$L1845:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($17)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$6,$6,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($17)
addu	$5,$5,$18
bne	$6,$8,$L1845
addu	$17,$17,$18

lw	$31,308($sp)
lw	$19,304($sp)
lw	$18,300($sp)
lw	$17,296($sp)
lw	$16,292($sp)
j	$31
addiu	$sp,$sp,312

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc10_c
.align	2
.ent	put_no_rnd_qpel16_mc30_c
.type	put_no_rnd_qpel16_mc30_c, @function
put_no_rnd_qpel16_mc30_c:
.set	nomips16
.frame	$sp,312,$31		# vars= 256, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-312
sw	$31,308($sp)
sw	$19,304($sp)
sw	$18,300($sp)
sw	$17,296($sp)
sw	$16,292($sp)
.cprestore	24
move	$18,$6
addiu	$16,$sp,32
li	$2,16			# 0x10
move	$17,$4
li	$6,16			# 0x10
move	$7,$18
move	$4,$16
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
move	$19,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$5,$19,1
move	$6,$17
addiu	$8,$sp,288
$L1850:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$16,$16,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addu	$5,$5,$18
bne	$16,$8,$L1850
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$5,$19,9
ori	$7,$2,0xfefe
addiu	$6,$sp,40
addiu	$8,$sp,296
$L1851:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($17)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$6,$6,16
xor	$2,$3,$4
and	$2,$2,$7
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($17)
addu	$5,$5,$18
bne	$6,$8,$L1851
addu	$17,$17,$18

lw	$31,308($sp)
lw	$19,304($sp)
lw	$18,300($sp)
lw	$17,296($sp)
lw	$16,292($sp)
j	$31
addiu	$sp,$sp,312

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc30_c
.align	2
.ent	put_no_rnd_qpel16_mc01_c
.type	put_no_rnd_qpel16_mc01_c, @function
put_no_rnd_qpel16_mc01_c:
.set	nomips16
.frame	$sp,712,$31		# vars= 664, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-712
sw	$31,708($sp)
sw	$19,704($sp)
sw	$18,700($sp)
sw	$17,696($sp)
sw	$16,692($sp)
.cprestore	16
addiu	$18,$sp,280
move	$19,$4
move	$17,$6
move	$4,$18
addiu	$6,$sp,688
$L1856:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1856
addu	$5,$5,$17

addiu	$16,$sp,24
move	$5,$18
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$7,$19
move	$5,$18
ori	$8,$2,0xfefe
move	$6,$19
addiu	$9,$sp,664
$L1857:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,24
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$5,$9,$L1857
addu	$6,$6,$17

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,288
addiu	$6,$sp,32
addiu	$9,$sp,672
$L1858:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,24
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L1858
addu	$7,$7,$17

lw	$31,708($sp)
lw	$19,704($sp)
lw	$18,700($sp)
lw	$17,696($sp)
lw	$16,692($sp)
j	$31
addiu	$sp,$sp,712

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc01_c
.align	2
.ent	put_no_rnd_qpel16_mc03_c
.type	put_no_rnd_qpel16_mc03_c, @function
put_no_rnd_qpel16_mc03_c:
.set	nomips16
.frame	$sp,712,$31		# vars= 664, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-712
sw	$31,708($sp)
sw	$19,704($sp)
sw	$18,700($sp)
sw	$17,696($sp)
sw	$16,692($sp)
.cprestore	16
addiu	$7,$sp,280
move	$19,$4
move	$17,$6
move	$4,$7
addiu	$18,$sp,688
$L1864:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$18,$L1864
addu	$5,$5,$17

addiu	$16,$sp,24
move	$5,$7
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$5,$sp,304
move	$6,$19
$L1865:
lwl	$4,3($5)
lwl	$3,3($16)
lwr	$4,0($5)
lwr	$3,0($16)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$3,7($16)
lwr	$4,4($5)
lwr	$3,4($16)
addiu	$5,$5,24
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$5,$18,$L1865
addu	$6,$6,$17

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,32
addiu	$9,$sp,696
$L1866:
lwl	$4,3($5)
lwl	$3,3($6)
lwr	$4,0($5)
lwr	$3,0($6)
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$3,7($6)
lwr	$4,4($5)
lwr	$3,4($6)
addiu	$5,$5,24
xor	$2,$3,$4
and	$2,$2,$8
and	$3,$3,$4
srl	$2,$2,1
addu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L1866
addu	$7,$7,$17

lw	$31,708($sp)
lw	$19,704($sp)
lw	$18,700($sp)
lw	$17,696($sp)
lw	$16,692($sp)
j	$31
addiu	$sp,$sp,712

.set	macro
.set	reorder
.end	put_no_rnd_qpel16_mc03_c
.align	2
.globl	ff_avg_qpel8_mc11_old_c
.ent	ff_avg_qpel8_mc11_old_c
.type	ff_avg_qpel8_mc11_old_c, @function
ff_avg_qpel8_mc11_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$18,$sp,232
move	$20,$4
move	$19,$6
move	$4,$18
addiu	$6,$sp,376
$L1872:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1872
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$4,$17
move	$5,$18
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

move	$5,$18
addiu	$4,$sp,32
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$11,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$9,$18
move	$13,$20
ori	$15,$3,0xf0f
ori	$14,$2,0xfefe
addiu	$10,$sp,164
addiu	$8,$sp,36
addiu	$18,$sp,360
$L1873:
lwl	$5,3($9)
lwl	$3,-1($10)
lwr	$5,0($9)
lwr	$3,-4($10)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($13)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$14
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($13)
lwl	$5,7($9)
lwl	$3,3($10)
lwr	$5,4($9)
lwr	$3,0($10)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($13)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$14
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$9,$9,16
sw	$3,4($13)
addiu	$16,$16,8
addu	$13,$13,$19
addiu	$10,$10,8
bne	$9,$18,$L1873
addiu	$8,$8,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_avg_qpel8_mc11_old_c
.align	2
.globl	ff_avg_qpel8_mc31_old_c
.ent	ff_avg_qpel8_mc31_old_c
.type	ff_avg_qpel8_mc31_old_c, @function
ff_avg_qpel8_mc31_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$7,$sp,232
move	$20,$4
move	$19,$6
move	$4,$7
addiu	$6,$sp,376
$L1878:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1878
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
addiu	$18,$sp,233
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
move	$5,$18
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$11,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$10,$3,0x303
ori	$15,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$12,$20
ori	$14,$3,0xf0f
ori	$13,$2,0xfefe
addiu	$9,$sp,164
addiu	$8,$sp,36
addiu	$17,$sp,361
$L1879:
lwl	$5,3($18)
lwl	$3,-1($9)
lwr	$5,0($18)
lwr	$3,-4($9)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$2,$3,$10
and	$4,$5,$10
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$15
and	$2,$6,$10
and	$3,$3,$11
and	$5,$5,$11
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$10
srl	$3,$3,2
and	$6,$6,$11
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$11
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($12)
addu	$3,$3,$7
and	$4,$4,$14
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$13
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($12)
lwl	$5,7($18)
lwl	$3,3($9)
lwr	$5,4($18)
lwr	$3,0($9)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$2,$3,$10
and	$4,$5,$10
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$15
and	$2,$6,$10
and	$3,$3,$11
and	$5,$5,$11
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$10
srl	$3,$3,2
and	$6,$6,$11
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$11
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($12)
addu	$3,$3,$7
and	$4,$4,$14
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$13
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$18,$18,16
sw	$3,4($12)
addiu	$16,$16,8
addu	$12,$12,$19
addiu	$9,$9,8
bne	$18,$17,$L1879
addiu	$8,$8,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_avg_qpel8_mc31_old_c
.align	2
.globl	ff_avg_qpel8_mc13_old_c
.ent	ff_avg_qpel8_mc13_old_c
.type	ff_avg_qpel8_mc13_old_c, @function
ff_avg_qpel8_mc13_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$20,392($sp)
sw	$19,388($sp)
sw	$18,384($sp)
sw	$17,380($sp)
sw	$16,376($sp)
.cprestore	24
addiu	$16,$sp,232
move	$20,$4
move	$19,$6
move	$4,$16
addiu	$18,$sp,376
$L1884:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$18,$L1884
addu	$5,$5,$19

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$4,$17
move	$5,$16
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,8			# 0x8
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
addiu	$16,$sp,96

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$11,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$13,$20
ori	$15,$3,0xf0f
ori	$14,$2,0xfefe
addiu	$8,$sp,248
addiu	$10,$sp,168
addiu	$9,$sp,36
$L1885:
lwl	$5,3($8)
lwl	$3,3($10)
lwr	$5,0($8)
lwr	$3,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($13)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$14
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($13)
lwl	$5,7($8)
lwl	$3,7($10)
lwr	$5,4($8)
lwr	$3,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($13)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$14
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,16
sw	$3,4($13)
addiu	$10,$10,8
addiu	$16,$16,8
addu	$13,$13,$19
bne	$8,$18,$L1885
addiu	$9,$9,8

lw	$31,396($sp)
lw	$20,392($sp)
lw	$19,388($sp)
lw	$18,384($sp)
lw	$17,380($sp)
lw	$16,376($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_avg_qpel8_mc13_old_c
.align	2
.globl	ff_avg_qpel8_mc33_old_c
.ent	ff_avg_qpel8_mc33_old_c
.type	ff_avg_qpel8_mc33_old_c, @function
ff_avg_qpel8_mc33_old_c:
.set	nomips16
.frame	$sp,400,$31		# vars= 344, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-400
sw	$31,396($sp)
sw	$19,392($sp)
sw	$18,388($sp)
sw	$17,384($sp)
sw	$16,380($sp)
.cprestore	24
addiu	$7,$sp,232
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,376
$L1890:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lbu	$2,8($5)
sb	$2,8($4)
addiu	$4,$4,16
bne	$4,$6,$L1890
addu	$5,$5,$18

addiu	$17,$sp,160
li	$2,9			# 0x9
move	$5,$7
move	$4,$17
li	$6,8			# 0x8
li	$7,16			# 0x10
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel8_h_lowpass
.option	pic2
addiu	$16,$sp,96

addiu	$4,$sp,32
addiu	$5,$sp,233
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,16			# 0x10

move	$5,$17
move	$4,$16
li	$6,8			# 0x8
.option	pic0
jal	put_mpeg4_qpel8_v_lowpass
.option	pic2
li	$7,8			# 0x8

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$11,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$13,$19
ori	$15,$3,0xf0f
ori	$14,$2,0xfefe
addiu	$8,$sp,249
addiu	$10,$sp,168
addiu	$9,$sp,36
addiu	$24,$sp,377
$L1891:
lwl	$5,3($8)
lwl	$3,3($10)
lwr	$5,0($8)
lwr	$3,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($13)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$14
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($13)
lwl	$5,7($8)
lwl	$3,7($10)
lwr	$5,4($8)
lwr	$3,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($13)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$14
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,16
sw	$3,4($13)
addiu	$10,$10,8
addiu	$16,$16,8
addu	$13,$13,$18
bne	$8,$24,$L1891
addiu	$9,$9,8

lw	$31,396($sp)
lw	$19,392($sp)
lw	$18,388($sp)
lw	$17,384($sp)
lw	$16,380($sp)
j	$31
addiu	$sp,$sp,400

.set	macro
.set	reorder
.end	ff_avg_qpel8_mc33_old_c
.align	2
.globl	ff_avg_qpel16_mc33_old_c
.ent	ff_avg_qpel16_mc33_old_c
.type	ff_avg_qpel16_mc33_old_c, @function
ff_avg_qpel16_mc33_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$7,$sp,816
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,1224
$L1896:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1896
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$17
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
addiu	$5,$sp,817
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$12,$3,0x303
ori	$24,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$14,$19
ori	$17,$3,0xf0f
ori	$15,$2,0xfefe
addiu	$8,$sp,841
addiu	$10,$sp,560
addiu	$9,$sp,36
move	$11,$19
addiu	$25,$sp,1225
$L1897:
lwl	$5,3($8)
lwl	$3,3($10)
lwr	$5,0($8)
lwr	$3,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$24
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($11)
addu	$3,$3,$7
and	$4,$4,$17
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($11)
lwl	$5,7($8)
lwl	$3,7($10)
lwr	$5,4($8)
lwr	$3,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$24
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($11)
addu	$3,$3,$7
and	$4,$4,$17
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,24
sw	$3,4($11)
addiu	$10,$10,16
addiu	$16,$16,16
addu	$11,$11,$18
bne	$8,$25,$L1897
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$12,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
ori	$16,$3,0xf0f
ori	$15,$2,0xfefe
addiu	$8,$sp,849
addiu	$11,$sp,568
addiu	$10,$sp,40
addiu	$9,$sp,296
addiu	$24,$sp,1233
$L1898:
lwl	$5,3($8)
lwl	$3,3($11)
lwr	$5,0($8)
lwr	$3,0($11)
lwl	$6,3($10)
lwl	$7,3($9)
lwr	$6,0($10)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,0($9)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,8($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,8($14)
lwl	$5,7($8)
lwl	$3,7($11)
lwr	$5,4($8)
lwr	$3,4($11)
lwl	$6,7($10)
lwl	$7,7($9)
lwr	$6,4($10)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,4($9)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,12($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,24
sw	$3,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addiu	$9,$9,16
bne	$8,$24,$L1898
addu	$14,$14,$18

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_avg_qpel16_mc33_old_c
.align	2
.globl	ff_put_no_rnd_qpel16_mc33_old_c
.ent	ff_put_no_rnd_qpel16_mc33_old_c
.type	ff_put_no_rnd_qpel16_mc33_old_c, @function
ff_put_no_rnd_qpel16_mc33_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$7,$sp,816
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,1224
$L1904:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1904
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$17
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
addiu	$5,$sp,817
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$14,$19
ori	$17,$2,0x101
ori	$15,$3,0xf0f
addiu	$8,$sp,841
addiu	$10,$sp,560
addiu	$9,$sp,36
move	$13,$19
addiu	$24,$sp,1225
$L1905:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,4($13)
addiu	$10,$10,16
addiu	$16,$16,16
addu	$13,$13,$18
bne	$8,$24,$L1905
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x101
ori	$15,$3,0xf0f
addiu	$8,$sp,849
addiu	$11,$sp,568
addiu	$10,$sp,40
addiu	$9,$sp,296
addiu	$17,$sp,1233
$L1906:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,3($10)
lwl	$7,3($9)
lwr	$6,0($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,7($10)
lwl	$7,7($9)
lwr	$6,4($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addiu	$9,$9,16
bne	$8,$17,$L1906
addu	$14,$14,$18

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel16_mc33_old_c
.align	2
.globl	ff_put_qpel16_mc11_old_c
.ent	ff_put_qpel16_mc11_old_c
.type	ff_put_qpel16_mc11_old_c, @function
ff_put_qpel16_mc11_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$19,$sp,816
move	$20,$4
move	$18,$6
move	$4,$19
addiu	$6,$sp,1224
$L1912:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1912
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$4,$17
move	$5,$19
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$19
addiu	$4,$sp,32
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$8,$19
move	$14,$20
ori	$17,$2,0x202
ori	$15,$3,0xf0f
addiu	$10,$sp,548
addiu	$9,$sp,36
move	$13,$20
addiu	$19,$sp,1200
$L1913:
lwl	$5,3($8)
lwl	$2,-1($10)
lwr	$5,0($8)
lwr	$2,-4($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,3($10)
lwr	$5,4($8)
lwr	$2,0($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,4($13)
addiu	$16,$16,16
addu	$13,$13,$18
addiu	$10,$10,16
bne	$8,$19,$L1913
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x202
ori	$15,$3,0xf0f
addiu	$8,$sp,824
addiu	$11,$sp,552
addiu	$10,$sp,296
addiu	$9,$sp,44
addiu	$17,$sp,1208
$L1914:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,-1($9)
lwl	$7,3($10)
lwr	$6,-4($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,3($9)
lwl	$7,7($10)
lwr	$6,0($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addu	$14,$14,$18
bne	$8,$17,$L1914
addiu	$9,$9,16

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_qpel16_mc11_old_c
.align	2
.ent	avg_qpel16_mc10_c
.type	avg_qpel16_mc10_c, @function
avg_qpel16_mc10_c:
.set	nomips16
.frame	$sp,312,$31		# vars= 256, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-312
sw	$31,308($sp)
sw	$19,304($sp)
sw	$18,300($sp)
sw	$17,296($sp)
sw	$16,292($sp)
.cprestore	24
move	$18,$6
addiu	$16,$sp,32
li	$2,16			# 0x10
move	$17,$4
li	$6,16			# 0x10
move	$7,$18
move	$4,$16
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
move	$19,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$8,$2,0xfefe
move	$6,$19
move	$7,$17
addiu	$9,$sp,288
$L1920:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,16
sw	$4,4($7)
addu	$6,$6,$18
bne	$16,$9,$L1920
addu	$7,$7,$18

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$7,$19,8
ori	$8,$2,0xfefe
addiu	$6,$sp,40
addiu	$9,$sp,296
$L1921:
lwl	$4,3($7)
lwl	$2,3($6)
lwr	$4,0($7)
lwr	$2,0($6)
lw	$5,8($17)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($17)
lwl	$3,7($7)
lwl	$4,7($6)
lwr	$3,4($7)
lwr	$4,4($6)
lw	$5,12($17)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,12($17)
addu	$7,$7,$18
bne	$6,$9,$L1921
addu	$17,$17,$18

lw	$31,308($sp)
lw	$19,304($sp)
lw	$18,300($sp)
lw	$17,296($sp)
lw	$16,292($sp)
j	$31
addiu	$sp,$sp,312

.set	macro
.set	reorder
.end	avg_qpel16_mc10_c
.align	2
.ent	avg_qpel16_mc30_c
.type	avg_qpel16_mc30_c, @function
avg_qpel16_mc30_c:
.set	nomips16
.frame	$sp,312,$31		# vars= 256, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-312
sw	$31,308($sp)
sw	$19,304($sp)
sw	$18,300($sp)
sw	$17,296($sp)
sw	$16,292($sp)
.cprestore	24
move	$18,$6
addiu	$16,$sp,32
li	$2,16			# 0x10
move	$17,$4
li	$6,16			# 0x10
move	$7,$18
move	$4,$16
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
move	$19,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$8,$2,0xfefe
addiu	$6,$19,1
move	$7,$17
addiu	$9,$sp,288
$L1926:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,16
sw	$4,4($7)
addu	$6,$6,$18
bne	$16,$9,$L1926
addu	$7,$7,$18

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$7,$19,9
ori	$8,$2,0xfefe
addiu	$6,$sp,40
addiu	$9,$sp,296
$L1927:
lwl	$4,3($7)
lwl	$2,3($6)
lwr	$4,0($7)
lwr	$2,0($6)
lw	$5,8($17)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($17)
lwl	$3,7($7)
lwl	$4,7($6)
lwr	$3,4($7)
lwr	$4,4($6)
lw	$5,12($17)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,12($17)
addu	$7,$7,$18
bne	$6,$9,$L1927
addu	$17,$17,$18

lw	$31,308($sp)
lw	$19,304($sp)
lw	$18,300($sp)
lw	$17,296($sp)
lw	$16,292($sp)
j	$31
addiu	$sp,$sp,312

.set	macro
.set	reorder
.end	avg_qpel16_mc30_c
.align	2
.globl	ff_put_qpel16_mc12_old_c
.ent	ff_put_qpel16_mc12_old_c
.type	ff_put_qpel16_mc12_old_c, @function
ff_put_qpel16_mc12_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$16,$sp,816
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,1224
$L1932:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1932
addu	$5,$5,$17

addiu	$18,$sp,544
li	$2,17			# 0x11
move	$5,$16
move	$4,$18
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$18
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$5,$sp,36
move	$6,$19
$L1933:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$18,$L1933
addu	$6,$6,$17

addiu	$9,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,40
move	$6,$9
$L1934:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L1934
addu	$7,$7,$17

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_qpel16_mc12_old_c
.align	2
.ent	put_qpel16_mc12_c
.type	put_qpel16_mc12_c, @function
put_qpel16_mc12_c:
.set	nomips16
.frame	$sp,736,$31		# vars= 680, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-736
sw	$31,732($sp)
sw	$19,728($sp)
sw	$18,724($sp)
sw	$17,720($sp)
sw	$16,716($sp)
.cprestore	24
addiu	$16,$sp,304
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,712
$L1940:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1940
addu	$5,$5,$17

addiu	$18,$sp,32
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$18
move	$6,$16
$L1941:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1941
addiu	$6,$6,24

addiu	$8,$sp,312
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,40
move	$6,$8
$L1942:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1942
addiu	$6,$6,24

move	$4,$19
move	$5,$18
move	$6,$17
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,732($sp)
lw	$28,24($sp)
lw	$19,728($sp)
lw	$18,724($sp)
lw	$17,720($sp)
lw	$16,716($sp)
j	$31
addiu	$sp,$sp,736

.set	macro
.set	reorder
.end	put_qpel16_mc12_c
.align	2
.globl	ff_put_qpel16_mc32_old_c
.ent	ff_put_qpel16_mc32_old_c
.type	ff_put_qpel16_mc32_old_c, @function
ff_put_qpel16_mc32_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$7,$sp,816
move	$19,$4
move	$17,$6
move	$4,$7
addiu	$6,$sp,1224
$L1948:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1948
addu	$5,$5,$17

addiu	$18,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$18
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
addiu	$5,$sp,817
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$18
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$5,$sp,36
move	$6,$19
$L1949:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$18,$L1949
addu	$6,$6,$17

addiu	$9,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,40
move	$6,$9
$L1950:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L1950
addu	$7,$7,$17

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_qpel16_mc32_old_c
.align	2
.ent	put_qpel16_mc32_c
.type	put_qpel16_mc32_c, @function
put_qpel16_mc32_c:
.set	nomips16
.frame	$sp,736,$31		# vars= 680, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-736
sw	$31,732($sp)
sw	$19,728($sp)
sw	$18,724($sp)
sw	$17,720($sp)
sw	$16,716($sp)
.cprestore	24
addiu	$16,$sp,304
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,712
$L1956:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1956
addu	$5,$5,$17

addiu	$18,$sp,32
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$18
addiu	$6,$sp,305
$L1957:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1957
addiu	$6,$6,24

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,40
addiu	$6,$sp,313
addiu	$8,$sp,312
$L1958:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1958
addiu	$6,$6,24

move	$4,$19
move	$5,$18
move	$6,$17
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,732($sp)
lw	$28,24($sp)
lw	$19,728($sp)
lw	$18,724($sp)
lw	$17,720($sp)
lw	$16,716($sp)
j	$31
addiu	$sp,$sp,736

.set	macro
.set	reorder
.end	put_qpel16_mc32_c
.align	2
.ent	avg_qpel16_mc12_c
.type	avg_qpel16_mc12_c, @function
avg_qpel16_mc12_c:
.set	nomips16
.frame	$sp,736,$31		# vars= 680, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-736
sw	$31,732($sp)
sw	$19,728($sp)
sw	$18,724($sp)
sw	$17,720($sp)
sw	$16,716($sp)
.cprestore	24
addiu	$16,$sp,304
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,712
$L1964:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1964
addu	$5,$5,$17

addiu	$18,$sp,32
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$18
move	$6,$16
$L1965:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1965
addiu	$6,$6,24

addiu	$8,$sp,312
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,40
move	$6,$8
$L1966:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1966
addiu	$6,$6,24

move	$4,$19
move	$5,$18
move	$6,$17
.option	pic0
jal	avg_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,732($sp)
lw	$28,24($sp)
lw	$19,728($sp)
lw	$18,724($sp)
lw	$17,720($sp)
lw	$16,716($sp)
j	$31
addiu	$sp,$sp,736

.set	macro
.set	reorder
.end	avg_qpel16_mc12_c
.align	2
.ent	avg_qpel16_mc32_c
.type	avg_qpel16_mc32_c, @function
avg_qpel16_mc32_c:
.set	nomips16
.frame	$sp,736,$31		# vars= 680, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-736
sw	$31,732($sp)
sw	$19,728($sp)
sw	$18,724($sp)
sw	$17,720($sp)
sw	$16,716($sp)
.cprestore	24
addiu	$16,$sp,304
move	$19,$4
move	$17,$6
move	$4,$16
addiu	$6,$sp,712
$L1972:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1972
addu	$5,$5,$17

addiu	$18,$sp,32
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$18
addiu	$6,$sp,305
$L1973:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L1973
addiu	$6,$6,24

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,40
addiu	$6,$sp,313
addiu	$8,$sp,312
$L1974:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L1974
addiu	$6,$6,24

move	$4,$19
move	$5,$18
move	$6,$17
.option	pic0
jal	avg_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

lw	$31,732($sp)
lw	$28,24($sp)
lw	$19,728($sp)
lw	$18,724($sp)
lw	$17,720($sp)
lw	$16,716($sp)
j	$31
addiu	$sp,$sp,736

.set	macro
.set	reorder
.end	avg_qpel16_mc32_c
.align	2
.ent	put_qpel16_mc10_c
.type	put_qpel16_mc10_c, @function
put_qpel16_mc10_c:
.set	nomips16
.frame	$sp,312,$31		# vars= 256, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-312
sw	$31,308($sp)
sw	$19,304($sp)
sw	$18,300($sp)
sw	$17,296($sp)
sw	$16,292($sp)
.cprestore	24
move	$18,$6
addiu	$16,$sp,32
li	$2,16			# 0x10
move	$17,$4
li	$6,16			# 0x10
move	$7,$18
move	$4,$16
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
move	$19,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
move	$5,$19
move	$6,$17
addiu	$8,$sp,288
$L1980:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$16,$16,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addu	$5,$5,$18
bne	$16,$8,$L1980
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$5,$19,8
ori	$7,$2,0xfefe
addiu	$6,$sp,40
addiu	$8,$sp,296
$L1981:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($17)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$6,$6,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($17)
addu	$5,$5,$18
bne	$6,$8,$L1981
addu	$17,$17,$18

lw	$31,308($sp)
lw	$19,304($sp)
lw	$18,300($sp)
lw	$17,296($sp)
lw	$16,292($sp)
j	$31
addiu	$sp,$sp,312

.set	macro
.set	reorder
.end	put_qpel16_mc10_c
.align	2
.ent	put_qpel16_mc30_c
.type	put_qpel16_mc30_c, @function
put_qpel16_mc30_c:
.set	nomips16
.frame	$sp,312,$31		# vars= 256, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-312
sw	$31,308($sp)
sw	$19,304($sp)
sw	$18,300($sp)
sw	$17,296($sp)
sw	$16,292($sp)
.cprestore	24
move	$18,$6
addiu	$16,$sp,32
li	$2,16			# 0x10
move	$17,$4
li	$6,16			# 0x10
move	$7,$18
move	$4,$16
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
move	$19,$5

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$5,$19,1
move	$6,$17
addiu	$8,$sp,288
$L1986:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$16,$16,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addu	$5,$5,$18
bne	$16,$8,$L1986
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
addiu	$5,$19,9
ori	$7,$2,0xfefe
addiu	$6,$sp,40
addiu	$8,$sp,296
$L1987:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($17)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$6,$6,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($17)
addu	$5,$5,$18
bne	$6,$8,$L1987
addu	$17,$17,$18

lw	$31,308($sp)
lw	$19,304($sp)
lw	$18,300($sp)
lw	$17,296($sp)
lw	$16,292($sp)
j	$31
addiu	$sp,$sp,312

.set	macro
.set	reorder
.end	put_qpel16_mc30_c
.align	2
.ent	put_qpel16_mc01_c
.type	put_qpel16_mc01_c, @function
put_qpel16_mc01_c:
.set	nomips16
.frame	$sp,712,$31		# vars= 664, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-712
sw	$31,708($sp)
sw	$19,704($sp)
sw	$18,700($sp)
sw	$17,696($sp)
sw	$16,692($sp)
.cprestore	16
addiu	$18,$sp,280
move	$19,$4
move	$17,$6
move	$4,$18
addiu	$6,$sp,688
$L1992:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L1992
addu	$5,$5,$17

addiu	$16,$sp,24
move	$5,$18
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$7,$19
move	$5,$18
ori	$8,$2,0xfefe
move	$6,$19
addiu	$9,$sp,664
$L1993:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,24
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$5,$9,$L1993
addu	$6,$6,$17

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,288
addiu	$6,$sp,32
addiu	$9,$sp,672
$L1994:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,24
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L1994
addu	$7,$7,$17

lw	$31,708($sp)
lw	$19,704($sp)
lw	$18,700($sp)
lw	$17,696($sp)
lw	$16,692($sp)
j	$31
addiu	$sp,$sp,712

.set	macro
.set	reorder
.end	put_qpel16_mc01_c
.align	2
.ent	put_qpel16_mc03_c
.type	put_qpel16_mc03_c, @function
put_qpel16_mc03_c:
.set	nomips16
.frame	$sp,712,$31		# vars= 664, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-712
sw	$31,708($sp)
sw	$19,704($sp)
sw	$18,700($sp)
sw	$17,696($sp)
sw	$16,692($sp)
.cprestore	16
addiu	$7,$sp,280
move	$19,$4
move	$17,$6
move	$4,$7
addiu	$18,$sp,688
$L2000:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$18,$L2000
addu	$5,$5,$17

addiu	$16,$sp,24
move	$5,$7
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$7,$19
ori	$8,$2,0xfefe
addiu	$5,$sp,304
move	$6,$19
$L2001:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,24
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$5,$18,$L2001
addu	$6,$6,$17

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,32
addiu	$9,$sp,696
$L2002:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,24
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$9,$L2002
addu	$7,$7,$17

lw	$31,708($sp)
lw	$19,704($sp)
lw	$18,700($sp)
lw	$17,696($sp)
lw	$16,692($sp)
j	$31
addiu	$sp,$sp,712

.set	macro
.set	reorder
.end	put_qpel16_mc03_c
.align	2
.ent	put_qpel16_mc11_c
.type	put_qpel16_mc11_c, @function
put_qpel16_mc11_c:
.set	nomips16
.frame	$sp,992,$31		# vars= 936, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-992
sw	$31,988($sp)
sw	$20,984($sp)
sw	$19,980($sp)
sw	$18,976($sp)
sw	$17,972($sp)
sw	$16,968($sp)
.cprestore	24
addiu	$16,$sp,560
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,968
$L2008:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2008
addu	$5,$5,$18

addiu	$19,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$19
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$19
move	$6,$16
$L2009:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L2009
addiu	$6,$6,24

addiu	$17,$sp,296
addiu	$8,$sp,568
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$6,$8
move	$5,$17
$L2010:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L2010
addiu	$6,$6,24

addiu	$16,$sp,32
move	$5,$19
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$20
ori	$8,$2,0xfefe
addiu	$5,$sp,292
move	$6,$20
$L2011:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$19,$L2011
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$5,$sp,40
addiu	$8,$sp,552
$L2012:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
addiu	$17,$17,16
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$5,$5,16
bne	$17,$8,$L2012
addu	$7,$7,$18

lw	$31,988($sp)
lw	$20,984($sp)
lw	$19,980($sp)
lw	$18,976($sp)
lw	$17,972($sp)
lw	$16,968($sp)
j	$31
addiu	$sp,$sp,992

.set	macro
.set	reorder
.end	put_qpel16_mc11_c
.align	2
.ent	put_qpel16_mc31_c
.type	put_qpel16_mc31_c, @function
put_qpel16_mc31_c:
.set	nomips16
.frame	$sp,992,$31		# vars= 936, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-992
sw	$31,988($sp)
sw	$20,984($sp)
sw	$19,980($sp)
sw	$18,976($sp)
sw	$17,972($sp)
sw	$16,968($sp)
.cprestore	24
addiu	$16,$sp,560
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,968
$L2020:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2020
addu	$5,$5,$18

addiu	$19,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$19
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$19
addiu	$6,$sp,561
$L2021:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L2021
addiu	$6,$6,24

addiu	$17,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$6,$sp,569
move	$5,$17
addiu	$8,$sp,568
$L2022:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L2022
addiu	$6,$6,24

addiu	$16,$sp,32
move	$5,$19
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$20
ori	$8,$2,0xfefe
addiu	$5,$sp,292
move	$6,$20
$L2023:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$19,$L2023
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$5,$sp,40
addiu	$8,$sp,552
$L2024:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
addiu	$17,$17,16
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$5,$5,16
bne	$17,$8,$L2024
addu	$7,$7,$18

lw	$31,988($sp)
lw	$20,984($sp)
lw	$19,980($sp)
lw	$18,976($sp)
lw	$17,972($sp)
lw	$16,968($sp)
j	$31
addiu	$sp,$sp,992

.set	macro
.set	reorder
.end	put_qpel16_mc31_c
.align	2
.ent	put_qpel16_mc13_c
.type	put_qpel16_mc13_c, @function
put_qpel16_mc13_c:
.set	nomips16
.frame	$sp,1000,$31		# vars= 936, regs= 7/0, args= 24, gp= 8
.mask	0x803f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1000
sw	$31,996($sp)
sw	$21,992($sp)
sw	$20,988($sp)
sw	$19,984($sp)
sw	$18,980($sp)
sw	$17,976($sp)
sw	$16,972($sp)
.cprestore	24
addiu	$16,$sp,560
move	$21,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,968
$L2032:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2032
addu	$5,$5,$19

addiu	$20,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
move	$4,$20
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$20
move	$5,$16
$L2033:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,16
bne	$17,$16,$L2033
addiu	$5,$5,24

addiu	$7,$sp,568
li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$18,$sp,296
move	$5,$7
$L2034:
lwl	$4,3($18)
lwl	$2,3($5)
lwr	$4,0($18)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($18)
lwl	$2,7($5)
lwr	$4,4($18)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addiu	$18,$18,16
bne	$18,$7,$L2034
addiu	$5,$5,24

addiu	$16,$sp,32
move	$5,$20
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$21
ori	$8,$2,0xfefe
addiu	$5,$sp,304
move	$6,$21
$L2035:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$17,$5,$L2035
addu	$6,$6,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,40
$L2036:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$18,$L2036
addu	$7,$7,$19

lw	$31,996($sp)
lw	$21,992($sp)
lw	$20,988($sp)
lw	$19,984($sp)
lw	$18,980($sp)
lw	$17,976($sp)
lw	$16,972($sp)
j	$31
addiu	$sp,$sp,1000

.set	macro
.set	reorder
.end	put_qpel16_mc13_c
.align	2
.ent	put_qpel16_mc33_c
.type	put_qpel16_mc33_c, @function
put_qpel16_mc33_c:
.set	nomips16
.frame	$sp,1000,$31		# vars= 936, regs= 7/0, args= 24, gp= 8
.mask	0x803f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1000
sw	$31,996($sp)
sw	$21,992($sp)
sw	$20,988($sp)
sw	$19,984($sp)
sw	$18,980($sp)
sw	$17,976($sp)
sw	$16,972($sp)
.cprestore	24
addiu	$16,$sp,560
move	$21,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,968
$L2044:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2044
addu	$5,$5,$19

addiu	$20,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
move	$4,$20
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$20
addiu	$5,$sp,561
$L2045:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,16
bne	$17,$16,$L2045
addiu	$5,$5,24

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$18,$sp,296
addiu	$5,$sp,569
addiu	$7,$sp,568
$L2046:
lwl	$4,3($18)
lwl	$2,3($5)
lwr	$4,0($18)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($18)
lwl	$2,7($5)
lwr	$4,4($18)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addiu	$18,$18,16
bne	$18,$7,$L2046
addiu	$5,$5,24

addiu	$16,$sp,32
move	$5,$20
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$7,$21
ori	$8,$2,0xfefe
addiu	$5,$sp,304
move	$6,$21
$L2047:
lwl	$4,3($5)
lwl	$2,3($16)
lwr	$4,0($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,7($5)
lwl	$2,7($16)
lwr	$4,4($5)
lwr	$2,4($16)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$16,$16,16
bne	$17,$5,$L2047
addu	$6,$6,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$5,$sp,312
addiu	$6,$sp,40
$L2048:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($7)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($7)
addiu	$6,$6,16
bne	$5,$18,$L2048
addu	$7,$7,$19

lw	$31,996($sp)
lw	$21,992($sp)
lw	$20,988($sp)
lw	$19,984($sp)
lw	$18,980($sp)
lw	$17,976($sp)
lw	$16,972($sp)
j	$31
addiu	$sp,$sp,1000

.set	macro
.set	reorder
.end	put_qpel16_mc33_c
.align	2
.ent	put_qpel16_mc21_c
.type	put_qpel16_mc21_c, @function
put_qpel16_mc21_c:
.set	nomips16
.frame	$sp,584,$31		# vars= 528, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-584
sw	$31,580($sp)
sw	$19,576($sp)
sw	$18,572($sp)
sw	$17,568($sp)
sw	$16,564($sp)
.cprestore	24
move	$18,$6
addiu	$19,$sp,288
li	$2,17			# 0x11
move	$17,$4
li	$6,16			# 0x10
move	$4,$19
move	$7,$18
addiu	$16,$sp,32
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$19
li	$6,16			# 0x10
li	$7,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$7,$2,0xfefe
addiu	$5,$sp,292
move	$6,$17
$L2056:
lwl	$4,-1($5)
lwl	$2,3($16)
lwr	$4,-4($5)
lwr	$2,0($16)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($6)
lwl	$4,3($5)
lwl	$2,7($16)
lwr	$4,0($5)
lwr	$2,4($16)
addiu	$16,$16,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($6)
addiu	$5,$5,16
bne	$16,$19,$L2056
addu	$6,$6,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$5,$sp,296
addiu	$6,$sp,40
addiu	$8,$sp,552
$L2057:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,8($17)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
addiu	$5,$5,16
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,12($17)
addiu	$6,$6,16
bne	$5,$8,$L2057
addu	$17,$17,$18

lw	$31,580($sp)
lw	$19,576($sp)
lw	$18,572($sp)
lw	$17,568($sp)
lw	$16,564($sp)
j	$31
addiu	$sp,$sp,584

.set	macro
.set	reorder
.end	put_qpel16_mc21_c
.align	2
.ent	avg_qpel16_mc01_c
.type	avg_qpel16_mc01_c, @function
avg_qpel16_mc01_c:
.set	nomips16
.frame	$sp,712,$31		# vars= 664, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-712
sw	$31,708($sp)
sw	$19,704($sp)
sw	$18,700($sp)
sw	$17,696($sp)
sw	$16,692($sp)
.cprestore	16
addiu	$18,$sp,280
move	$19,$4
move	$17,$6
move	$4,$18
addiu	$6,$sp,688
$L2062:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2062
addu	$5,$5,$17

addiu	$16,$sp,24
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$5,$18

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$8,$19
move	$6,$18
ori	$9,$2,0xfefe
move	$7,$19
addiu	$10,$sp,664
$L2063:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,24
sw	$4,4($7)
addiu	$16,$16,16
bne	$6,$10,$L2063
addu	$7,$7,$17

li	$2,-16908288			# 0xfffffffffefe0000
ori	$9,$2,0xfefe
addiu	$6,$sp,288
addiu	$7,$sp,32
addiu	$10,$sp,672
$L2064:
lwl	$4,3($6)
lwl	$2,3($7)
lwr	$4,0($6)
lwr	$2,0($7)
lw	$5,8($8)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($8)
lwl	$3,7($6)
lwl	$4,7($7)
lwr	$3,4($6)
lwr	$4,4($7)
lw	$5,12($8)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,24
sw	$4,12($8)
addiu	$7,$7,16
bne	$6,$10,$L2064
addu	$8,$8,$17

lw	$31,708($sp)
lw	$19,704($sp)
lw	$18,700($sp)
lw	$17,696($sp)
lw	$16,692($sp)
j	$31
addiu	$sp,$sp,712

.set	macro
.set	reorder
.end	avg_qpel16_mc01_c
.align	2
.globl	ff_avg_qpel16_mc11_old_c
.ent	ff_avg_qpel16_mc11_old_c
.type	ff_avg_qpel16_mc11_old_c, @function
ff_avg_qpel16_mc11_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$19,$sp,816
move	$20,$4
move	$18,$6
move	$4,$19
addiu	$6,$sp,1224
$L2070:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2070
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$4,$17
move	$5,$19
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$19
addiu	$4,$sp,32
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$12,$3,0x303
ori	$24,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$8,$19
move	$14,$20
ori	$17,$3,0xf0f
ori	$15,$2,0xfefe
addiu	$10,$sp,548
addiu	$9,$sp,36
move	$11,$20
addiu	$19,$sp,1200
$L2071:
lwl	$5,3($8)
lwl	$3,-1($10)
lwr	$5,0($8)
lwr	$3,-4($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$24
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($11)
addu	$3,$3,$7
and	$4,$4,$17
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($11)
lwl	$5,7($8)
lwl	$3,3($10)
lwr	$5,4($8)
lwr	$3,0($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$24
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($11)
addu	$3,$3,$7
and	$4,$4,$17
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,24
sw	$3,4($11)
addiu	$16,$16,16
addu	$11,$11,$18
addiu	$10,$10,16
bne	$8,$19,$L2071
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$12,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
ori	$16,$3,0xf0f
ori	$15,$2,0xfefe
addiu	$8,$sp,824
addiu	$11,$sp,552
addiu	$10,$sp,296
addiu	$9,$sp,44
addiu	$19,$sp,1208
$L2072:
lwl	$5,3($8)
lwl	$3,3($11)
lwr	$5,0($8)
lwr	$3,0($11)
lwl	$6,-1($9)
lwl	$7,3($10)
lwr	$6,-4($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,0($10)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,8($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,8($14)
lwl	$5,7($8)
lwl	$3,7($11)
lwr	$5,4($8)
lwr	$3,4($11)
lwl	$6,3($9)
lwl	$7,7($10)
lwr	$6,0($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,4($10)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,12($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,24
sw	$3,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addu	$14,$14,$18
bne	$8,$19,$L2072
addiu	$9,$9,16

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_avg_qpel16_mc11_old_c
.align	2
.globl	ff_put_no_rnd_qpel16_mc11_old_c
.ent	ff_put_no_rnd_qpel16_mc11_old_c
.type	ff_put_no_rnd_qpel16_mc11_old_c, @function
ff_put_no_rnd_qpel16_mc11_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$19,$sp,816
move	$20,$4
move	$18,$6
move	$4,$19
addiu	$6,$sp,1224
$L2078:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2078
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$4,$17
move	$5,$19
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$19
addiu	$4,$sp,32
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$8,$19
move	$14,$20
ori	$17,$2,0x101
ori	$15,$3,0xf0f
addiu	$10,$sp,548
addiu	$9,$sp,36
move	$13,$20
addiu	$19,$sp,1200
$L2079:
lwl	$5,3($8)
lwl	$2,-1($10)
lwr	$5,0($8)
lwr	$2,-4($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,3($10)
lwr	$5,4($8)
lwr	$2,0($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,4($13)
addiu	$16,$16,16
addu	$13,$13,$18
addiu	$10,$10,16
bne	$8,$19,$L2079
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x101
ori	$15,$3,0xf0f
addiu	$8,$sp,824
addiu	$11,$sp,552
addiu	$10,$sp,296
addiu	$9,$sp,44
addiu	$17,$sp,1208
$L2080:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,-1($9)
lwl	$7,3($10)
lwr	$6,-4($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,3($9)
lwl	$7,7($10)
lwr	$6,0($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addu	$14,$14,$18
bne	$8,$17,$L2080
addiu	$9,$9,16

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel16_mc11_old_c
.align	2
.globl	ff_put_qpel16_mc33_old_c
.ent	ff_put_qpel16_mc33_old_c
.type	ff_put_qpel16_mc33_old_c, @function
ff_put_qpel16_mc33_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$19,1240($sp)
sw	$18,1236($sp)
sw	$17,1232($sp)
sw	$16,1228($sp)
.cprestore	24
addiu	$7,$sp,816
move	$19,$4
move	$18,$6
move	$4,$7
addiu	$6,$sp,1224
$L2086:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2086
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$17
li	$6,16			# 0x10
li	$7,24			# 0x18
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
addiu	$5,$sp,817
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
ori	$11,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$14,$19
ori	$17,$2,0x202
ori	$15,$3,0xf0f
addiu	$8,$sp,841
addiu	$10,$sp,560
addiu	$9,$sp,36
move	$13,$19
addiu	$24,$sp,1225
$L2087:
lwl	$5,3($8)
lwl	$2,3($10)
lwr	$5,0($8)
lwr	$2,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$11
srl	$2,$2,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,0($13)
lwl	$5,7($8)
lwl	$2,7($10)
lwr	$5,4($8)
lwr	$2,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$3,$2,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$17
and	$3,$6,$11
and	$2,$2,$12
and	$5,$5,$12
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$11
srl	$5,$5,2
and	$6,$6,$12
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$12
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,4($13)
addiu	$10,$10,16
addiu	$16,$16,16
addu	$13,$13,$18
bne	$8,$24,$L2087
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x202
ori	$15,$3,0xf0f
addiu	$8,$sp,849
addiu	$11,$sp,568
addiu	$10,$sp,40
addiu	$9,$sp,296
addiu	$17,$sp,1233
$L2088:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,3($10)
lwl	$7,3($9)
lwr	$6,0($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,7($10)
lwl	$7,7($9)
lwr	$6,4($10)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($9)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addiu	$9,$9,16
bne	$8,$17,$L2088
addu	$14,$14,$18

lw	$31,1244($sp)
lw	$19,1240($sp)
lw	$18,1236($sp)
lw	$17,1232($sp)
lw	$16,1228($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_qpel16_mc33_old_c
.align	2
.ent	avg_qpel16_mc03_c
.type	avg_qpel16_mc03_c, @function
avg_qpel16_mc03_c:
.set	nomips16
.frame	$sp,712,$31		# vars= 664, regs= 5/0, args= 16, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-712
sw	$31,708($sp)
sw	$19,704($sp)
sw	$18,700($sp)
sw	$17,696($sp)
sw	$16,692($sp)
.cprestore	16
addiu	$7,$sp,280
move	$19,$4
move	$17,$6
move	$4,$7
addiu	$18,$sp,688
$L2094:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$18,$L2094
addu	$5,$5,$17

addiu	$16,$sp,24
move	$5,$7
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,16($sp)
move	$8,$19
ori	$9,$2,0xfefe
addiu	$6,$sp,304
move	$7,$19
$L2095:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,24
sw	$4,4($7)
addiu	$16,$16,16
bne	$6,$18,$L2095
addu	$7,$7,$17

li	$2,-16908288			# 0xfffffffffefe0000
ori	$9,$2,0xfefe
addiu	$6,$sp,312
addiu	$7,$sp,32
addiu	$10,$sp,696
$L2096:
lwl	$4,3($6)
lwl	$2,3($7)
lwr	$4,0($6)
lwr	$2,0($7)
lw	$5,8($8)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($8)
lwl	$3,7($6)
lwl	$4,7($7)
lwr	$3,4($6)
lwr	$4,4($7)
lw	$5,12($8)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,24
sw	$4,12($8)
addiu	$7,$7,16
bne	$6,$10,$L2096
addu	$8,$8,$17

lw	$31,708($sp)
lw	$19,704($sp)
lw	$18,700($sp)
lw	$17,696($sp)
lw	$16,692($sp)
j	$31
addiu	$sp,$sp,712

.set	macro
.set	reorder
.end	avg_qpel16_mc03_c
.align	2
.ent	avg_qpel16_mc13_c
.type	avg_qpel16_mc13_c, @function
avg_qpel16_mc13_c:
.set	nomips16
.frame	$sp,1000,$31		# vars= 936, regs= 7/0, args= 24, gp= 8
.mask	0x803f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1000
sw	$31,996($sp)
sw	$21,992($sp)
sw	$20,988($sp)
sw	$19,984($sp)
sw	$18,980($sp)
sw	$17,976($sp)
sw	$16,972($sp)
.cprestore	24
addiu	$16,$sp,560
move	$21,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,968
$L2102:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2102
addu	$5,$5,$19

addiu	$20,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
move	$4,$20
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$20
move	$5,$16
$L2103:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,16
bne	$17,$16,$L2103
addiu	$5,$5,24

addiu	$7,$sp,568
li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$18,$sp,296
move	$5,$7
$L2104:
lwl	$4,3($18)
lwl	$2,3($5)
lwr	$4,0($18)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($18)
lwl	$2,7($5)
lwr	$4,4($18)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addiu	$18,$18,16
bne	$18,$7,$L2104
addiu	$5,$5,24

addiu	$16,$sp,32
li	$6,16			# 0x10
li	$7,16			# 0x10
move	$5,$20
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$8,$21
ori	$9,$2,0xfefe
addiu	$6,$sp,304
move	$7,$21
$L2105:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,4($7)
addiu	$16,$16,16
bne	$17,$6,$L2105
addu	$7,$7,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$9,$2,0xfefe
addiu	$6,$sp,312
addiu	$7,$sp,40
$L2106:
lwl	$4,3($6)
lwl	$2,3($7)
lwr	$4,0($6)
lwr	$2,0($7)
lw	$5,8($8)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($8)
lwl	$3,7($6)
lwl	$4,7($7)
lwr	$3,4($6)
lwr	$4,4($7)
lw	$5,12($8)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,12($8)
addiu	$7,$7,16
bne	$6,$18,$L2106
addu	$8,$8,$19

lw	$31,996($sp)
lw	$21,992($sp)
lw	$20,988($sp)
lw	$19,984($sp)
lw	$18,980($sp)
lw	$17,976($sp)
lw	$16,972($sp)
j	$31
addiu	$sp,$sp,1000

.set	macro
.set	reorder
.end	avg_qpel16_mc13_c
.align	2
.globl	ff_put_qpel16_mc31_old_c
.ent	ff_put_qpel16_mc31_old_c
.type	ff_put_qpel16_mc31_old_c, @function
ff_put_qpel16_mc31_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$7,$sp,816
move	$20,$4
move	$19,$6
move	$4,$7
addiu	$6,$sp,1224
$L2114:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2114
addu	$5,$5,$19

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$17
li	$6,16			# 0x10
li	$7,24			# 0x18
addiu	$18,$sp,817
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
move	$5,$18
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$11,$2,0xfcfc
ori	$10,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$14,$20
ori	$15,$2,0x202
ori	$13,$3,0xf0f
addiu	$9,$sp,548
addiu	$8,$sp,36
move	$12,$20
addiu	$17,$sp,1201
$L2115:
lwl	$5,3($18)
lwl	$2,-1($9)
lwr	$5,0($18)
lwr	$2,-4($9)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$10
srl	$2,$2,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
sw	$2,0($12)
lwl	$5,7($18)
lwl	$2,3($9)
lwr	$5,4($18)
lwr	$2,0($9)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$10
srl	$5,$5,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
addiu	$18,$18,24
sw	$2,4($12)
addiu	$16,$16,16
addu	$12,$12,$19
addiu	$9,$9,16
bne	$18,$17,$L2115
addiu	$8,$8,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,33685504			# 0x2020000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x202
ori	$15,$3,0xf0f
addiu	$8,$sp,825
addiu	$11,$sp,552
addiu	$10,$sp,296
addiu	$9,$sp,44
addiu	$17,$sp,1209
$L2116:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,-1($9)
lwl	$7,3($10)
lwr	$6,-4($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,3($9)
lwl	$7,7($10)
lwr	$6,0($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addu	$14,$14,$19
bne	$8,$17,$L2116
addiu	$9,$9,16

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_qpel16_mc31_old_c
.align	2
.globl	ff_put_no_rnd_qpel16_mc31_old_c
.ent	ff_put_no_rnd_qpel16_mc31_old_c
.type	ff_put_no_rnd_qpel16_mc31_old_c, @function
ff_put_no_rnd_qpel16_mc31_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$7,$sp,816
move	$20,$4
move	$19,$6
move	$4,$7
addiu	$6,$sp,1224
$L2122:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2122
addu	$5,$5,$19

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$17
li	$6,16			# 0x10
li	$7,24			# 0x18
addiu	$18,$sp,817
sw	$2,16($sp)
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
move	$5,$18
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_no_rnd_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$11,$2,0xfcfc
ori	$10,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
lw	$28,24($sp)
move	$14,$20
ori	$15,$2,0x101
ori	$13,$3,0xf0f
addiu	$9,$sp,548
addiu	$8,$sp,36
move	$12,$20
addiu	$17,$sp,1201
$L2123:
lwl	$5,3($18)
lwl	$2,-1($9)
lwr	$5,0($18)
lwr	$2,-4($9)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,0($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$10
srl	$2,$2,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
sw	$2,0($12)
lwl	$5,7($18)
lwl	$2,3($9)
lwr	$5,4($18)
lwr	$2,0($9)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$3,$2,$10
and	$4,$5,$10
lwr	$7,4($16)
addu	$4,$4,$3
addu	$4,$4,$15
and	$3,$6,$10
and	$2,$2,$11
and	$5,$5,$11
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$10
srl	$5,$5,2
and	$6,$6,$11
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$11
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$13
addu	$2,$2,$4
addiu	$18,$18,24
sw	$2,4($12)
addiu	$16,$16,16
addu	$12,$12,$19
addiu	$9,$9,16
bne	$18,$17,$L2123
addiu	$8,$8,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
ori	$12,$3,0x303
li	$2,16842752			# 0x1010000
li	$3,252641280			# 0xf0f0000
ori	$16,$2,0x101
ori	$15,$3,0xf0f
addiu	$8,$sp,825
addiu	$11,$sp,552
addiu	$10,$sp,296
addiu	$9,$sp,44
addiu	$17,$sp,1209
$L2124:
lwl	$5,3($8)
lwl	$2,3($11)
lwr	$5,0($8)
lwr	$2,0($11)
lwl	$6,-1($9)
lwl	$7,3($10)
lwr	$6,-4($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,0($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$5,$5,2
and	$3,$7,$12
srl	$2,$2,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
sw	$2,8($14)
lwl	$5,7($8)
lwl	$2,7($11)
lwr	$5,4($8)
lwr	$2,4($11)
lwl	$6,3($9)
lwl	$7,7($10)
lwr	$6,0($9)
and	$3,$2,$12
and	$4,$5,$12
lwr	$7,4($10)
addu	$4,$4,$3
addu	$4,$4,$16
and	$3,$6,$12
and	$2,$2,$13
and	$5,$5,$13
addu	$4,$4,$3
srl	$2,$2,2
and	$3,$7,$12
srl	$5,$5,2
and	$6,$6,$13
addu	$2,$2,$5
addu	$4,$4,$3
srl	$6,$6,2
and	$7,$7,$13
addu	$2,$2,$6
srl	$7,$7,2
srl	$4,$4,2
addu	$2,$2,$7
and	$4,$4,$15
addu	$2,$2,$4
addiu	$8,$8,24
sw	$2,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addu	$14,$14,$19
bne	$8,$17,$L2124
addiu	$9,$9,16

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_put_no_rnd_qpel16_mc31_old_c
.align	2
.globl	ff_avg_qpel16_mc31_old_c
.ent	ff_avg_qpel16_mc31_old_c
.type	ff_avg_qpel16_mc31_old_c, @function
ff_avg_qpel16_mc31_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$7,$sp,816
move	$20,$4
move	$19,$6
move	$4,$7
addiu	$6,$sp,1224
$L2130:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2130
addu	$5,$5,$19

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$5,$7
move	$4,$17
li	$6,16			# 0x10
li	$7,24			# 0x18
addiu	$18,$sp,817
sw	$2,16($sp)
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
addiu	$16,$sp,288

addiu	$4,$sp,32
move	$5,$18
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,24			# 0x18

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$12,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$11,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$14,$20
ori	$15,$3,0xf0f
ori	$13,$2,0xfefe
addiu	$9,$sp,548
addiu	$8,$sp,36
move	$10,$20
addiu	$24,$sp,1201
$L2131:
lwl	$5,3($18)
lwl	$3,-1($9)
lwr	$5,0($18)
lwr	$3,-4($9)
lwl	$6,-1($8)
lwl	$7,3($16)
lwr	$6,-4($8)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($10)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$13
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($10)
lwl	$5,7($18)
lwl	$3,3($9)
lwr	$5,4($18)
lwr	$3,0($9)
lwl	$6,3($8)
lwl	$7,7($16)
lwr	$6,0($8)
and	$2,$3,$11
and	$4,$5,$11
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$11
and	$3,$3,$12
and	$5,$5,$12
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$11
srl	$3,$3,2
and	$6,$6,$12
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$12
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($10)
addu	$3,$3,$7
and	$4,$4,$15
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$13
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$18,$18,24
sw	$3,4($10)
addiu	$16,$16,16
addu	$10,$10,$19
addiu	$9,$9,16
bne	$18,$24,$L2131
addiu	$8,$8,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$12,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
ori	$16,$3,0xf0f
ori	$15,$2,0xfefe
addiu	$8,$sp,825
addiu	$11,$sp,552
addiu	$10,$sp,296
addiu	$9,$sp,44
addiu	$18,$sp,1209
$L2132:
lwl	$5,3($8)
lwl	$3,3($11)
lwr	$5,0($8)
lwr	$3,0($11)
lwl	$6,-1($9)
lwl	$7,3($10)
lwr	$6,-4($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,0($10)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,8($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,8($14)
lwl	$5,7($8)
lwl	$3,7($11)
lwr	$5,4($8)
lwr	$3,4($11)
lwl	$6,3($9)
lwl	$7,7($10)
lwr	$6,0($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,4($10)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,12($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,24
sw	$3,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addu	$14,$14,$19
bne	$8,$18,$L2132
addiu	$9,$9,16

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_avg_qpel16_mc31_old_c
.align	2
.ent	avg_qpel16_mc33_c
.type	avg_qpel16_mc33_c, @function
avg_qpel16_mc33_c:
.set	nomips16
.frame	$sp,1000,$31		# vars= 936, regs= 7/0, args= 24, gp= 8
.mask	0x803f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1000
sw	$31,996($sp)
sw	$21,992($sp)
sw	$20,988($sp)
sw	$19,984($sp)
sw	$18,980($sp)
sw	$17,976($sp)
sw	$16,972($sp)
.cprestore	24
addiu	$16,$sp,560
move	$21,$4
move	$19,$6
move	$4,$16
addiu	$6,$sp,968
$L2138:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2138
addu	$5,$5,$19

addiu	$20,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
move	$4,$20
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
move	$17,$20
addiu	$5,$sp,561
$L2139:
lwl	$4,3($17)
lwl	$2,3($5)
lwr	$4,0($17)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($17)
lwl	$4,7($17)
lwl	$2,7($5)
lwr	$4,4($17)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($17)
addiu	$17,$17,16
bne	$17,$16,$L2139
addiu	$5,$5,24

li	$2,-16908288			# 0xfffffffffefe0000
ori	$6,$2,0xfefe
addiu	$18,$sp,296
addiu	$5,$sp,569
addiu	$7,$sp,568
$L2140:
lwl	$4,3($18)
lwl	$2,3($5)
lwr	$4,0($18)
lwr	$2,0($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($18)
lwl	$4,7($18)
lwl	$2,7($5)
lwr	$4,4($18)
lwr	$2,4($5)
xor	$3,$2,$4
and	$3,$3,$6
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($18)
addiu	$18,$18,16
bne	$18,$7,$L2140
addiu	$5,$5,24

addiu	$16,$sp,32
li	$6,16			# 0x10
li	$7,16			# 0x10
move	$5,$20
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$16

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$8,$21
ori	$9,$2,0xfefe
addiu	$6,$sp,304
move	$7,$21
$L2141:
lwl	$4,3($6)
lwl	$2,3($16)
lwr	$4,0($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($16)
lwr	$3,4($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,4($7)
addiu	$16,$16,16
bne	$17,$6,$L2141
addu	$7,$7,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$9,$2,0xfefe
addiu	$6,$sp,312
addiu	$7,$sp,40
$L2142:
lwl	$4,3($6)
lwl	$2,3($7)
lwr	$4,0($6)
lwr	$2,0($7)
lw	$5,8($8)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($8)
lwl	$3,7($6)
lwl	$4,7($7)
lwr	$3,4($6)
lwr	$4,4($7)
lw	$5,12($8)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,12($8)
addiu	$7,$7,16
bne	$6,$18,$L2142
addu	$8,$8,$19

lw	$31,996($sp)
lw	$21,992($sp)
lw	$20,988($sp)
lw	$19,984($sp)
lw	$18,980($sp)
lw	$17,976($sp)
lw	$16,972($sp)
j	$31
addiu	$sp,$sp,1000

.set	macro
.set	reorder
.end	avg_qpel16_mc33_c
.align	2
.ent	avg_qpel16_mc11_c
.type	avg_qpel16_mc11_c, @function
avg_qpel16_mc11_c:
.set	nomips16
.frame	$sp,992,$31		# vars= 936, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-992
sw	$31,988($sp)
sw	$20,984($sp)
sw	$19,980($sp)
sw	$18,976($sp)
sw	$17,972($sp)
sw	$16,968($sp)
.cprestore	24
addiu	$16,$sp,560
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,968
$L2150:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2150
addu	$5,$5,$18

addiu	$19,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$19
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$19
move	$6,$16
$L2151:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L2151
addiu	$6,$6,24

addiu	$17,$sp,296
addiu	$8,$sp,568
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$6,$8
move	$5,$17
$L2152:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L2152
addiu	$6,$6,24

addiu	$16,$sp,32
li	$6,16			# 0x10
li	$7,16			# 0x10
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$5,$19

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$8,$20
ori	$9,$2,0xfefe
addiu	$6,$sp,292
move	$7,$20
$L2153:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,16
sw	$4,4($7)
addiu	$6,$6,16
bne	$16,$19,$L2153
addu	$7,$7,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$6,$sp,40
addiu	$9,$sp,552
$L2154:
lwl	$4,3($17)
lwl	$2,3($6)
lwr	$4,0($17)
lwr	$2,0($6)
lw	$5,8($8)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$7
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($8)
lwl	$3,7($17)
lwl	$4,7($6)
lwr	$3,4($17)
lwr	$4,4($6)
lw	$5,12($8)
xor	$2,$4,$3
and	$2,$2,$7
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$7
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$17,$17,16
sw	$4,12($8)
addiu	$6,$6,16
bne	$17,$9,$L2154
addu	$8,$8,$18

lw	$31,988($sp)
lw	$20,984($sp)
lw	$19,980($sp)
lw	$18,976($sp)
lw	$17,972($sp)
lw	$16,968($sp)
j	$31
addiu	$sp,$sp,992

.set	macro
.set	reorder
.end	avg_qpel16_mc11_c
.align	2
.ent	avg_qpel16_mc31_c
.type	avg_qpel16_mc31_c, @function
avg_qpel16_mc31_c:
.set	nomips16
.frame	$sp,992,$31		# vars= 936, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-992
sw	$31,988($sp)
sw	$20,984($sp)
sw	$19,980($sp)
sw	$18,976($sp)
sw	$17,972($sp)
sw	$16,968($sp)
.cprestore	24
addiu	$16,$sp,560
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$6,$sp,968
$L2162:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$6,$L2162
addu	$5,$5,$18

addiu	$19,$sp,288
li	$2,17			# 0x11
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
move	$4,$19
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
move	$5,$19
addiu	$6,$sp,561
$L2163:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$16,$L2163
addiu	$6,$6,24

addiu	$17,$sp,296
li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$6,$sp,569
move	$5,$17
addiu	$8,$sp,568
$L2164:
lwl	$4,3($5)
lwl	$2,3($6)
lwr	$4,0($5)
lwr	$2,0($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,0($5)
lwl	$4,7($5)
lwl	$2,7($6)
lwr	$4,4($5)
lwr	$2,4($6)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
sw	$2,4($5)
addiu	$5,$5,16
bne	$5,$8,$L2164
addiu	$6,$6,24

addiu	$16,$sp,32
li	$6,16			# 0x10
li	$7,16			# 0x10
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$5,$19

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$8,$20
ori	$9,$2,0xfefe
addiu	$6,$sp,292
move	$7,$20
$L2165:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$9
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$9
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$9
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$9
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,16
sw	$4,4($7)
addiu	$6,$6,16
bne	$16,$19,$L2165
addu	$7,$7,$18

li	$2,-16908288			# 0xfffffffffefe0000
ori	$7,$2,0xfefe
addiu	$6,$sp,40
addiu	$9,$sp,552
$L2166:
lwl	$4,3($17)
lwl	$2,3($6)
lwr	$4,0($17)
lwr	$2,0($6)
lw	$5,8($8)
xor	$3,$2,$4
and	$3,$3,$7
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$7
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($8)
lwl	$3,7($17)
lwl	$4,7($6)
lwr	$3,4($17)
lwr	$4,4($6)
lw	$5,12($8)
xor	$2,$4,$3
and	$2,$2,$7
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$7
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$17,$17,16
sw	$4,12($8)
addiu	$6,$6,16
bne	$17,$9,$L2166
addu	$8,$8,$18

lw	$31,988($sp)
lw	$20,984($sp)
lw	$19,980($sp)
lw	$18,976($sp)
lw	$17,972($sp)
lw	$16,968($sp)
j	$31
addiu	$sp,$sp,992

.set	macro
.set	reorder
.end	avg_qpel16_mc31_c
.align	2
.globl	ff_avg_qpel16_mc13_old_c
.ent	ff_avg_qpel16_mc13_old_c
.type	ff_avg_qpel16_mc13_old_c, @function
ff_avg_qpel16_mc13_old_c:
.set	nomips16
.frame	$sp,1248,$31		# vars= 1192, regs= 6/0, args= 24, gp= 8
.mask	0x801f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-1248
sw	$31,1244($sp)
sw	$20,1240($sp)
sw	$19,1236($sp)
sw	$18,1232($sp)
sw	$17,1228($sp)
sw	$16,1224($sp)
.cprestore	24
addiu	$16,$sp,816
move	$20,$4
move	$18,$6
move	$4,$16
addiu	$19,$sp,1224
$L2174:
lwl	$2,3($5)
lwr	$2,0($5)
swl	$2,3($4)
swr	$2,0($4)
lwl	$3,7($5)
lwr	$3,4($5)
swl	$3,7($4)
swr	$3,4($4)
lwl	$2,11($5)
lwr	$2,8($5)
swl	$2,11($4)
swr	$2,8($4)
lwl	$3,15($5)
lwr	$3,12($5)
swl	$3,15($4)
swr	$3,12($4)
lbu	$2,16($5)
sb	$2,16($4)
addiu	$4,$4,24
bne	$4,$19,$L2174
addu	$5,$5,$18

addiu	$17,$sp,544
li	$2,17			# 0x11
move	$4,$17
move	$5,$16
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

move	$5,$16
addiu	$4,$sp,32
li	$6,16			# 0x10
li	$7,24			# 0x18
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
addiu	$16,$sp,288

move	$5,$17
move	$4,$16
li	$6,16			# 0x10
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
li	$7,16			# 0x10

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$12,$3,0x303
ori	$24,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
move	$14,$20
ori	$17,$3,0xf0f
ori	$15,$2,0xfefe
addiu	$8,$sp,840
addiu	$10,$sp,560
addiu	$9,$sp,36
move	$11,$20
$L2175:
lwl	$5,3($8)
lwl	$3,3($10)
lwr	$5,0($8)
lwr	$3,0($10)
lwl	$6,-1($9)
lwl	$7,3($16)
lwr	$6,-4($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,0($16)
addu	$4,$4,$2
addu	$4,$4,$24
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,0($11)
addu	$3,$3,$7
and	$4,$4,$17
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,0($11)
lwl	$5,7($8)
lwl	$3,7($10)
lwr	$5,4($8)
lwr	$3,4($10)
lwl	$6,3($9)
lwl	$7,7($16)
lwr	$6,0($9)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,4($16)
addu	$4,$4,$2
addu	$4,$4,$24
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,4($11)
addu	$3,$3,$7
and	$4,$4,$17
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,24
sw	$3,4($11)
addiu	$10,$10,16
addiu	$16,$16,16
addu	$11,$11,$18
bne	$8,$19,$L2175
addiu	$9,$9,16

li	$2,-50593792			# 0xfffffffffcfc0000
li	$3,50528256			# 0x3030000
ori	$13,$2,0xfcfc
li	$2,33685504			# 0x2020000
ori	$12,$3,0x303
ori	$17,$2,0x202
li	$3,252641280			# 0xf0f0000
li	$2,-16908288			# 0xfffffffffefe0000
ori	$16,$3,0xf0f
ori	$15,$2,0xfefe
addiu	$8,$sp,848
addiu	$11,$sp,568
addiu	$10,$sp,40
addiu	$9,$sp,296
addiu	$19,$sp,1232
$L2176:
lwl	$5,3($8)
lwl	$3,3($11)
lwr	$5,0($8)
lwr	$3,0($11)
lwl	$6,3($10)
lwl	$7,3($9)
lwr	$6,0($10)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,0($9)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,8($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
sw	$3,8($14)
lwl	$5,7($8)
lwl	$3,7($11)
lwr	$5,4($8)
lwr	$3,4($11)
lwl	$6,7($10)
lwl	$7,7($9)
lwr	$6,4($10)
and	$2,$3,$12
and	$4,$5,$12
lwr	$7,4($9)
addu	$4,$4,$2
addu	$4,$4,$17
and	$2,$6,$12
and	$3,$3,$13
and	$5,$5,$13
addu	$4,$4,$2
srl	$5,$5,2
and	$2,$7,$12
srl	$3,$3,2
and	$6,$6,$13
addu	$3,$3,$5
addu	$4,$4,$2
srl	$6,$6,2
and	$7,$7,$13
addu	$3,$3,$6
srl	$7,$7,2
srl	$4,$4,2
lw	$5,12($14)
addu	$3,$3,$7
and	$4,$4,$16
addu	$3,$3,$4
xor	$2,$3,$5
and	$2,$2,$15
srl	$2,$2,1
or	$3,$3,$5
subu	$3,$3,$2
addiu	$8,$8,24
sw	$3,12($14)
addiu	$11,$11,16
addiu	$10,$10,16
addiu	$9,$9,16
bne	$8,$19,$L2176
addu	$14,$14,$18

lw	$31,1244($sp)
lw	$20,1240($sp)
lw	$19,1236($sp)
lw	$18,1232($sp)
lw	$17,1228($sp)
lw	$16,1224($sp)
j	$31
addiu	$sp,$sp,1248

.set	macro
.set	reorder
.end	ff_avg_qpel16_mc13_old_c
.align	2
.ent	avg_qpel16_mc21_c
.type	avg_qpel16_mc21_c, @function
avg_qpel16_mc21_c:
.set	nomips16
.frame	$sp,584,$31		# vars= 528, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-584
sw	$31,580($sp)
sw	$19,576($sp)
sw	$18,572($sp)
sw	$17,568($sp)
sw	$16,564($sp)
.cprestore	24
move	$19,$6
addiu	$18,$sp,288
li	$2,17			# 0x11
move	$17,$4
li	$6,16			# 0x10
move	$4,$18
move	$7,$19
addiu	$16,$sp,32
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$6,16			# 0x10
li	$7,16			# 0x10
move	$4,$16
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$5,$18

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$8,$2,0xfefe
addiu	$6,$sp,292
move	$7,$17
$L2182:
lwl	$4,-1($6)
lwl	$2,3($16)
lwr	$4,-4($6)
lwr	$2,0($16)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,3($6)
lwl	$4,7($16)
lwr	$3,0($6)
lwr	$4,4($16)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$16,$16,16
sw	$4,4($7)
addiu	$6,$6,16
bne	$16,$18,$L2182
addu	$7,$7,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$6,$sp,296
addiu	$7,$sp,40
addiu	$9,$sp,552
$L2183:
lwl	$4,3($6)
lwl	$2,3($7)
lwr	$4,0($6)
lwr	$2,0($7)
lw	$5,8($17)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($17)
lwl	$3,7($6)
lwl	$4,7($7)
lwr	$3,4($6)
lwr	$4,4($7)
lw	$5,12($17)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,12($17)
addiu	$7,$7,16
bne	$6,$9,$L2183
addu	$17,$17,$19

lw	$31,580($sp)
lw	$19,576($sp)
lw	$18,572($sp)
lw	$17,568($sp)
lw	$16,564($sp)
j	$31
addiu	$sp,$sp,584

.set	macro
.set	reorder
.end	avg_qpel16_mc21_c
.align	2
.ent	avg_qpel16_mc23_c
.type	avg_qpel16_mc23_c, @function
avg_qpel16_mc23_c:
.set	nomips16
.frame	$sp,584,$31		# vars= 528, regs= 5/0, args= 24, gp= 8
.mask	0x800f0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-584
sw	$31,580($sp)
sw	$19,576($sp)
sw	$18,572($sp)
sw	$17,568($sp)
sw	$16,564($sp)
.cprestore	24
move	$19,$6
addiu	$16,$sp,288
li	$2,17			# 0x11
move	$18,$4
li	$6,16			# 0x10
move	$4,$16
move	$7,$19
addiu	$17,$sp,32
.option	pic0
jal	put_mpeg4_qpel16_h_lowpass
.option	pic2
sw	$2,16($sp)

li	$6,16			# 0x10
li	$7,16			# 0x10
move	$5,$16
.option	pic0
jal	put_mpeg4_qpel16_v_lowpass
.option	pic2
move	$4,$17

li	$2,-16908288			# 0xfffffffffefe0000
lw	$28,24($sp)
ori	$8,$2,0xfefe
addiu	$6,$sp,304
move	$7,$18
addiu	$9,$sp,560
$L2188:
lwl	$4,3($6)
lwl	$2,3($17)
lwr	$4,0($6)
lwr	$2,0($17)
lw	$5,0($7)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,0($7)
lwl	$3,7($6)
lwl	$4,7($17)
lwr	$3,4($6)
lwr	$4,4($17)
lw	$5,4($7)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,4($7)
addiu	$17,$17,16
bne	$6,$9,$L2188
addu	$7,$7,$19

li	$2,-16908288			# 0xfffffffffefe0000
ori	$8,$2,0xfefe
addiu	$6,$sp,312
addiu	$7,$sp,40
addiu	$9,$sp,568
$L2189:
lwl	$4,3($6)
lwl	$2,3($7)
lwr	$4,0($6)
lwr	$2,0($7)
lw	$5,8($18)
xor	$3,$2,$4
and	$3,$3,$8
srl	$3,$3,1
or	$2,$2,$4
subu	$2,$2,$3
xor	$4,$2,$5
and	$4,$4,$8
srl	$4,$4,1
or	$2,$2,$5
subu	$2,$2,$4
sw	$2,8($18)
lwl	$3,7($6)
lwl	$4,7($7)
lwr	$3,4($6)
lwr	$4,4($7)
lw	$5,12($18)
xor	$2,$4,$3
and	$2,$2,$8
or	$4,$4,$3
srl	$2,$2,1
subu	$4,$4,$2
xor	$3,$4,$5
and	$3,$3,$8
srl	$3,$3,1
or	$4,$4,$5
subu	$4,$4,$3
addiu	$6,$6,16
sw	$4,12($18)
addiu	$7,$7,16
bne	$6,$9,$L2189
addu	$18,$18,$19

lw	$31,580($sp)
lw	$19,576($sp)
lw	$18,572($sp)
lw	$17,568($sp)
lw	$16,564($sp)
j	$31
addiu	$sp,$sp,584

.set	macro
.set	reorder
.end	avg_qpel16_mc23_c
.globl	ff_cropTbl
.section	.bss,"aw",@nobits
.align	2
.type	ff_cropTbl, @object
.size	ff_cropTbl, 2304
ff_cropTbl:
.space	2304
.globl	ff_squareTbl
.align	2
.type	ff_squareTbl, @object
.size	ff_squareTbl, 2048
ff_squareTbl:
.space	2048
.globl	ff_zigzag_direct
.rdata
.align	2
.type	ff_zigzag_direct, @object
.size	ff_zigzag_direct, 64
ff_zigzag_direct:
.byte	0
.byte	1
.byte	8
.byte	16
.byte	9
.byte	2
.byte	3
.byte	10
.byte	17
.byte	24
.byte	32
.byte	25
.byte	18
.byte	11
.byte	4
.byte	5
.byte	12
.byte	19
.byte	26
.byte	33
.byte	40
.byte	48
.byte	41
.byte	34
.byte	27
.byte	20
.byte	13
.byte	6
.byte	7
.byte	14
.byte	21
.byte	28
.byte	35
.byte	42
.byte	49
.byte	56
.byte	57
.byte	50
.byte	43
.byte	36
.byte	29
.byte	22
.byte	15
.byte	23
.byte	30
.byte	37
.byte	44
.byte	51
.byte	58
.byte	59
.byte	52
.byte	45
.byte	38
.byte	31
.byte	39
.byte	46
.byte	53
.byte	60
.byte	61
.byte	54
.byte	47
.byte	55
.byte	62
.byte	63
.globl	ff_zigzag248_direct
.align	2
.type	ff_zigzag248_direct, @object
.size	ff_zigzag248_direct, 64
ff_zigzag248_direct:
.byte	0
.byte	8
.byte	1
.byte	9
.byte	16
.byte	24
.byte	2
.byte	10
.byte	17
.byte	25
.byte	32
.byte	40
.byte	48
.byte	56
.byte	33
.byte	41
.byte	18
.byte	26
.byte	3
.byte	11
.byte	4
.byte	12
.byte	19
.byte	27
.byte	34
.byte	42
.byte	49
.byte	57
.byte	50
.byte	58
.byte	35
.byte	43
.byte	20
.byte	28
.byte	5
.byte	13
.byte	6
.byte	14
.byte	21
.byte	29
.byte	36
.byte	44
.byte	51
.byte	59
.byte	52
.byte	60
.byte	37
.byte	45
.byte	22
.byte	30
.byte	7
.byte	15
.byte	23
.byte	31
.byte	38
.byte	46
.byte	53
.byte	61
.byte	54
.byte	62
.byte	39
.byte	47
.byte	55
.byte	63
.globl	inv_zigzag_direct16
.section	.bss
.align	3
.type	inv_zigzag_direct16, @object
.size	inv_zigzag_direct16, 128
inv_zigzag_direct16:
.space	128
.globl	ff_alternate_horizontal_scan
.rdata
.align	2
.type	ff_alternate_horizontal_scan, @object
.size	ff_alternate_horizontal_scan, 64
ff_alternate_horizontal_scan:
.byte	0
.byte	1
.byte	2
.byte	3
.byte	8
.byte	9
.byte	16
.byte	17
.byte	10
.byte	11
.byte	4
.byte	5
.byte	6
.byte	7
.byte	15
.byte	14
.byte	13
.byte	12
.byte	19
.byte	18
.byte	24
.byte	25
.byte	32
.byte	33
.byte	26
.byte	27
.byte	20
.byte	21
.byte	22
.byte	23
.byte	28
.byte	29
.byte	30
.byte	31
.byte	34
.byte	35
.byte	40
.byte	41
.byte	48
.byte	49
.byte	42
.byte	43
.byte	36
.byte	37
.byte	38
.byte	39
.byte	44
.byte	45
.byte	46
.byte	47
.byte	50
.byte	51
.byte	56
.byte	57
.byte	58
.byte	59
.byte	52
.byte	53
.byte	54
.byte	55
.byte	60
.byte	61
.byte	62
.byte	63
.globl	ff_alternate_vertical_scan
.align	2
.type	ff_alternate_vertical_scan, @object
.size	ff_alternate_vertical_scan, 64
ff_alternate_vertical_scan:
.byte	0
.byte	8
.byte	16
.byte	24
.byte	1
.byte	9
.byte	2
.byte	10
.byte	17
.byte	25
.byte	32
.byte	40
.byte	48
.byte	56
.byte	57
.byte	49
.byte	41
.byte	33
.byte	26
.byte	18
.byte	3
.byte	11
.byte	4
.byte	12
.byte	19
.byte	27
.byte	34
.byte	42
.byte	50
.byte	58
.byte	35
.byte	43
.byte	51
.byte	59
.byte	20
.byte	28
.byte	5
.byte	13
.byte	6
.byte	14
.byte	21
.byte	29
.byte	36
.byte	44
.byte	52
.byte	60
.byte	37
.byte	45
.byte	53
.byte	61
.byte	22
.byte	30
.byte	7
.byte	15
.byte	23
.byte	31
.byte	38
.byte	46
.byte	54
.byte	62
.byte	39
.byte	47
.byte	55
.byte	63
.globl	ff_inverse
.align	2
.type	ff_inverse, @object
.size	ff_inverse, 1024
ff_inverse:
.word	0
.word	-1
.word	-2147483648
.word	1431655766
.word	1073741824
.word	858993460
.word	715827883
.word	613566757
.word	536870912
.word	477218589
.word	429496730
.word	390451573
.word	357913942
.word	330382100
.word	306783379
.word	286331154
.word	268435456
.word	252645136
.word	238609295
.word	226050911
.word	214748365
.word	204522253
.word	195225787
.word	186737709
.word	178956971
.word	171798692
.word	165191050
.word	159072863
.word	153391690
.word	148102321
.word	143165577
.word	138547333
.word	134217728
.word	130150525
.word	126322568
.word	122713352
.word	119304648
.word	116080198
.word	113025456
.word	110127367
.word	107374183
.word	104755300
.word	102261127
.word	99882961
.word	97612894
.word	95443718
.word	93368855
.word	91382283
.word	89478486
.word	87652394
.word	85899346
.word	84215046
.word	82595525
.word	81037119
.word	79536432
.word	78090315
.word	76695845
.word	75350304
.word	74051161
.word	72796056
.word	71582789
.word	70409300
.word	69273667
.word	68174085
.word	67108864
.word	66076420
.word	65075263
.word	64103990
.word	63161284
.word	62245903
.word	61356676
.word	60492498
.word	59652324
.word	58835169
.word	58040099
.word	57266231
.word	56512728
.word	55778797
.word	55063684
.word	54366675
.word	53687092
.word	53024288
.word	52377650
.word	51746594
.word	51130564
.word	50529028
.word	49941481
.word	49367441
.word	48806447
.word	48258060
.word	47721859
.word	47197443
.word	46684428
.word	46182445
.word	45691142
.word	45210183
.word	44739243
.word	44278014
.word	43826197
.word	43383509
.word	42949673
.word	42524429
.word	42107523
.word	41698712
.word	41297763
.word	40904451
.word	40518560
.word	40139882
.word	39768216
.word	39403370
.word	39045158
.word	38693400
.word	38347923
.word	38008561
.word	37675152
.word	37347542
.word	37025581
.word	36709123
.word	36398028
.word	36092163
.word	35791395
.word	35495598
.word	35204650
.word	34918434
.word	34636834
.word	34359739
.word	34087043
.word	33818641
.word	33554432
.word	33294321
.word	33038210
.word	32786010
.word	32537632
.word	32292988
.word	32051995
.word	31814573
.word	31580642
.word	31350127
.word	31122952
.word	30899046
.word	30678338
.word	30460761
.word	30246249
.word	30034737
.word	29826162
.word	29620465
.word	29417585
.word	29217465
.word	29020050
.word	28825284
.word	28633116
.word	28443493
.word	28256364
.word	28071682
.word	27889399
.word	27709467
.word	27531842
.word	27356480
.word	27183338
.word	27012373
.word	26843546
.word	26676816
.word	26512144
.word	26349493
.word	26188825
.word	26030105
.word	25873297
.word	25718368
.word	25565282
.word	25414008
.word	25264514
.word	25116768
.word	24970741
.word	24826401
.word	24683721
.word	24542671
.word	24403224
.word	24265352
.word	24129030
.word	23994231
.word	23860930
.word	23729102
.word	23598722
.word	23469767
.word	23342214
.word	23216040
.word	23091223
.word	22967740
.word	22845571
.word	22724695
.word	22605092
.word	22486740
.word	22369622
.word	22253717
.word	22139007
.word	22025474
.word	21913099
.word	21801865
.word	21691755
.word	21582751
.word	21474837
.word	21367997
.word	21262215
.word	21157475
.word	21053762
.word	20951060
.word	20849356
.word	20748635
.word	20648882
.word	20550083
.word	20452226
.word	20355296
.word	20259280
.word	20164166
.word	20069941
.word	19976593
.word	19884108
.word	19792477
.word	19701685
.word	19611723
.word	19522579
.word	19434242
.word	19346700
.word	19259944
.word	19173962
.word	19088744
.word	19004281
.word	18920561
.word	18837576
.word	18755316
.word	18673771
.word	18592933
.word	18512791
.word	18433337
.word	18354562
.word	18276457
.word	18199014
.word	18122225
.word	18046082
.word	17970575
.word	17895698
.word	17821442
.word	17747799
.word	17674763
.word	17602325
.word	17530479
.word	17459217
.word	17388532
.word	17318417
.word	17248865
.word	17179870
.word	17111424
.word	17043522
.word	16976156
.word	16909321
.word	16843010
.align	2
.type	simple_mmx_permutation, @object
.size	simple_mmx_permutation, 64
simple_mmx_permutation:
.byte	0
.byte	8
.byte	4
.byte	9
.byte	1
.byte	12
.byte	5
.byte	13
.byte	16
.byte	24
.byte	20
.byte	25
.byte	17
.byte	28
.byte	21
.byte	29
.byte	32
.byte	40
.byte	36
.byte	41
.byte	33
.byte	44
.byte	37
.byte	45
.byte	18
.byte	26
.byte	22
.byte	27
.byte	19
.byte	30
.byte	23
.byte	31
.byte	2
.byte	10
.byte	6
.byte	11
.byte	3
.byte	14
.byte	7
.byte	15
.byte	48
.byte	56
.byte	52
.byte	57
.byte	49
.byte	60
.byte	53
.byte	61
.byte	34
.byte	42
.byte	38
.byte	43
.byte	35
.byte	46
.byte	39
.byte	47
.byte	50
.byte	58
.byte	54
.byte	59
.byte	51
.byte	62
.byte	55
.byte	63
.align	2
.type	scale.7515, @object
.size	scale.7515, 256
scale.7515:
.word	268
.word	239
.word	239
.word	213
.word	0
.word	224
.word	224
.word	152
.word	0
.word	135
.word	135
.word	110
.space	16
.word	344
.word	310
.word	310
.word	280
.word	0
.word	320
.word	320
.word	228
.word	0
.word	175
.word	175
.word	136
.word	0
.word	129
.word	129
.word	102
.word	275
.word	245
.word	245
.word	218
.word	0
.word	230
.word	230
.word	156
.word	0
.word	138
.word	138
.word	113
.space	16
.word	352
.word	317
.word	317
.word	286
.word	0
.word	328
.word	328
.word	233
.word	0
.word	180
.word	180
.word	140
.word	0
.word	132
.word	132
.word	105
.ident	"GCC: (GNU) 4.3.3"

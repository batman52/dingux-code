.file	1 "bit_allocate.c"
.section .mdebug.abi32
.previous
.gnu_attribute 4, 3
.abicalls
.text
.align	2
.globl	a52_bit_allocate
.ent	a52_bit_allocate
.type	a52_bit_allocate, @function
a52_bit_allocate:
.set	nomips16
.frame	$sp,72,$31		# vars= 24, regs= 9/0, args= 0, gp= 8
.mask	0x40ff0000,-4
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

addiu	$sp,$sp,-72
sw	$fp,68($sp)
sw	$23,64($sp)
sw	$22,60($sp)
sw	$21,56($sp)
sw	$20,52($sp)
sw	$19,48($sp)
sw	$18,44($sp)
sw	$17,40($sp)
sw	$16,36($sp)
.cprestore	0
lhu	$14,416($4)
move	$17,$4
lbu	$4,0($4)
move	$18,$5
sll	$2,$4,5
srl	$5,$14,7
sll	$4,$4,3
lbu	$15,0($18)
addu	$4,$4,$2
andi	$5,$5,0x3
srl	$9,$14,3
lui	$2,%hi(slowgain.3014)
sll	$3,$5,4
addiu	$2,$2,%lo(slowgain.3014)
sll	$5,$5,2
srl	$8,$14,9
andi	$9,$9,0xc
lbu	$20,1($17)
addu	$5,$5,$3
addu	$9,$9,$2
srl	$10,$14,1
sll	$8,$8,1
andi	$11,$15,0x7
sll	$12,$4,2
lui	$3,%hi(dbpbtab.3015)
lui	$2,%hi(hthtab)
lbu	$13,1($18)
addiu	$2,$2,%lo(hthtab)
andi	$10,$10,0xc
addiu	$3,$3,%lo(dbpbtab.3015)
addu	$4,$4,$12
addiu	$5,$5,63
addiu	$11,$11,1
addiu	$8,$8,15
lw	$9,0($9)
addu	$10,$10,$3
addu	$23,$2,$4
sra	$5,$5,$20
sll	$11,$11,7
sra	$8,$8,$20
li	$2,2			# 0x2
lw	$19,0($10)
sw	$5,24($sp)
sw	$11,20($sp)
sw	$8,16($sp)
sw	$9,12($sp)
lw	$16,92($sp)
lw	$10,96($sp)
beq	$13,$2,$L57
lw	$21,100($sp)

lui	$2,%hi(baptab+156)
addiu	$18,$18,2
sw	$18,8($sp)
addiu	$8,$2,%lo(baptab+156)
$L3:
lbu	$2,436($17)
li	$3,15			# 0xf
subu	$3,$3,$2
andi	$4,$14,0x7
lui	$2,%hi(floortab.3016)
addiu	$2,$2,%lo(floortab.3016)
sll	$4,$4,2
addu	$4,$4,$2
sll	$3,$3,4
srl	$2,$15,3
lw	$5,0($4)
subu	$3,$3,$2
sll	$3,$3,2
addu	$fp,$3,$5
beq	$7,$0,$L4
sra	$22,$5,5

move	$11,$6
move	$25,$7
$L5:
addiu	$2,$11,-20
lui	$3,%hi(bndtab)
sll	$2,$2,2
addiu	$3,$3,%lo(bndtab)
addu	$18,$3,$2
lw	$3,8($sp)
lui	$2,%hi(latab)
addu	$17,$3,$11
addiu	$9,$2,%lo(latab)
li	$6,-1			# 0xffffffffffffffff
$L48:
lw	$3,0($18)
lw	$5,88($sp)
addu	$4,$21,$25
slt	$2,$3,$5
move	$24,$5
movn	$24,$3,$2
lbu	$14,0($4)
addiu	$13,$25,1
slt	$2,$13,$24
beq	$2,$0,$L36
sll	$12,$14,7

addu	$5,$21,$13
b	$L42
addu	$15,$21,$24

$L59:
bltz	$3,$L58
sra	$2,$2,1

bne	$3,$0,$L37
addu	$2,$2,$9

lb	$2,0($2)
addu	$12,$12,$2
$L37:
addiu	$5,$5,1
beq	$5,$15,$L68
lw	$2,24($sp)

$L42:
lbu	$2,0($5)
sll	$4,$2,7
subu	$2,$4,$12
sra	$3,$2,9
bne	$3,$6,$L59
nop

subu	$2,$0,$2
sra	$2,$2,1
addu	$2,$2,$9
lb	$3,0($2)
addiu	$5,$5,1
bne	$5,$15,$L42
addu	$12,$3,$4

$L36:
lw	$2,24($sp)
$L68:
lw	$3,16($sp)
addu	$4,$16,$2
addu	$5,$10,$3
lw	$2,20($sp)
lw	$3,12($sp)
addu	$16,$12,$2
addu	$10,$12,$3
slt	$3,$5,$10
slt	$2,$4,$16
movn	$10,$5,$3
movn	$16,$4,$2
slt	$2,$10,$16
move	$5,$10
slt	$3,$19,$12
beq	$3,$0,$L43
movz	$5,$16,$2

subu	$2,$12,$19
sra	$2,$2,2
subu	$5,$5,$2
$L43:
sra	$2,$11,$20
sll	$2,$2,2
addu	$2,$23,$2
lw	$3,0($2)
lb	$4,0($17)
slt	$2,$3,$5
movz	$3,$5,$2
sll	$4,$4,7
subu	$3,$3,$fp
subu	$2,$3,$4
blez	$2,$L44
subu	$2,$0,$2

move	$3,$0
$L45:
addiu	$2,$25,256
subu	$5,$3,$22
b	$L47
addu	$7,$21,$2

$L60:
lbu	$14,-256($7)
$L47:
sll	$2,$14,2
addu	$2,$2,$5
addu	$2,$8,$2
lbu	$3,0($2)
slt	$4,$13,$24
sb	$3,0($7)
move	$25,$13
addiu	$7,$7,1
bne	$4,$0,$L60
addiu	$13,$13,1

lw	$5,88($sp)
addiu	$18,$18,4
slt	$2,$25,$5
beq	$2,$0,$L50
addiu	$17,$17,1

b	$L48
addiu	$11,$11,1

$L58:
slt	$2,$3,-6
b	$L37
movz	$12,$4,$2

$L44:
b	$L45
sra	$3,$2,5

$L50:
lw	$fp,68($sp)
lw	$23,64($sp)
lw	$22,60($sp)
lw	$21,56($sp)
lw	$20,52($sp)
lw	$19,48($sp)
lw	$18,44($sp)
lw	$17,40($sp)
lw	$16,36($sp)
j	$31
addiu	$sp,$sp,72

$L4:
lw	$2,88($sp)
move	$11,$6
addiu	$9,$2,-1
slt	$2,$11,$9
addu	$13,$21,$6
bne	$2,$0,$L7
move	$14,$0

$L62:
lbu	$7,0($13)
$L8:
lw	$3,20($sp)
sll	$6,$7,7
addu	$16,$6,$3
slt	$2,$19,$6
beq	$2,$0,$L10
addu	$12,$16,$14

subu	$2,$6,$19
sra	$2,$2,2
subu	$12,$12,$2
$L10:
sra	$2,$11,$20
sll	$2,$2,2
addu	$2,$23,$2
lw	$5,8($sp)
lw	$3,0($2)
addu	$4,$5,$11
slt	$2,$3,$12
lb	$5,0($4)
movz	$3,$12,$2
sll	$5,$5,7
subu	$3,$3,$fp
subu	$2,$3,$5
blez	$2,$L11
subu	$2,$0,$2

move	$3,$0
$L12:
sll	$2,$7,2
subu	$2,$2,$22
addu	$2,$3,$2
addu	$2,$8,$2
lbu	$4,0($2)
addu	$3,$21,$11
addiu	$11,$11,1
slt	$2,$11,3
bne	$2,$0,$L13
sb	$4,256($3)

slt	$2,$11,7
beq	$2,$0,$L14
lw	$2,12($sp)

lbu	$12,1($13)
sltu	$2,$7,$12
beq	$2,$0,$L61
lw	$2,12($sp)

$L13:
slt	$2,$11,$9
beq	$2,$0,$L62
addiu	$13,$13,1

$L7:
lbu	$7,0($13)
lbu	$3,1($13)
addiu	$2,$7,-2
beq	$3,$2,$L63
nop

beq	$14,$0,$L8
sltu	$3,$7,$3

addiu	$2,$14,-64
b	$L8
movn	$14,$2,$3

$L11:
b	$L12
sra	$3,$2,5

$L63:
b	$L8
li	$14,384			# 0x180

$L61:
addiu	$13,$11,1
addu	$10,$6,$2
b	$L49
addu	$15,$21,$13

$L65:
sll	$2,$12,2
subu	$2,$2,$22
addu	$2,$3,$2
addu	$2,$8,$2
lbu	$4,0($2)
addu	$3,$21,$11
slt	$2,$13,7
sb	$4,256($3)
beq	$2,$0,$L16
move	$11,$13

$L23:
lbu	$12,0($15)
addiu	$13,$13,1
addiu	$15,$15,1
$L49:
slt	$2,$11,$9
beq	$2,$0,$L69
lw	$3,24($sp)

lbu	$3,0($15)
addiu	$2,$12,-2
beq	$3,$2,$L64
nop

beq	$14,$0,$L18
sltu	$3,$12,$3

addiu	$2,$14,-64
movn	$14,$2,$3
$L18:
lw	$3,24($sp)
$L69:
lw	$5,20($sp)
lw	$2,16($sp)
sll	$6,$12,7
addu	$4,$16,$3
addu	$16,$6,$5
addu	$5,$10,$2
lw	$2,12($sp)
slt	$3,$4,$16
addu	$10,$6,$2
movn	$16,$4,$3
slt	$2,$5,$10
movn	$10,$5,$2
addu	$3,$16,$14
slt	$2,$3,$10
move	$7,$3
slt	$4,$19,$6
beq	$4,$0,$L20
movz	$7,$10,$2

subu	$2,$6,$19
sra	$2,$2,2
subu	$7,$7,$2
$L20:
sra	$2,$11,$20
sll	$2,$2,2
addu	$2,$23,$2
lw	$5,8($sp)
lw	$3,0($2)
addu	$4,$5,$11
slt	$2,$3,$7
lb	$5,0($4)
movz	$3,$7,$2
sll	$5,$5,7
subu	$3,$3,$fp
subu	$2,$3,$5
bgtz	$2,$L65
move	$3,$0

subu	$2,$0,$2
sra	$3,$2,5
sll	$2,$12,2
subu	$2,$2,$22
addu	$2,$3,$2
addu	$2,$8,$2
lbu	$4,0($2)
addu	$3,$21,$11
slt	$2,$13,7
sb	$4,256($3)
bne	$2,$0,$L23
move	$11,$13

$L16:
lw	$3,88($sp)
li	$2,7			# 0x7
beq	$3,$2,$L50
lw	$5,8($sp)

addiu	$13,$11,1
addu	$15,$21,$13
b	$L30
addu	$18,$5,$11

$L25:
beq	$14,$0,$L70
lw	$2,24($sp)

sltu	$3,$17,$3
addiu	$2,$14,-64
movn	$14,$2,$3
$L26:
lw	$2,24($sp)
$L70:
lw	$3,20($sp)
sll	$12,$17,7
addu	$4,$16,$2
addu	$5,$3,$12
lw	$2,16($sp)
lw	$3,12($sp)
addu	$6,$10,$2
addu	$7,$3,$12
slt	$2,$5,$4
move	$16,$5
movz	$16,$4,$2
slt	$3,$7,$6
move	$10,$7
movz	$10,$6,$3
addu	$5,$14,$16
slt	$2,$10,$5
slt	$3,$19,$12
beq	$3,$0,$L27
movn	$5,$10,$2

subu	$2,$12,$19
sra	$2,$2,2
subu	$5,$5,$2
$L27:
sra	$2,$11,$20
sll	$2,$2,2
addu	$2,$23,$2
lw	$3,0($2)
lb	$4,0($18)
slt	$2,$3,$5
movz	$3,$5,$2
sll	$4,$4,7
subu	$3,$3,$fp
subu	$2,$3,$4
blez	$2,$L28
move	$3,$0

sll	$2,$17,2
subu	$2,$2,$22
addu	$2,$3,$2
addu	$2,$8,$2
lbu	$3,0($2)
slt	$2,$13,20
sb	$3,255($15)
move	$11,$13
addiu	$18,$18,1
beq	$2,$0,$L55
addiu	$15,$15,1

$L66:
addiu	$13,$13,1
$L30:
lbu	$17,-1($15)
lbu	$3,0($15)
addiu	$2,$17,-2
bne	$3,$2,$L25
nop

b	$L26
li	$14,320			# 0x140

$L64:
b	$L18
li	$14,384			# 0x180

$L28:
subu	$2,$0,$2
sra	$3,$2,5
sll	$2,$17,2
subu	$2,$2,$22
addu	$2,$3,$2
addu	$2,$8,$2
lbu	$3,0($2)
slt	$2,$13,20
sb	$3,255($15)
move	$11,$13
addiu	$18,$18,1
bne	$2,$0,$L66
addiu	$15,$15,1

$L55:
slt	$2,$14,129
bne	$2,$0,$L31
lw	$5,8($sp)

addu	$12,$21,$13
b	$L35
addu	$13,$5,$13

$L67:
sll	$2,$24,2
subu	$2,$2,$22
addu	$2,$4,$2
addu	$2,$8,$2
lbu	$3,0($2)
slt	$4,$14,129
sb	$3,256($12)
addiu	$11,$11,1
addiu	$12,$12,1
bne	$4,$0,$L31
addiu	$13,$13,1

$L35:
sra	$2,$11,$20
sll	$2,$2,2
addu	$15,$23,$2
lw	$2,24($sp)
lbu	$24,0($12)
addu	$5,$16,$2
lw	$2,20($sp)
sll	$4,$24,7
addu	$3,$2,$4
lw	$2,16($sp)
move	$16,$3
addu	$7,$10,$2
lw	$2,12($sp)
addiu	$14,$14,-128
addu	$6,$2,$4
slt	$2,$3,$5
movz	$16,$5,$2
move	$10,$6
slt	$2,$6,$7
movz	$10,$7,$2
addu	$5,$16,$14
subu	$3,$4,$19
slt	$2,$10,$5
slt	$4,$19,$4
sra	$3,$3,2
beq	$4,$0,$L32
movn	$5,$10,$2

subu	$5,$5,$3
$L32:
lw	$2,0($15)
lb	$4,0($13)
slt	$3,$2,$5
movz	$2,$5,$3
sll	$4,$4,7
subu	$2,$2,$fp
subu	$2,$2,$4
bgtz	$2,$L67
move	$4,$0

subu	$2,$0,$2
sra	$4,$2,5
sll	$2,$24,2
subu	$2,$2,$22
addu	$2,$4,$2
addu	$2,$8,$2
lbu	$3,0($2)
slt	$4,$14,129
sb	$3,256($12)
addiu	$11,$11,1
addiu	$12,$12,1
beq	$4,$0,$L35
addiu	$13,$13,1

$L31:
b	$L5
move	$25,$11

$L14:
b	$L16
addu	$10,$6,$2

$L57:
lui	$2,%hi(baptab+156)
addiu	$8,$2,%lo(baptab+156)
b	$L3
sw	$8,8($sp)

.set	macro
.set	reorder
.end	a52_bit_allocate
.data
.align	2
.type	hthtab, @object
.size	hthtab, 600
hthtab:
.word	1840
.word	1840
.word	1984
.word	2048
.word	2080
.word	2112
.word	2128
.word	2128
.word	2144
.word	2144
.word	2144
.word	2144
.word	2144
.word	2160
.word	2160
.word	2160
.word	2176
.word	2176
.word	2192
.word	2192
.word	2208
.word	2208
.word	2224
.word	2224
.word	2240
.word	2240
.word	2256
.word	2272
.word	2288
.word	2304
.word	2320
.word	2320
.word	2320
.word	2320
.word	2304
.word	2288
.word	2240
.word	2160
.word	2080
.word	2016
.word	1952
.word	1904
.word	1888
.word	1952
.word	1984
.word	1984
.word	1760
.word	1024
.word	960
.word	960
.word	1808
.word	1808
.word	1952
.word	2032
.word	2080
.word	2096
.word	2112
.word	2128
.word	2128
.word	2144
.word	2144
.word	2144
.word	2144
.word	2144
.word	2160
.word	2160
.word	2160
.word	2176
.word	2176
.word	2176
.word	2192
.word	2192
.word	2208
.word	2208
.word	2224
.word	2224
.word	2240
.word	2240
.word	2272
.word	2288
.word	2304
.word	2320
.word	2320
.word	2320
.word	2320
.word	2304
.word	2272
.word	2224
.word	2160
.word	2080
.word	2016
.word	1968
.word	1888
.word	1904
.word	1952
.word	1984
.word	1920
.word	1488
.word	960
.word	960
.word	1664
.word	1664
.word	1872
.word	1968
.word	2016
.word	2064
.word	2080
.word	2096
.word	2112
.word	2128
.word	2128
.word	2128
.word	2144
.word	2144
.word	2144
.word	2144
.word	2144
.word	2144
.word	2144
.word	2144
.word	2160
.word	2160
.word	2160
.word	2160
.word	2176
.word	2176
.word	2176
.word	2192
.word	2208
.word	2224
.word	2240
.word	2256
.word	2272
.word	2288
.word	2304
.word	2320
.word	2320
.word	2320
.word	2304
.word	2288
.word	2256
.word	2224
.word	2112
.word	2032
.word	1936
.word	1888
.word	1952
.word	1984
.word	1968
.word	1824
.align	2
.type	baptab, @object
.size	baptab, 305
baptab:
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	16
.byte	14
.byte	14
.byte	14
.byte	14
.byte	14
.byte	14
.byte	14
.byte	14
.byte	12
.byte	12
.byte	12
.byte	12
.byte	11
.byte	11
.byte	11
.byte	11
.byte	10
.byte	10
.byte	10
.byte	10
.byte	9
.byte	9
.byte	9
.byte	9
.byte	8
.byte	8
.byte	8
.byte	8
.byte	7
.byte	7
.byte	7
.byte	7
.byte	6
.byte	6
.byte	6
.byte	6
.byte	5
.byte	5
.byte	5
.byte	5
.byte	4
.byte	4
.byte	-3
.byte	-3
.byte	3
.byte	3
.byte	3
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
.rdata
.align	2
.type	bndtab, @object
.size	bndtab, 120
bndtab:
.word	21
.word	22
.word	23
.word	24
.word	25
.word	26
.word	27
.word	28
.word	31
.word	34
.word	37
.word	40
.word	43
.word	46
.word	49
.word	55
.word	61
.word	67
.word	73
.word	79
.word	85
.word	97
.word	109
.word	121
.word	133
.word	157
.word	181
.word	205
.word	229
.word	253
.align	2
.type	latab, @object
.size	latab, 256
latab:
.byte	-64
.byte	-63
.byte	-62
.byte	-61
.byte	-60
.byte	-59
.byte	-58
.byte	-57
.byte	-56
.byte	-55
.byte	-54
.byte	-53
.byte	-52
.byte	-52
.byte	-51
.byte	-50
.byte	-49
.byte	-48
.byte	-47
.byte	-47
.byte	-46
.byte	-45
.byte	-44
.byte	-44
.byte	-43
.byte	-42
.byte	-41
.byte	-41
.byte	-40
.byte	-39
.byte	-38
.byte	-38
.byte	-37
.byte	-36
.byte	-36
.byte	-35
.byte	-35
.byte	-34
.byte	-33
.byte	-33
.byte	-32
.byte	-32
.byte	-31
.byte	-30
.byte	-30
.byte	-29
.byte	-29
.byte	-28
.byte	-28
.byte	-27
.byte	-27
.byte	-26
.byte	-26
.byte	-25
.byte	-25
.byte	-24
.byte	-24
.byte	-23
.byte	-23
.byte	-22
.byte	-22
.byte	-21
.byte	-21
.byte	-21
.byte	-20
.byte	-20
.byte	-19
.byte	-19
.byte	-19
.byte	-18
.byte	-18
.byte	-18
.byte	-17
.byte	-17
.byte	-17
.byte	-16
.byte	-16
.byte	-16
.byte	-15
.byte	-15
.byte	-15
.byte	-14
.byte	-14
.byte	-14
.byte	-13
.byte	-13
.byte	-13
.byte	-13
.byte	-12
.byte	-12
.byte	-12
.byte	-12
.byte	-11
.byte	-11
.byte	-11
.byte	-11
.byte	-10
.byte	-10
.byte	-10
.byte	-10
.byte	-10
.byte	-9
.byte	-9
.byte	-9
.byte	-9
.byte	-9
.byte	-8
.byte	-8
.byte	-8
.byte	-8
.byte	-8
.byte	-8
.byte	-7
.byte	-7
.byte	-7
.byte	-7
.byte	-7
.byte	-7
.byte	-6
.byte	-6
.byte	-6
.byte	-6
.byte	-6
.byte	-6
.byte	-6
.byte	-6
.byte	-5
.byte	-5
.byte	-5
.byte	-5
.byte	-5
.byte	-5
.byte	-5
.byte	-5
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-4
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
.byte	-3
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
.align	2
.type	floortab.3016, @object
.size	floortab.3016, 32
floortab.3016:
.word	2320
.word	2384
.word	2448
.word	2512
.word	2576
.word	2704
.word	2832
.word	5120
.align	2
.type	dbpbtab.3015, @object
.size	dbpbtab.3015, 16
dbpbtab.3015:
.word	3072
.word	1280
.word	768
.word	256
.align	2
.type	slowgain.3014, @object
.size	slowgain.3014, 16
slowgain.3014:
.word	1344
.word	1240
.word	1144
.word	1040
.ident	"GCC: (GNU) 4.3.3"

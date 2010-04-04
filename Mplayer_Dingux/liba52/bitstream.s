	.file	1 "bitstream.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.abicalls
	.text
	.align	2
	.globl	a52_bitstream_get_bh
	.ent	a52_bitstream_get_bh
	.type	a52_bitstream_get_bh, @function
a52_bitstream_get_bh:
	.set	nomips16
	.frame	$sp,16,$31		# vars= 8, regs= 0/0, args= 0, gp= 8
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	.cprestore	0
	lw	$7,420($4)
	move	$10,$4
	lw	$2,0($7)
	lw	$9,428($4)
	lw	$8,432($4)
	srl	$4,$2,8
	sll	$3,$2,24
	srl	$6,$2,24
	andi	$4,$4,0x00ff
	or	$6,$6,$3
	sll	$4,$4,16
	srl	$2,$2,8
	li	$11,32			# 0x20
	subu	$3,$11,$9
	andi	$2,$2,0xff00
	or	$6,$6,$4
	or	$6,$6,$2
	sll	$8,$8,$3
	addiu	$7,$7,4
	subu	$2,$5,$9
	srl	$3,$8,$3
	sw	$7,420($10)
	beq	$2,$0,$L6
	sw	$6,432($10)

	subu	$4,$11,$2
	sll	$3,$3,$2
	srl	$2,$6,$4
	or	$3,$2,$3
	move	$2,$3
	sw	$4,428($10)
	j	$31
	addiu	$sp,$sp,16

$L6:
	li	$4,32			# 0x20
	move	$2,$3
	sw	$4,428($10)
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	a52_bitstream_get_bh
	.align	2
	.globl	a52_bitstream_get_bh_2
	.ent	a52_bitstream_get_bh_2
	.type	a52_bitstream_get_bh_2, @function
a52_bitstream_get_bh_2:
	.set	nomips16
	.frame	$sp,16,$31		# vars= 8, regs= 0/0, args= 0, gp= 8
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	.cprestore	0
	lw	$7,420($4)
	move	$10,$4
	lw	$2,0($7)
	lw	$9,428($4)
	lw	$8,432($4)
	srl	$4,$2,8
	sll	$3,$2,24
	srl	$6,$2,24
	andi	$4,$4,0x00ff
	or	$6,$6,$3
	sll	$4,$4,16
	srl	$2,$2,8
	li	$11,32			# 0x20
	subu	$3,$11,$9
	andi	$2,$2,0xff00
	or	$6,$6,$4
	or	$6,$6,$2
	sll	$8,$8,$3
	addiu	$7,$7,4
	subu	$2,$5,$9
	sra	$3,$8,$3
	sw	$7,420($10)
	beq	$2,$0,$L11
	sw	$6,432($10)

	subu	$4,$11,$2
	sll	$3,$3,$2
	srl	$2,$6,$4
	or	$3,$2,$3
	move	$2,$3
	sw	$4,428($10)
	j	$31
	addiu	$sp,$sp,16

$L11:
	li	$4,32			# 0x20
	move	$2,$3
	sw	$4,428($10)
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	a52_bitstream_get_bh_2
	.align	2
	.globl	a52_bitstream_set_ptr
	.ent	a52_bitstream_set_ptr
	.type	a52_bitstream_set_ptr, @function
a52_bitstream_set_ptr:
	.set	nomips16
	.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$16,24($sp)
	.cprestore	16
	andi	$2,$5,0x3
	subu	$5,$5,$2
	move	$16,$4
	sw	$5,420($4)
	sw	$0,428($4)
	sw	$0,432($4)
	.option	pic0
	jal	a52_bitstream_get_bh
	.option	pic2
	sll	$5,$2,3

	lw	$2,428($16)
	beq	$2,$0,$L15
	lw	$28,16($sp)

	lw	$31,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,32

$L15:
	move	$4,$16
	lw	$31,28($sp)
	lw	$16,24($sp)
	move	$5,$0
	.option	pic0
	j	a52_bitstream_get_bh_2
	.option	pic2
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	a52_bitstream_set_ptr
	.ident	"GCC: (GNU) 4.3.3"

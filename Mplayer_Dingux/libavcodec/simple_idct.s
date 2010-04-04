	.file	1 "simple_idct.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.abicalls
	.text
	.align	2
	.globl	simple_idct_put
	.ent	simple_idct_put
	.type	simple_idct_put, @function
simple_idct_put:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	li	$2,1518469120			# 0x5a820000
	ori	$2,$2,0x5a82
#APP
 # 403 "simple_idct.c" 1
	S32I2M xr5,$2
 # 0 "" 2
#NO_APP
	li	$3,1984036864			# 0x76420000
	ori	$3,$3,0x30fc
#APP
 # 404 "simple_idct.c" 1
	S32I2M xr6,$3
 # 0 "" 2
#NO_APP
	li	$2,2106195968			# 0x7d8a0000
	ori	$2,$2,0x6a6e
#APP
 # 405 "simple_idct.c" 1
	S32I2M xr7,$2
 # 0 "" 2
#NO_APP
	li	$3,1193082880			# 0x471d0000
	ori	$3,$3,0x18f9
#APP
 # 406 "simple_idct.c" 1
	S32I2M xr8,$3
 # 0 "" 2
#NO_APP
	addiu	$3,$6,16
#APP
 # 410 "simple_idct.c" 1
	S32LDD xr1,$6,0
 # 0 "" 2
#NO_APP
	move	$2,$6
$L2:
#APP
 # 413 "simple_idct.c" 1
	S32LDD xr2,$2,32
 # 0 "" 2
 # 414 "simple_idct.c" 1
	S32LDD xr3,$2,64
 # 0 "" 2
 # 415 "simple_idct.c" 1
	S32LDD xr4,$2,96
 # 0 "" 2
 # 418 "simple_idct.c" 1
	D16MUL xr11,xr5,xr1,xr13,HW
 # 0 "" 2
 # 419 "simple_idct.c" 1
	D16MAC xr11,xr5,xr3,xr13,AA,HW
 # 0 "" 2
 # 420 "simple_idct.c" 1
	D16MUL xr12,xr6,xr2,xr14,HW
 # 0 "" 2
 # 421 "simple_idct.c" 1
	D16MAC xr12,xr6,xr4,xr14,AA,LW
 # 0 "" 2
 # 422 "simple_idct.c" 1
	D32ADD xr11,xr11,xr12,xr12,AS
 # 0 "" 2
 # 424 "simple_idct.c" 1
	D32ADD xr13,xr13,xr14,xr14,AS
 # 0 "" 2
 # 426 "simple_idct.c" 1
	D16MACF xr11,xr0,xr0,xr13,AA,WW
 # 0 "" 2
 # 427 "simple_idct.c" 1
	D16MACF xr12,xr0,xr0,xr14,AA,WW
 # 0 "" 2
 # 429 "simple_idct.c" 1
	D16MUL xr13,xr5,xr1,xr10,HW
 # 0 "" 2
 # 430 "simple_idct.c" 1
	D16MAC xr13,xr5,xr3,xr10,SS,HW
 # 0 "" 2
 # 432 "simple_idct.c" 1
	D16MUL xr14,xr6,xr2,xr9,LW
 # 0 "" 2
 # 433 "simple_idct.c" 1
	D16MAC xr14,xr6,xr4,xr9,SS,HW
 # 0 "" 2
 # 434 "simple_idct.c" 1
	D32ADD xr13,xr13,xr14,xr14,AS
 # 0 "" 2
 # 436 "simple_idct.c" 1
	D32ADD xr10,xr10,xr9,xr9,AS
 # 0 "" 2
 # 438 "simple_idct.c" 1
	D16MACF xr13,xr0,xr0,xr10,AA,WW
 # 0 "" 2
 # 439 "simple_idct.c" 1
	D16MACF xr14,xr0,xr0,xr9,AA,WW
 # 0 "" 2
 # 442 "simple_idct.c" 1
	S32LDD xr1,$2,16
 # 0 "" 2
 # 443 "simple_idct.c" 1
	S32LDD xr2,$2,48
 # 0 "" 2
 # 444 "simple_idct.c" 1
	S32LDD xr3,$2,80
 # 0 "" 2
 # 445 "simple_idct.c" 1
	S32LDD xr4,$2,112
 # 0 "" 2
 # 449 "simple_idct.c" 1
	D16MUL xr9,xr7,xr1,xr10,HW
 # 0 "" 2
 # 450 "simple_idct.c" 1
	D16MAC xr9,xr7,xr2,xr10,AA,LW
 # 0 "" 2
 # 451 "simple_idct.c" 1
	D16MAC xr9,xr8,xr3,xr10,AA,HW
 # 0 "" 2
 # 453 "simple_idct.c" 1
	D16MAC xr9,xr8,xr4,xr10,AA,LW
 # 0 "" 2
 # 455 "simple_idct.c" 1
	D16MACF xr9,xr0,xr0,xr10,AA,WW
 # 0 "" 2
 # 457 "simple_idct.c" 1
	D16MUL xr10,xr7,xr1,xr15,LW
 # 0 "" 2
 # 458 "simple_idct.c" 1
	D16MAC xr10,xr8,xr2,xr15,SS,LW
 # 0 "" 2
 # 459 "simple_idct.c" 1
	D16MAC xr10,xr7,xr3,xr15,SS,HW
 # 0 "" 2
 # 461 "simple_idct.c" 1
	D16MAC xr10,xr8,xr4,xr15,SS,HW
 # 0 "" 2
 # 463 "simple_idct.c" 1
	D16MACF xr10,xr0,xr0,xr15,AA,WW
 # 0 "" 2
 # 465 "simple_idct.c" 1
	Q16ADD xr11,xr11,xr9,xr9,AS,WW
 # 0 "" 2
 # 466 "simple_idct.c" 1
	S32STD xr11,$2,0
 # 0 "" 2
 # 467 "simple_idct.c" 1
	S32STD xr9,$2,112
 # 0 "" 2
 # 468 "simple_idct.c" 1
	Q16ADD xr13,xr13,xr10,xr10,AS,WW
 # 0 "" 2
 # 469 "simple_idct.c" 1
	S32STD xr13,$2,16
 # 0 "" 2
 # 470 "simple_idct.c" 1
	S32STD xr10,$2,96
 # 0 "" 2
 # 472 "simple_idct.c" 1
	D16MUL xr9,xr8,xr1,xr10,HW
 # 0 "" 2
 # 473 "simple_idct.c" 1
	D16MAC xr9,xr7,xr2,xr10,SS,HW
 # 0 "" 2
 # 474 "simple_idct.c" 1
	D16MAC xr9,xr8,xr3,xr10,AA,LW
 # 0 "" 2
 # 476 "simple_idct.c" 1
	D16MAC xr9,xr7,xr4,xr10,AA,LW
 # 0 "" 2
 # 478 "simple_idct.c" 1
	D16MACF xr9,xr0,xr0,xr10,AA,WW
 # 0 "" 2
 # 480 "simple_idct.c" 1
	D16MUL xr10,xr8,xr1,xr15,LW
 # 0 "" 2
 # 481 "simple_idct.c" 1
	D16MAC xr10,xr8,xr2,xr15,SS,HW
 # 0 "" 2
 # 482 "simple_idct.c" 1
	D16MAC xr10,xr7,xr3,xr15,AA,LW
 # 0 "" 2
 # 484 "simple_idct.c" 1
	D16MAC xr10,xr7,xr4,xr15,SS,HW
 # 0 "" 2
 # 486 "simple_idct.c" 1
	D16MACF xr10,xr0,xr0,xr15,AA,WW
 # 0 "" 2
 # 488 "simple_idct.c" 1
	Q16ADD xr14,xr14,xr9,xr9,AS,WW
 # 0 "" 2
 # 489 "simple_idct.c" 1
	S32STD xr14,$2,32
 # 0 "" 2
 # 490 "simple_idct.c" 1
	S32STD xr9,$2,80
 # 0 "" 2
 # 491 "simple_idct.c" 1
	Q16ADD xr12,xr12,xr10,xr10,AS,WW
 # 0 "" 2
 # 492 "simple_idct.c" 1
	S32LDI xr1,$2,4
 # 0 "" 2
 # 493 "simple_idct.c" 1
	S32STD xr12,$2,44
 # 0 "" 2
 # 494 "simple_idct.c" 1
	S32STD xr10,$2,60
 # 0 "" 2
#NO_APP
	bne	$2,$3,$L2
	addiu	$2,$6,128
#APP
 # 500 "simple_idct.c" 1
	S32LDD xr1,$6,0
 # 0 "" 2
#NO_APP
$L3:
#APP
 # 502 "simple_idct.c" 1
	S32LDD xr2,$6,4
 # 0 "" 2
 # 503 "simple_idct.c" 1
	S32LDD xr3,$6,8
 # 0 "" 2
 # 504 "simple_idct.c" 1
	S32LDD xr4,$6,12
 # 0 "" 2
 # 507 "simple_idct.c" 1
	D16MUL xr11,xr1,xr7,xr12,HW
 # 0 "" 2
 # 508 "simple_idct.c" 1
	D16MUL xr13,xr1,xr8,xr14,HW
 # 0 "" 2
 # 509 "simple_idct.c" 1
	D16MAC xr13,xr2,xr7,xr11,SA,HW
 # 0 "" 2
 # 510 "simple_idct.c" 1
	D16MAC xr14,xr2,xr8,xr12,SS,HW
 # 0 "" 2
 # 511 "simple_idct.c" 1
	D16MAC xr12,xr3,xr7,xr14,SA,HW
 # 0 "" 2
 # 513 "simple_idct.c" 1
	D16MAC xr11,xr3,xr8,xr13,AA,HW
 # 0 "" 2
 # 516 "simple_idct.c" 1
	D16MUL xr9,xr1,xr5,xr10,LW
 # 0 "" 2
 # 517 "simple_idct.c" 1
	D16MAC xr9,xr3,xr5,xr10,AS,LW
 # 0 "" 2
 # 518 "simple_idct.c" 1
	D16MUL xr1,xr2,xr6,xr3,LW
 # 0 "" 2
 # 519 "simple_idct.c" 1
	D16MAC xr3,xr4,xr6,xr1,SA,LW
 # 0 "" 2
 # 521 "simple_idct.c" 1
	D16MAC xr12,xr4,xr8,xr11,SA,HW
 # 0 "" 2
 # 523 "simple_idct.c" 1
	D16MAC xr14,xr4,xr7,xr13,SA,HW
 # 0 "" 2
 # 526 "simple_idct.c" 1
	D32ADD xr2,xr9,xr1,xr4,AS
 # 0 "" 2
 # 528 "simple_idct.c" 1
	D32ADD xr9,xr10,xr3,xr1,AS
 # 0 "" 2
 # 531 "simple_idct.c" 1
	D32ADD xr2,xr2,xr11,xr11,AS
 # 0 "" 2
 # 532 "simple_idct.c" 1
	D32ADD xr4,xr4,xr14,xr14,AS
 # 0 "" 2
 # 533 "simple_idct.c" 1
	D32ADD xr9,xr9,xr12,xr12,AS
 # 0 "" 2
 # 534 "simple_idct.c" 1
	D32ADD xr1,xr1,xr13,xr13,AS
 # 0 "" 2
 # 536 "simple_idct.c" 1
	D16MACF xr9,xr0,xr0,xr2,AA,WW
 # 0 "" 2
 # 537 "simple_idct.c" 1
	D16MACF xr4,xr0,xr0,xr1,AA,WW
 # 0 "" 2
 # 538 "simple_idct.c" 1
	D16MACF xr13,xr0,xr0,xr14,AA,WW
 # 0 "" 2
 # 539 "simple_idct.c" 1
	D16MACF xr11,xr0,xr0,xr12,AA,WW
 # 0 "" 2
 # 541 "simple_idct.c" 1
	Q16SAT xr4,xr4,xr9
 # 0 "" 2
 # 542 "simple_idct.c" 1
	Q16SAT xr11,xr11,xr13
 # 0 "" 2
 # 543 "simple_idct.c" 1
	S32LDI xr1,$6,16
 # 0 "" 2
 # 544 "simple_idct.c" 1
	S32STD xr4,$4,0
 # 0 "" 2
 # 545 "simple_idct.c" 1
	S32STD xr11,$4,4
 # 0 "" 2
#NO_APP
	.set	noreorder
	.set	nomacro
	bne	$6,$2,$L3
	addu	$4,$4,$5
	.set	macro
	.set	reorder

	j	$31
	.end	simple_idct_put
	.align	2
	.globl	simple_idct_add
	.ent	simple_idct_add
	.type	simple_idct_add, @function
simple_idct_add:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	li	$2,1518469120			# 0x5a820000
	ori	$2,$2,0x5a82
#APP
 # 566 "simple_idct.c" 1
	S32I2M xr5,$2
 # 0 "" 2
#NO_APP
	li	$3,1984036864			# 0x76420000
	ori	$3,$3,0x30fc
#APP
 # 567 "simple_idct.c" 1
	S32I2M xr6,$3
 # 0 "" 2
#NO_APP
	li	$2,2106195968			# 0x7d8a0000
	ori	$2,$2,0x6a6e
#APP
 # 568 "simple_idct.c" 1
	S32I2M xr7,$2
 # 0 "" 2
#NO_APP
	li	$3,1193082880			# 0x471d0000
	ori	$3,$3,0x18f9
#APP
 # 569 "simple_idct.c" 1
	S32I2M xr8,$3
 # 0 "" 2
#NO_APP
	addiu	$3,$6,16
#APP
 # 573 "simple_idct.c" 1
	S32LDD xr1,$6,0
 # 0 "" 2
#NO_APP
	move	$2,$6
$L9:
#APP
 # 576 "simple_idct.c" 1
	S32LDD xr2,$2,32
 # 0 "" 2
 # 577 "simple_idct.c" 1
	S32LDD xr3,$2,64
 # 0 "" 2
 # 578 "simple_idct.c" 1
	S32LDD xr4,$2,96
 # 0 "" 2
 # 581 "simple_idct.c" 1
	D16MUL xr11,xr5,xr1,xr13,HW
 # 0 "" 2
 # 582 "simple_idct.c" 1
	D16MAC xr11,xr5,xr3,xr13,AA,HW
 # 0 "" 2
 # 583 "simple_idct.c" 1
	D16MUL xr12,xr6,xr2,xr14,HW
 # 0 "" 2
 # 584 "simple_idct.c" 1
	D16MAC xr12,xr6,xr4,xr14,AA,LW
 # 0 "" 2
 # 585 "simple_idct.c" 1
	D32ADD xr11,xr11,xr12,xr12,AS
 # 0 "" 2
 # 587 "simple_idct.c" 1
	D32ADD xr13,xr13,xr14,xr14,AS
 # 0 "" 2
 # 589 "simple_idct.c" 1
	D16MACF xr11,xr0,xr0,xr13,AA,WW
 # 0 "" 2
 # 590 "simple_idct.c" 1
	D16MACF xr12,xr0,xr0,xr14,AA,WW
 # 0 "" 2
 # 592 "simple_idct.c" 1
	D16MUL xr13,xr5,xr1,xr10,HW
 # 0 "" 2
 # 593 "simple_idct.c" 1
	D16MAC xr13,xr5,xr3,xr10,SS,HW
 # 0 "" 2
 # 595 "simple_idct.c" 1
	D16MUL xr14,xr6,xr2,xr9,LW
 # 0 "" 2
 # 596 "simple_idct.c" 1
	D16MAC xr14,xr6,xr4,xr9,SS,HW
 # 0 "" 2
 # 597 "simple_idct.c" 1
	D32ADD xr13,xr13,xr14,xr14,AS
 # 0 "" 2
 # 599 "simple_idct.c" 1
	D32ADD xr10,xr10,xr9,xr9,AS
 # 0 "" 2
 # 601 "simple_idct.c" 1
	D16MACF xr13,xr0,xr0,xr10,AA,WW
 # 0 "" 2
 # 602 "simple_idct.c" 1
	D16MACF xr14,xr0,xr0,xr9,AA,WW
 # 0 "" 2
 # 605 "simple_idct.c" 1
	S32LDD xr1,$2,16
 # 0 "" 2
 # 606 "simple_idct.c" 1
	S32LDD xr2,$2,48
 # 0 "" 2
 # 607 "simple_idct.c" 1
	S32LDD xr3,$2,80
 # 0 "" 2
 # 608 "simple_idct.c" 1
	S32LDD xr4,$2,112
 # 0 "" 2
 # 612 "simple_idct.c" 1
	D16MUL xr9,xr7,xr1,xr10,HW
 # 0 "" 2
 # 613 "simple_idct.c" 1
	D16MAC xr9,xr7,xr2,xr10,AA,LW
 # 0 "" 2
 # 614 "simple_idct.c" 1
	D16MAC xr9,xr8,xr3,xr10,AA,HW
 # 0 "" 2
 # 616 "simple_idct.c" 1
	D16MAC xr9,xr8,xr4,xr10,AA,LW
 # 0 "" 2
 # 618 "simple_idct.c" 1
	D16MACF xr9,xr0,xr0,xr10,AA,WW
 # 0 "" 2
 # 620 "simple_idct.c" 1
	D16MUL xr10,xr7,xr1,xr15,LW
 # 0 "" 2
 # 621 "simple_idct.c" 1
	D16MAC xr10,xr8,xr2,xr15,SS,LW
 # 0 "" 2
 # 622 "simple_idct.c" 1
	D16MAC xr10,xr7,xr3,xr15,SS,HW
 # 0 "" 2
 # 624 "simple_idct.c" 1
	D16MAC xr10,xr8,xr4,xr15,SS,HW
 # 0 "" 2
 # 626 "simple_idct.c" 1
	D16MACF xr10,xr0,xr0,xr15,AA,WW
 # 0 "" 2
 # 628 "simple_idct.c" 1
	Q16ADD xr11,xr11,xr9,xr9,AS,WW
 # 0 "" 2
 # 629 "simple_idct.c" 1
	S32STD xr11,$2,0
 # 0 "" 2
 # 630 "simple_idct.c" 1
	S32STD xr9,$2,112
 # 0 "" 2
 # 631 "simple_idct.c" 1
	Q16ADD xr13,xr13,xr10,xr10,AS,WW
 # 0 "" 2
 # 632 "simple_idct.c" 1
	S32STD xr13,$2,16
 # 0 "" 2
 # 633 "simple_idct.c" 1
	S32STD xr10,$2,96
 # 0 "" 2
 # 635 "simple_idct.c" 1
	D16MUL xr9,xr8,xr1,xr10,HW
 # 0 "" 2
 # 636 "simple_idct.c" 1
	D16MAC xr9,xr7,xr2,xr10,SS,HW
 # 0 "" 2
 # 637 "simple_idct.c" 1
	D16MAC xr9,xr8,xr3,xr10,AA,LW
 # 0 "" 2
 # 639 "simple_idct.c" 1
	D16MAC xr9,xr7,xr4,xr10,AA,LW
 # 0 "" 2
 # 641 "simple_idct.c" 1
	D16MACF xr9,xr0,xr0,xr10,AA,WW
 # 0 "" 2
 # 643 "simple_idct.c" 1
	D16MUL xr10,xr8,xr1,xr15,LW
 # 0 "" 2
 # 644 "simple_idct.c" 1
	D16MAC xr10,xr8,xr2,xr15,SS,HW
 # 0 "" 2
 # 645 "simple_idct.c" 1
	D16MAC xr10,xr7,xr3,xr15,AA,LW
 # 0 "" 2
 # 647 "simple_idct.c" 1
	D16MAC xr10,xr7,xr4,xr15,SS,HW
 # 0 "" 2
 # 649 "simple_idct.c" 1
	D16MACF xr10,xr0,xr0,xr15,AA,WW
 # 0 "" 2
 # 651 "simple_idct.c" 1
	Q16ADD xr14,xr14,xr9,xr9,AS,WW
 # 0 "" 2
 # 652 "simple_idct.c" 1
	S32STD xr14,$2,32
 # 0 "" 2
 # 653 "simple_idct.c" 1
	S32STD xr9,$2,80
 # 0 "" 2
 # 654 "simple_idct.c" 1
	Q16ADD xr12,xr12,xr10,xr10,AS,WW
 # 0 "" 2
 # 655 "simple_idct.c" 1
	S32LDI xr1,$2,4
 # 0 "" 2
 # 656 "simple_idct.c" 1
	S32STD xr12,$2,44
 # 0 "" 2
 # 657 "simple_idct.c" 1
	S32STD xr10,$2,60
 # 0 "" 2
#NO_APP
	bne	$2,$3,$L9
	addiu	$2,$6,128
#APP
 # 662 "simple_idct.c" 1
	S32LDD xr1,$6,0
 # 0 "" 2
#NO_APP
$L10:
#APP
 # 665 "simple_idct.c" 1
	S32LDD xr2,$6,4
 # 0 "" 2
 # 666 "simple_idct.c" 1
	S32LDD xr3,$6,8
 # 0 "" 2
 # 667 "simple_idct.c" 1
	S32LDD xr4,$6,12
 # 0 "" 2
 # 670 "simple_idct.c" 1
	D16MUL xr11,xr1,xr7,xr12,HW
 # 0 "" 2
 # 671 "simple_idct.c" 1
	D16MUL xr13,xr1,xr8,xr14,HW
 # 0 "" 2
 # 672 "simple_idct.c" 1
	D16MAC xr13,xr2,xr7,xr11,SA,HW
 # 0 "" 2
 # 673 "simple_idct.c" 1
	D16MAC xr14,xr2,xr8,xr12,SS,HW
 # 0 "" 2
 # 674 "simple_idct.c" 1
	D16MAC xr12,xr3,xr7,xr14,SA,HW
 # 0 "" 2
 # 676 "simple_idct.c" 1
	D16MAC xr11,xr3,xr8,xr13,AA,HW
 # 0 "" 2
 # 679 "simple_idct.c" 1
	D16MUL xr9,xr1,xr5,xr10,LW
 # 0 "" 2
 # 680 "simple_idct.c" 1
	D16MAC xr9,xr3,xr5,xr10,AS,LW
 # 0 "" 2
 # 681 "simple_idct.c" 1
	D16MUL xr1,xr2,xr6,xr3,LW
 # 0 "" 2
 # 682 "simple_idct.c" 1
	D16MAC xr3,xr4,xr6,xr1,SA,LW
 # 0 "" 2
 # 684 "simple_idct.c" 1
	D16MAC xr12,xr4,xr8,xr11,SA,HW
 # 0 "" 2
 # 686 "simple_idct.c" 1
	D16MAC xr14,xr4,xr7,xr13,SA,HW
 # 0 "" 2
 # 689 "simple_idct.c" 1
	D32ADD xr2,xr9,xr1,xr4,AS
 # 0 "" 2
 # 691 "simple_idct.c" 1
	D32ADD xr9,xr10,xr3,xr1,AS
 # 0 "" 2
 # 694 "simple_idct.c" 1
	D32ADD xr2,xr2,xr11,xr11,AS
 # 0 "" 2
 # 695 "simple_idct.c" 1
	D32ADD xr4,xr4,xr14,xr14,AS
 # 0 "" 2
 # 696 "simple_idct.c" 1
	D32ADD xr9,xr9,xr12,xr12,AS
 # 0 "" 2
 # 697 "simple_idct.c" 1
	D32ADD xr1,xr1,xr13,xr13,AS
 # 0 "" 2
 # 699 "simple_idct.c" 1
	D16MACF xr9,xr0,xr0,xr2,AA,WW
 # 0 "" 2
 # 700 "simple_idct.c" 1
	D16MACF xr4,xr0,xr0,xr1,AA,WW
 # 0 "" 2
 # 701 "simple_idct.c" 1
	D16MACF xr13,xr0,xr0,xr14,AA,WW
 # 0 "" 2
 # 702 "simple_idct.c" 1
	D16MACF xr11,xr0,xr0,xr12,AA,WW
 # 0 "" 2
 # 703 "simple_idct.c" 1
	S32LDD xr1,$4,0
 # 0 "" 2
 # 704 "simple_idct.c" 1
	S32LDD xr2,$4,4
 # 0 "" 2
 # 705 "simple_idct.c" 1
	Q8ACCE xr4,xr1,xr0,xr9,AA
 # 0 "" 2
 # 706 "simple_idct.c" 1
	Q8ACCE xr11,xr2,xr0,xr13,AA
 # 0 "" 2
 # 707 "simple_idct.c" 1
	S32LDI xr1,$6,16
 # 0 "" 2
 # 709 "simple_idct.c" 1
	Q16SAT xr4,xr4,xr9
 # 0 "" 2
 # 710 "simple_idct.c" 1
	Q16SAT xr11,xr11,xr13
 # 0 "" 2
 # 711 "simple_idct.c" 1
	S32STD xr4,$4,0
 # 0 "" 2
 # 712 "simple_idct.c" 1
	S32STD xr11,$4,4
 # 0 "" 2
#NO_APP
	.set	noreorder
	.set	nomacro
	bne	$6,$2,$L10
	addu	$4,$4,$5
	.set	macro
	.set	reorder

	j	$31
	.end	simple_idct_add
	.align	2
	.globl	simple_idct48_add
	.ent	simple_idct48_add
	.type	simple_idct48_add, @function
simple_idct48_add:
	.set	nomips16
	.frame	$sp,56,$31		# vars= 8, regs= 9/0, args= 0, gp= 8
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-56
	addiu	$28,$28,%lo(__gnu_local_gp)
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
	move	$12,$6
	move	$18,$4
	move	$15,$5
	move	$9,$6
	move	$10,$0
	li	$13,23170			# 0x5a82
	li	$11,12540			# 0x30fc
	li	$17,30274			# 0x7642
	li	$16,-30274			# 0xffffffffffff89be
	li	$14,8			# 0x8
$L15:
	lh	$3,0($9)
	lh	$2,4($9)
	lh	$5,2($9)
	subu	$4,$3,$2
	addu	$2,$2,$3
	lh	$3,6($9)
	mul	$6,$5,$17
	mul	$8,$5,$11
	mul	$5,$3,$16
	mul	$2,$2,$13
	addu	$7,$5,$8
	mul	$4,$4,$13
	mul	$5,$3,$11
	addiu	$2,$2,1024
	addu	$3,$5,$6
	addiu	$4,$4,1024
	subu	$5,$4,$7
	subu	$6,$2,$3
	addu	$4,$4,$7
	addu	$2,$2,$3
	sra	$2,$2,11
	sra	$4,$4,11
	sra	$5,$5,11
	sra	$6,$6,11
	addiu	$10,$10,1
	sh	$2,0($9)
	sh	$4,2($9)
	sh	$5,4($9)
	sh	$6,6($9)
	bne	$10,$14,$L15
	addiu	$9,$9,16

	sll	$4,$15,1
	addu	$5,$15,$4
	addu	$6,$15,$5
	addu	$7,$6,$15
	addu	$8,$15,$7
	lw	$2,%got(ff_cropTbl)($28)
	move	$14,$18
	addu	$3,$8,$15
	addu	$21,$18,$3
	addu	$20,$18,$15
	addu	$19,$18,$4
	addiu	$24,$2,1024
	addu	$18,$18,$5
	addu	$17,$14,$6
	addu	$16,$14,$7
	addu	$25,$14,$8
	move	$22,$0
	li	$23,19266			# 0x4b42
	li	$fp,-22725			# 0xffffffffffffa73b
$L20:
	lh	$2,48($12)
	lh	$5,0($12)
	li	$3,-12873			# 0xffffffffffffcdb7
	mul	$7,$2,$3
	li	$3,-4520			# 0xffffffffffffee58
	mul	$11,$2,$3
	li	$6,458752			# 0x70000
	sll	$3,$5,14
	subu	$3,$3,$5
	ori	$6,$6,0xffe0
	mul	$9,$2,$23
	mul	$13,$2,$fp
	lh	$4,32($12)
	addu	$3,$3,$6
	sw	$3,8($sp)
	mtlo	$3
	li	$3,-21407			# 0xffffffffffffac61
	madd	$4,$3
	lh	$2,16($12)
	li	$3,4520			# 0x11a8
	mflo	$8
	mul	$10,$2,$3
	li	$3,22725			# 0x58c5
	addu	$6,$10,$7
	mul	$7,$2,$3
	mul	$3,$2,$23
	addu	$15,$7,$9
	addu	$11,$3,$11
	li	$3,12873			# 0x3249
	mul	$7,$2,$3
	lw	$2,8($sp)
	addu	$9,$7,$13
	mtlo	$2
	li	$2,21407			# 0x539f
	madd	$4,$2
	lw	$2,8($sp)
	mflo	$13
	mtlo	$2
	li	$2,8867			# 0x22a3
	madd	$4,$2
	lw	$2,8($sp)
	mflo	$10
	mtlo	$2
	li	$2,-8867			# 0xffffffffffffdd5d
	madd	$4,$2
	lh	$5,64($12)
	beq	$5,$0,$L16
	mflo	$7

	sll	$2,$5,14
	subu	$2,$2,$5
	subu	$3,$0,$2
	addu	$7,$7,$3
	addu	$8,$8,$2
	addu	$13,$13,$2
	addu	$10,$10,$3
$L16:
	lh	$2,80($12)
	beq	$2,$0,$L17
	mul	$3,$2,$23

	addu	$6,$3,$6
	li	$3,12873			# 0x3249
	mul	$4,$2,$3
	mul	$3,$2,$fp
	addu	$15,$4,$15
	addu	$11,$3,$11
	li	$3,4520			# 0x11a8
	mul	$4,$2,$3
	addu	$9,$4,$9
$L17:
	lh	$2,96($12)
	beq	$2,$0,$L18
	li	$3,-8867			# 0xffffffffffffdd5d

	mul	$4,$2,$3
	li	$3,8867			# 0x22a3
	addu	$8,$4,$8
	mul	$4,$2,$3
	li	$3,-21407			# 0xffffffffffffac61
	addu	$13,$4,$13
	mul	$4,$2,$3
	li	$3,21407			# 0x539f
	addu	$10,$4,$10
	mul	$4,$2,$3
	addu	$7,$4,$7
$L18:
	lh	$2,112($12)
	beq	$2,$0,$L19
	mul	$3,$2,$fp

	addu	$6,$3,$6
	li	$3,4520			# 0x11a8
	mul	$4,$2,$3
	li	$3,-12873			# 0xffffffffffffcdb7
	addu	$15,$4,$15
	mul	$4,$2,$3
	mul	$3,$2,$23
	addu	$11,$4,$11
	addu	$9,$3,$9
$L19:
	lbu	$3,0($14)
	addu	$2,$15,$13
	sra	$2,$2,20
	addu	$2,$2,$3
	addu	$2,$24,$2
	lbu	$4,0($2)
	addu	$3,$11,$10
	sb	$4,0($14)
	lbu	$2,0($20)
	sra	$3,$3,20
	addu	$3,$3,$2
	addu	$3,$24,$3
	lbu	$4,0($3)
	addu	$2,$9,$7
	sb	$4,0($20)
	lbu	$3,0($19)
	sra	$2,$2,20
	addu	$2,$2,$3
	addu	$2,$24,$2
	lbu	$4,0($2)
	addu	$3,$6,$8
	sb	$4,0($19)
	lbu	$2,0($18)
	sra	$3,$3,20
	addu	$3,$3,$2
	addu	$3,$24,$3
	lbu	$4,0($3)
	subu	$2,$8,$6
	sb	$4,0($18)
	lbu	$3,0($17)
	sra	$2,$2,20
	addu	$2,$2,$3
	addu	$2,$24,$2
	lbu	$4,0($2)
	subu	$3,$7,$9
	sb	$4,0($17)
	lbu	$2,0($16)
	sra	$3,$3,20
	addu	$3,$3,$2
	addu	$3,$24,$3
	lbu	$4,0($3)
	subu	$2,$10,$11
	sb	$4,0($16)
	lbu	$3,0($25)
	sra	$2,$2,20
	addu	$2,$2,$3
	addu	$2,$24,$2
	lbu	$4,0($2)
	subu	$3,$13,$15
	sb	$4,0($25)
	lbu	$2,0($21)
	sra	$3,$3,20
	addu	$3,$3,$2
	addu	$3,$24,$3
	lbu	$2,0($3)
	addiu	$22,$22,1
	li	$4,4			# 0x4
	sb	$2,0($21)
	addiu	$12,$12,2
	addiu	$14,$14,1
	addiu	$20,$20,1
	addiu	$19,$19,1
	addiu	$18,$18,1
	addiu	$17,$17,1
	addiu	$16,$16,1
	addiu	$25,$25,1
	bne	$22,$4,$L20
	addiu	$21,$21,1

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
	.end	simple_idct48_add
	.align	2
	.globl	disable_jz4740_mxu
	.ent	disable_jz4740_mxu
	.type	disable_jz4740_mxu, @function
disable_jz4740_mxu:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
#APP
 # 909 "simple_idct.c" 1
	S32I2M xr16,$4
 # 0 "" 2
#NO_APP
	.set	noreorder
	.set	nomacro
	j	$31
	move	$2,$0
	.set	macro
	.set	reorder

	.end	disable_jz4740_mxu
	.align	2
	.globl	enable_jz4740_mxu
	.ent	enable_jz4740_mxu
	.type	enable_jz4740_mxu, @function
enable_jz4740_mxu:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
#APP
 # 916 "simple_idct.c" 1
	S32M2I xr16, $2
 # 0 "" 2
#NO_APP
	ori	$3,$2,0x7
#APP
 # 918 "simple_idct.c" 1
	S32I2M xr16,$3
 # 0 "" 2
#NO_APP
	j	$31
	.end	enable_jz4740_mxu
	.align	2
	.globl	simple_idct248_put
	.ent	simple_idct248_put
	.type	simple_idct248_put, @function
simple_idct248_put:
	.set	nomips16
	.frame	$sp,72,$31		# vars= 24, regs= 9/0, args= 0, gp= 8
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-72
	addiu	$28,$28,%lo(__gnu_local_gp)
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
	sw	$6,80($sp)
	sw	$4,72($sp)
	sw	$5,76($sp)
	move	$fp,$6
	move	$25,$0
$L29:
	lhu	$17,0($fp)
	lhu	$2,16($fp)
	lhu	$16,2($fp)
	lhu	$3,18($fp)
	subu	$18,$17,$2
	lhu	$15,4($fp)
	lhu	$4,20($fp)
	lhu	$14,6($fp)
	lhu	$5,22($fp)
	lhu	$13,8($fp)
	lhu	$6,24($fp)
	lhu	$12,10($fp)
	lhu	$7,26($fp)
	lhu	$11,12($fp)
	lhu	$8,28($fp)
	lhu	$10,14($fp)
	lhu	$9,30($fp)
	sw	$18,20($sp)
	addu	$2,$2,$17
	sh	$2,0($fp)
	subu	$19,$16,$3
	lw	$2,20($sp)
	addu	$3,$3,$16
	sh	$3,2($fp)
	subu	$20,$15,$4
	subu	$21,$14,$5
	subu	$22,$13,$6
	subu	$23,$12,$7
	subu	$24,$11,$8
	subu	$18,$10,$9
	addu	$4,$4,$15
	addu	$5,$5,$14
	addu	$6,$6,$13
	addu	$7,$7,$12
	addu	$8,$8,$11
	addu	$9,$9,$10
	addiu	$25,$25,1
	li	$3,4			# 0x4
	sh	$2,16($fp)
	sh	$19,18($fp)
	sh	$4,4($fp)
	sh	$20,20($fp)
	sh	$5,6($fp)
	sh	$21,22($fp)
	sh	$6,8($fp)
	sh	$22,24($fp)
	sh	$7,10($fp)
	sh	$23,26($fp)
	sh	$8,12($fp)
	sh	$24,28($fp)
	sh	$9,14($fp)
	sh	$18,30($fp)
	bne	$25,$3,$L29
	addiu	$fp,$fp,32

	lw	$4,80($sp)
	move	$21,$0
	addiu	$11,$4,8
	addiu	$20,$4,12
	addiu	$23,$4,14
	addiu	$22,$4,10
	li	$24,19266			# 0x4b42
	li	$fp,-22725			# 0xffffffffffffa73b
	b	$L34
	li	$25,4520			# 0x11a8

$L30:
	lh	$3,-2($11)
	lh	$4,-8($11)
	li	$2,-12873			# 0xffffffffffffcdb7
	mul	$6,$3,$2
	li	$2,-4520			# 0xffffffffffffee58
	mul	$10,$3,$2
	sll	$2,$4,14
	mul	$12,$3,$fp
	subu	$2,$2,$4
	mul	$8,$3,$24
	lh	$3,-4($11)
	addiu	$9,$2,1024
	li	$2,-21407			# 0xffffffffffffac61
	mul	$4,$3,$2
	mul	$2,$5,$25
	addu	$19,$4,$9
	addu	$18,$2,$6
	li	$2,22725			# 0x58c5
	mul	$4,$5,$2
	mul	$2,$5,$24
	addu	$17,$4,$8
	addu	$16,$2,$10
	li	$2,12873			# 0x3249
	mul	$4,$5,$2
	li	$2,21407			# 0x539f
	addu	$15,$4,$12
	mul	$4,$3,$2
	li	$2,8867			# 0x22a3
	addu	$12,$4,$9
	mul	$4,$3,$2
	li	$2,-8867			# 0xffffffffffffdd5d
	addu	$13,$4,$9
	mul	$4,$3,$2
	beq	$7,$0,$L33
	addu	$14,$4,$9

	lh	$2,0($22)
	lh	$4,0($11)
	mul	$3,$2,$24
	mul	$9,$2,$fp
	sw	$3,16($sp)
	li	$3,12873			# 0x3249
	mul	$7,$2,$3
	sll	$3,$4,14
	mul	$10,$2,$25
	lh	$5,0($20)
	subu	$3,$3,$4
	mtlo	$3
	li	$4,-8867			# 0xffffffffffffdd5d
	madd	$5,$4
	lh	$2,0($23)
	mflo	$4
	subu	$8,$0,$3
	sw	$4,28($sp)
	lw	$4,16($sp)
	lw	$6,28($sp)
	mtlo	$4
	madd	$2,$fp
	addu	$19,$19,$6
	mflo	$4
	mtlo	$8
	sw	$4,16($sp)
	li	$4,21407			# 0x539f
	madd	$5,$4
	lw	$6,16($sp)
	mflo	$4
	addu	$18,$18,$6
	sw	$4,24($sp)
	mul	$4,$2,$25
	lw	$6,24($sp)
	addu	$7,$4,$7
	li	$4,-12873			# 0xffffffffffffcdb7
	addu	$14,$14,$6
	mul	$6,$2,$4
	mul	$4,$2,$24
	addu	$9,$6,$9
	addu	$2,$4,$10
	addu	$15,$15,$2
	li	$4,8867			# 0x22a3
	li	$2,-21407			# 0xffffffffffffac61
	mul	$6,$5,$4
	mul	$4,$5,$2
	addu	$3,$6,$3
	addu	$5,$4,$8
	addu	$17,$17,$7
	addu	$16,$16,$9
	addu	$12,$12,$3
	addu	$13,$13,$5
$L33:
	subu	$6,$12,$17
	addu	$2,$17,$12
	sra	$6,$6,11
	subu	$7,$13,$16
	subu	$8,$14,$15
	subu	$9,$19,$18
	addu	$3,$16,$13
	addu	$4,$15,$14
	addu	$5,$18,$19
	sra	$2,$2,11
	sh	$2,-8($11)
	sra	$3,$3,11
	sh	$6,0($23)
	sra	$7,$7,11
	sra	$4,$4,11
	sra	$8,$8,11
	sra	$5,$5,11
	sra	$9,$9,11
	addiu	$21,$21,1
	li	$6,8			# 0x8
	sh	$3,-6($11)
	addiu	$23,$23,16
	sh	$7,0($20)
	sh	$4,-4($11)
	addiu	$20,$20,16
	sh	$8,0($22)
	sh	$5,-2($11)
	sh	$9,0($11)
	addiu	$22,$22,16
	beq	$21,$6,$L40
	addiu	$11,$11,16

$L34:
	lw	$2,0($11)
	lw	$3,-4($11)
	lw	$4,0($20)
	or	$3,$2,$3
	lh	$5,-6($11)
	or	$3,$3,$4
	or	$3,$3,$5
	bne	$3,$0,$L30
	or	$7,$4,$2

	lh	$2,-8($11)
	addiu	$21,$21,1
	sll	$2,$2,3
	andi	$2,$2,0xffff
	sll	$3,$2,16
	addu	$3,$3,$2
	li	$6,8			# 0x8
	sw	$3,0($20)
	addiu	$23,$23,16
	sw	$3,-8($11)
	sw	$3,0($11)
	sw	$3,-4($11)
	addiu	$20,$20,16
	addiu	$11,$11,16
	bne	$21,$6,$L34
	addiu	$22,$22,16

$L40:
	lw	$8,76($sp)
	lw	$18,72($sp)
	sll	$3,$8,1
	sll	$5,$8,2
	addu	$2,$5,$3
	addu	$7,$5,$8
	addu	$19,$18,$2
	lw	$2,72($sp)
	addu	$4,$8,$3
	addu	$6,$3,$7
	addu	$18,$18,$4
	addu	$17,$2,$6
	lw	$4,72($sp)
	lw	$2,%got(ff_cropTbl)($28)
	lw	$10,80($sp)
	addiu	$11,$2,1024
	addu	$16,$4,$3
	addu	$15,$4,$5
	addu	$14,$4,$8
	addu	$13,$4,$7
	move	$12,$0
	li	$21,65536			# 0x10000
	li	$20,1108			# 0x454
	li	$23,2676			# 0xa74
	li	$22,-2676			# 0xfffffffffffff58c
	li	$24,8			# 0x8
$L35:
	lh	$3,32($10)
	lh	$6,96($10)
	lh	$4,64($10)
	lh	$2,0($10)
	mul	$7,$3,$23
	mul	$8,$3,$20
	mul	$3,$6,$20
	addu	$5,$4,$2
	sll	$5,$5,11
	subu	$2,$2,$4
	mul	$4,$6,$22
	addu	$9,$3,$7
	addu	$5,$5,$21
	addu	$3,$5,$9
	sll	$2,$2,11
	sra	$3,$3,17
	addu	$6,$4,$8
	addu	$2,$2,$21
	lw	$8,72($sp)
	addu	$3,$11,$3
	lbu	$7,0($3)
	addu	$4,$2,$6
	addu	$3,$8,$12
	sra	$4,$4,17
	sb	$7,0($3)
	addu	$4,$11,$4
	lbu	$3,0($4)
	subu	$2,$2,$6
	sra	$2,$2,17
	sb	$3,0($16)
	addu	$2,$11,$2
	lbu	$3,0($2)
	subu	$5,$5,$9
	sra	$5,$5,17
	sb	$3,0($15)
	addu	$5,$11,$5
	lbu	$2,0($5)
	addiu	$12,$12,1
	sb	$2,0($19)
	lh	$4,48($10)
	lh	$6,112($10)
	lh	$2,80($10)
	lh	$3,16($10)
	mul	$7,$4,$23
	mul	$8,$4,$20
	mul	$4,$6,$20
	addu	$5,$2,$3
	sll	$5,$5,11
	subu	$3,$3,$2
	mul	$2,$6,$22
	addu	$9,$4,$7
	addu	$5,$5,$21
	addu	$4,$5,$9
	sll	$3,$3,11
	sra	$4,$4,17
	addu	$6,$2,$8
	addu	$3,$3,$21
	addu	$4,$11,$4
	lbu	$7,0($4)
	addu	$2,$3,$6
	sra	$2,$2,17
	sb	$7,0($14)
	addu	$2,$11,$2
	lbu	$4,0($2)
	subu	$3,$3,$6
	sra	$3,$3,17
	sb	$4,0($18)
	addu	$3,$11,$3
	lbu	$2,0($3)
	subu	$5,$5,$9
	sra	$5,$5,17
	sb	$2,0($13)
	addu	$5,$11,$5
	lbu	$2,0($5)
	addiu	$10,$10,2
	sb	$2,0($17)
	addiu	$16,$16,1
	addiu	$15,$15,1
	addiu	$19,$19,1
	addiu	$14,$14,1
	addiu	$18,$18,1
	addiu	$13,$13,1
	bne	$12,$24,$L35
	addiu	$17,$17,1

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

	.set	macro
	.set	reorder
	.end	simple_idct248_put
	.align	2
	.globl	simple_idct84_add
	.ent	simple_idct84_add
	.type	simple_idct84_add, @function
simple_idct84_add:
	.set	nomips16
	.frame	$sp,64,$31		# vars= 16, regs= 9/0, args= 0, gp= 8
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-64
	addiu	$28,$28,%lo(__gnu_local_gp)
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
	sw	$6,72($sp)
	sw	$4,64($sp)
	sw	$5,68($sp)
	addiu	$11,$6,8
	addiu	$18,$6,12
	addiu	$21,$6,14
	addiu	$20,$6,10
	move	$19,$0
	li	$22,19266			# 0x4b42
	li	$fp,-22725			# 0xffffffffffffa73b
	li	$23,4520			# 0x11a8
$L46:
	lw	$2,0($11)
	lw	$3,-4($11)
	lw	$4,0($18)
	or	$3,$2,$3
	lh	$5,-6($11)
	or	$3,$3,$4
	or	$3,$3,$5
	beq	$3,$0,$L51
	or	$7,$4,$2

	lh	$3,-2($11)
	lh	$4,-8($11)
	li	$2,-12873			# 0xffffffffffffcdb7
	mul	$6,$3,$2
	li	$2,-4520			# 0xffffffffffffee58
	mul	$10,$3,$2
	sll	$2,$4,14
	mul	$12,$3,$fp
	subu	$2,$2,$4
	mul	$8,$3,$22
	lh	$3,-4($11)
	addiu	$9,$2,1024
	li	$2,-21407			# 0xffffffffffffac61
	mul	$4,$3,$2
	mul	$2,$5,$23
	addu	$17,$4,$9
	addu	$25,$2,$6
	li	$2,22725			# 0x58c5
	mul	$4,$5,$2
	mul	$2,$5,$22
	addu	$24,$4,$8
	addu	$16,$2,$10
	li	$2,12873			# 0x3249
	mul	$4,$5,$2
	li	$2,21407			# 0x539f
	addu	$15,$4,$12
	mul	$4,$3,$2
	li	$2,8867			# 0x22a3
	addu	$12,$4,$9
	mul	$4,$3,$2
	li	$2,-8867			# 0xffffffffffffdd5d
	addu	$13,$4,$9
	mul	$4,$3,$2
	beq	$7,$0,$L45
	addu	$14,$4,$9

	lh	$2,0($20)
	lh	$4,0($11)
	mul	$3,$2,$22
	mul	$9,$2,$fp
	sw	$3,8($sp)
	li	$3,12873			# 0x3249
	mul	$7,$2,$3
	sll	$3,$4,14
	mul	$10,$2,$23
	lh	$5,0($18)
	subu	$3,$3,$4
	mtlo	$3
	li	$4,-8867			# 0xffffffffffffdd5d
	madd	$5,$4
	lh	$2,0($21)
	mflo	$4
	subu	$8,$0,$3
	sw	$4,16($sp)
	lw	$4,8($sp)
	lw	$6,16($sp)
	mtlo	$4
	madd	$2,$fp
	addu	$17,$17,$6
	mflo	$4
	mtlo	$8
	sw	$4,8($sp)
	li	$4,21407			# 0x539f
	madd	$5,$4
	lw	$6,8($sp)
	mflo	$4
	addu	$25,$25,$6
	sw	$4,12($sp)
	mul	$4,$2,$23
	lw	$6,12($sp)
	addu	$7,$4,$7
	li	$4,-12873			# 0xffffffffffffcdb7
	addu	$14,$14,$6
	mul	$6,$2,$4
	mul	$4,$2,$22
	addu	$9,$6,$9
	addu	$2,$4,$10
	addu	$15,$15,$2
	li	$4,8867			# 0x22a3
	li	$2,-21407			# 0xffffffffffffac61
	mul	$6,$5,$4
	mul	$4,$5,$2
	addu	$3,$6,$3
	addu	$5,$4,$8
	addu	$24,$24,$7
	addu	$16,$16,$9
	addu	$12,$12,$3
	addu	$13,$13,$5
$L45:
	subu	$6,$12,$24
	subu	$7,$13,$16
	subu	$8,$14,$15
	subu	$9,$17,$25
	addu	$2,$24,$12
	addu	$3,$16,$13
	addu	$4,$15,$14
	addu	$5,$25,$17
	sra	$2,$2,11
	sra	$6,$6,11
	sra	$3,$3,11
	sra	$7,$7,11
	sra	$4,$4,11
	sra	$8,$8,11
	sra	$5,$5,11
	sra	$9,$9,11
	sh	$2,-8($11)
	sh	$6,0($21)
	sh	$3,-6($11)
	sh	$7,0($18)
	sh	$4,-4($11)
	sh	$8,0($20)
	sh	$5,-2($11)
	sh	$9,0($11)
$L43:
	addiu	$19,$19,1
	li	$6,4			# 0x4
	addiu	$11,$11,16
	addiu	$18,$18,16
	addiu	$21,$21,16
	bne	$19,$6,$L46
	addiu	$20,$20,16

	lw	$2,68($sp)
	lw	$12,64($sp)
	sll	$4,$2,1
	addu	$3,$2,$4
	addu	$24,$12,$3
	lw	$2,%got(ff_cropTbl)($28)
	lw	$3,68($sp)
	lw	$13,72($sp)
	addiu	$16,$2,1024
	addu	$15,$12,$3
	addu	$14,$12,$4
	move	$25,$0
	li	$17,2896			# 0xb50
	li	$21,65536			# 0x10000
	li	$20,3784			# 0xec8
	li	$19,-3784			# 0xfffffffffffff138
	li	$18,8			# 0x8
$L47:
	lh	$8,48($13)
	lh	$5,0($13)
	lh	$11,32($13)
	sll	$3,$8,5
	sll	$2,$8,8
	subu	$2,$2,$3
	addu	$6,$11,$5
	sll	$7,$2,3
	subu	$7,$7,$2
	mul	$2,$6,$17
	lh	$9,16($13)
	addu	$6,$2,$21
	mul	$2,$9,$20
	subu	$7,$7,$8
	addu	$7,$2,$7
	lbu	$10,0($12)
	addu	$2,$6,$7
	sll	$3,$9,5
	sll	$4,$9,8
	sra	$2,$2,17
	subu	$4,$4,$3
	addu	$2,$2,$10
	sll	$3,$4,3
	addu	$2,$16,$2
	subu	$3,$3,$4
	lbu	$4,0($2)
	mul	$2,$8,$19
	subu	$5,$5,$11
	subu	$3,$3,$9
	addu	$8,$2,$3
	mul	$2,$5,$17
	sb	$4,0($12)
	addu	$5,$2,$21
	lbu	$3,0($15)
	addu	$2,$5,$8
	sra	$2,$2,17
	addu	$2,$2,$3
	addu	$2,$16,$2
	lbu	$3,0($2)
	subu	$5,$5,$8
	sb	$3,0($15)
	lbu	$2,0($14)
	sra	$5,$5,17
	addu	$5,$5,$2
	addu	$5,$16,$5
	lbu	$2,0($5)
	subu	$6,$6,$7
	sb	$2,0($14)
	lbu	$3,0($24)
	sra	$6,$6,17
	addu	$6,$6,$3
	addu	$6,$16,$6
	lbu	$2,0($6)
	addiu	$25,$25,1
	sb	$2,0($24)
	addiu	$13,$13,2
	addiu	$12,$12,1
	addiu	$15,$15,1
	addiu	$14,$14,1
	bne	$25,$18,$L47
	addiu	$24,$24,1

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

$L51:
	lh	$2,-8($11)
	sll	$2,$2,3
	andi	$2,$2,0xffff
	sll	$3,$2,16
	addu	$3,$3,$2
	sw	$3,0($18)
	sw	$3,-8($11)
	sw	$3,0($11)
	b	$L43
	sw	$3,-4($11)

	.set	macro
	.set	reorder
	.end	simple_idct84_add
	.align	2
	.globl	simple_idct
	.ent	simple_idct
	.type	simple_idct, @function
simple_idct:
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
	sw	$4,64($sp)
	addiu	$11,$4,8
	addiu	$18,$4,12
	addiu	$21,$4,14
	addiu	$20,$4,10
	move	$19,$0
	li	$22,19266			# 0x4b42
	li	$fp,-22725			# 0xffffffffffffa73b
	b	$L57
	li	$23,4520			# 0x11a8

$L53:
	lh	$3,-2($11)
	lh	$4,-8($11)
	li	$2,-12873			# 0xffffffffffffcdb7
	mul	$6,$3,$2
	li	$2,-4520			# 0xffffffffffffee58
	mul	$10,$3,$2
	sll	$2,$4,14
	mul	$12,$3,$fp
	subu	$2,$2,$4
	mul	$8,$3,$22
	lh	$3,-4($11)
	addiu	$9,$2,1024
	li	$2,-21407			# 0xffffffffffffac61
	mul	$4,$3,$2
	mul	$2,$5,$23
	addu	$17,$4,$9
	addu	$16,$2,$6
	li	$2,22725			# 0x58c5
	mul	$4,$5,$2
	mul	$2,$5,$22
	addu	$25,$4,$8
	addu	$24,$2,$10
	li	$2,12873			# 0x3249
	mul	$4,$5,$2
	li	$2,21407			# 0x539f
	addu	$15,$4,$12
	mul	$4,$3,$2
	li	$2,8867			# 0x22a3
	addu	$12,$4,$9
	mul	$4,$3,$2
	li	$2,-8867			# 0xffffffffffffdd5d
	addu	$13,$4,$9
	mul	$4,$3,$2
	beq	$7,$0,$L56
	addu	$14,$4,$9

	lh	$2,0($20)
	lh	$4,0($11)
	mul	$3,$2,$22
	mul	$9,$2,$fp
	sw	$3,8($sp)
	li	$3,12873			# 0x3249
	mul	$7,$2,$3
	sll	$3,$4,14
	mul	$10,$2,$23
	lh	$5,0($18)
	subu	$3,$3,$4
	mtlo	$3
	li	$4,-8867			# 0xffffffffffffdd5d
	madd	$5,$4
	lh	$2,0($21)
	mflo	$4
	subu	$8,$0,$3
	sw	$4,16($sp)
	lw	$4,8($sp)
	lw	$6,16($sp)
	mtlo	$4
	madd	$2,$fp
	addu	$17,$17,$6
	mflo	$4
	mtlo	$8
	sw	$4,8($sp)
	li	$4,21407			# 0x539f
	madd	$5,$4
	lw	$6,8($sp)
	mflo	$4
	addu	$16,$16,$6
	sw	$4,12($sp)
	mul	$4,$2,$23
	lw	$6,12($sp)
	addu	$7,$4,$7
	li	$4,-12873			# 0xffffffffffffcdb7
	addu	$14,$14,$6
	mul	$6,$2,$4
	mul	$4,$2,$22
	addu	$9,$6,$9
	addu	$2,$4,$10
	addu	$15,$15,$2
	li	$4,8867			# 0x22a3
	li	$2,-21407			# 0xffffffffffffac61
	mul	$6,$5,$4
	mul	$4,$5,$2
	addu	$3,$6,$3
	addu	$5,$4,$8
	addu	$25,$25,$7
	addu	$24,$24,$9
	addu	$12,$12,$3
	addu	$13,$13,$5
$L56:
	subu	$6,$12,$25
	addu	$2,$25,$12
	sra	$6,$6,11
	subu	$7,$13,$24
	subu	$8,$14,$15
	subu	$9,$17,$16
	addu	$3,$24,$13
	addu	$4,$15,$14
	addu	$5,$16,$17
	sra	$2,$2,11
	sh	$2,-8($11)
	sra	$3,$3,11
	sh	$6,0($21)
	sra	$7,$7,11
	sra	$4,$4,11
	sra	$8,$8,11
	sra	$5,$5,11
	sra	$9,$9,11
	addiu	$19,$19,1
	li	$6,8			# 0x8
	sh	$3,-6($11)
	addiu	$21,$21,16
	sh	$7,0($18)
	sh	$4,-4($11)
	addiu	$18,$18,16
	sh	$8,0($20)
	sh	$5,-2($11)
	sh	$9,0($11)
	addiu	$20,$20,16
	beq	$19,$6,$L66
	addiu	$11,$11,16

$L57:
	lw	$2,0($11)
	lw	$3,-4($11)
	lw	$4,0($18)
	or	$3,$2,$3
	lh	$5,-6($11)
	or	$3,$3,$4
	or	$3,$3,$5
	bne	$3,$0,$L53
	or	$7,$4,$2

	lh	$2,-8($11)
	addiu	$19,$19,1
	sll	$2,$2,3
	andi	$2,$2,0xffff
	sll	$3,$2,16
	addu	$3,$3,$2
	li	$6,8			# 0x8
	sw	$3,0($18)
	addiu	$21,$21,16
	sw	$3,-8($11)
	sw	$3,0($11)
	sw	$3,-4($11)
	addiu	$18,$18,16
	addiu	$11,$11,16
	bne	$19,$6,$L57
	addiu	$20,$20,16

$L66:
	lw	$11,64($sp)
	move	$16,$0
	li	$fp,21407			# 0x539f
	li	$25,8867			# 0x22a3
	li	$23,-8867			# 0xffffffffffffdd5d
	li	$22,-21407			# 0xffffffffffffac61
	li	$17,19266			# 0x4b42
	li	$21,12873			# 0x3249
	li	$19,4520			# 0x11a8
	li	$18,-22725			# 0xffffffffffffa73b
	li	$20,-12873			# 0xffffffffffffcdb7
$L62:
	lh	$2,48($11)
	lh	$4,0($11)
	li	$3,-4520			# 0xffffffffffffee58
	lh	$5,32($11)
	mul	$8,$2,$20
	mul	$10,$2,$17
	mul	$12,$2,$3
	mul	$14,$2,$18
	sll	$3,$4,14
	li	$2,458752			# 0x70000
	subu	$3,$3,$4
	ori	$2,$2,0xffe0
	addu	$9,$3,$2
	mul	$3,$5,$22
	lh	$4,16($11)
	addu	$24,$3,$9
	mul	$3,$4,$19
	lh	$6,64($11)
	addu	$15,$3,$8
	li	$3,22725			# 0x58c5
	mul	$8,$4,$3
	mul	$3,$4,$17
	addu	$13,$8,$10
	addu	$12,$3,$12
	mul	$8,$5,$25
	mul	$3,$4,$21
	mul	$4,$5,$fp
	addu	$10,$3,$14
	addu	$3,$4,$9
	addu	$4,$8,$9
	mul	$8,$5,$23
	sll	$2,$6,14
	subu	$2,$2,$6
	addiu	$16,$16,1
	subu	$7,$0,$2
	beq	$6,$0,$L58
	addu	$5,$8,$9

	addu	$5,$5,$7
	addu	$24,$24,$2
	addu	$3,$3,$2
	addu	$4,$4,$7
$L58:
	lh	$2,80($11)
	beq	$2,$0,$L59
	mul	$6,$2,$17

	addu	$15,$6,$15
	mul	$6,$2,$21
	addu	$13,$6,$13
	mul	$6,$2,$18
	addu	$12,$6,$12
	mul	$6,$2,$19
	addu	$10,$6,$10
$L59:
	lh	$2,96($11)
	beq	$2,$0,$L60
	mul	$6,$2,$23

	addu	$24,$6,$24
	mul	$6,$2,$25
	addu	$3,$6,$3
	mul	$6,$2,$22
	addu	$4,$6,$4
	mul	$6,$2,$fp
	addu	$5,$6,$5
$L60:
	lh	$2,112($11)
	beq	$2,$0,$L67
	subu	$8,$4,$12

	mul	$6,$2,$18
	addu	$15,$6,$15
	mul	$6,$2,$19
	addu	$13,$6,$13
	mul	$6,$2,$20
	addu	$12,$6,$12
	mul	$6,$2,$17
	addu	$10,$6,$10
	subu	$8,$4,$12
$L67:
	subu	$7,$5,$10
	subu	$9,$3,$13
	addu	$2,$13,$3
	sra	$8,$8,20
	addu	$3,$12,$4
	subu	$6,$24,$15
	addu	$4,$10,$5
	addu	$5,$15,$24
	sh	$8,96($11)
	sra	$2,$2,20
	sra	$3,$3,20
	sra	$4,$4,20
	sra	$5,$5,20
	sra	$6,$6,20
	sra	$7,$7,20
	sra	$9,$9,20
	li	$8,8			# 0x8
	sh	$2,0($11)
	sh	$3,16($11)
	sh	$4,32($11)
	sh	$5,48($11)
	sh	$6,64($11)
	sh	$7,80($11)
	sh	$9,112($11)
	bne	$16,$8,$L62
	addiu	$11,$11,2

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

	.set	macro
	.set	reorder
	.end	simple_idct
	.ident	"GCC: (GNU) 4.3.3"

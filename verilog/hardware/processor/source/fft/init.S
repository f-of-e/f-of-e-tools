.globl _start
.align	2

_start:

init:
	nop
	li		sp, 481024	# 480000 (== 0x75300) for the code section plus another 1k for the data section
	j		main

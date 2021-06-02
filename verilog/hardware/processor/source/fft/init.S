.globl _start
.align	2

_start:

init:
	nop
	li		sp, 42832	# 41808 (== 0xA350) for the code section plus another 1k for the data section
	j		main

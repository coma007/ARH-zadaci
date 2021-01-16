# Pronalazenje n-tog fibonacijevog broja
# mica

.section .data
n: .long 8	# brojac
f: .long 0	# clan rezultat
greska: .byte 0

.section .text
.globl main

main:

	movl $1, %eax # prvi clan i svaki novi kasnije
	movl $1, %ebx # drugi clan i svaki novi kasnije
	movl n, %ecx

sabiranje: 
	
	dec %ecx
	cmpl $0, %ecx
	je kraj

	addl %ebx, %eax
	jc gresim
	xchg %eax, %ebx
	
	jmp sabiranje

gresim:

	movl $1, greska

kraj:
	movl %eax, f
	movl $1, %eax
	movl $0, %ebx
	int $0x80

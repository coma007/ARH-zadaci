# Milica Sladakovic SV 18/2020
# brojanje kecova u bin broju
# ----------------------------

.section .data
broj = 0b11101010
maska = 0b00000001
brojac: .long 0

.section .text
.global main

main:

	movl $broj, %eax
	movl $maska, %ebx
	movl $brojac, %ecx
	

petlja:

	cmpl $0, %eax
	jz kraj
	testl %ebx, %eax
	jz dalje
	incl (%ecx)

dalje:

	shrl $1, %eax
	jmp petlja

kraj:

	movl $1, %eax
	movl brojac, %ebx
	int $0x80
	

	

	
	

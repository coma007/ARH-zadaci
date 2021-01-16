# Milica Sladakovic, INDEX SV 18 / 2020
# sortiranje niza 16bit
# -------------------------------------

.section .data
NELEM = 10
niz: .word 1, 5, 13, -12, 22, 14, 25, 333, 891, -119

.section .text
.global main

main:

	movl $niz, %eax # adresa prvog

	movl $NELEM, %esi

namjesti:

	movl %eax, %ebx
	addl %esi, %ebx
	addl %esi, %ebx
	subl $2, %ebx # adresa zadnjeg
	movl %esi, %edi

petljica:

	cmpl $0, %edi
	je kraj

	movw (%eax), %dx
	movw (%ebx), %cx

	cmpw %dx, %cx
	jg dalje

	xchgw %cx, (%eax)
	xchgw %dx, (%ebx)

dalje:

	decl %edi
	subl $2, %ebx
	cmpl %ebx, %eax
	je pomjeri_prvi

	jmp petljica

pomjeri_prvi:

	addl $2, %eax
	decl %esi

	jmp namjesti

kraj:

	movl $1, %eax
	movl $0, %ebx
	int $0x80




	
	

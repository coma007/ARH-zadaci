# Milica Sladakovic SV 18/2020
# dijeljenje oduzimanjem, dvostruka preciznost
# --------------------------------------------

.section .data
a : .quad 0xACDFCBADFCB
b : .quad 0x15123134
ostatak: .quad 0
rez: .quad 0
greska: .byte 0

.section .text
.global main

main:
	
	movl a, %eax
	movl a+4, %ebx

cek:

	cmpl $0, b
	jne prov
	cmpl $0, b+4
	je nula

prov:

	cmpl b+4, %ebx
	jl rezultat
	ja deli
	cmpl b, %eax
	jl rezultat

deli:

	subl b, %eax
	sbbl b+4, %ebx

	addl $1, rez
	adcl $0, rez+4

	jmp prov

rezultat:
	
	movl %ebx, ostatak+4
	movl %eax, ostatak
	jmp kraj

nula:

	incb greska

kraj:

	movl $1, %eax
	movl $0, %ebx
	int $0x80


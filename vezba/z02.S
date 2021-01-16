# Milica Sladakovic SV 18/2020
# Fibonacijev niz, dvostruka preciznost
# -------------------------------------

.section .data
n:  .long 60
f:  .quad 0
greska: .byte 0

.section .text
.global main

main:

    movl $1, %eax   #f1 nizi
    movl $0, %ebx #f1 visi
	movl $1, %ecx   #f2 nizi
    movl $0, %edx #f2 visi

saberi:

	cmpl $2, n
	jbe kraj


	addl %eax, %ecx
	adcl %ebx, %edx
    jc prekoracenje

nastavi:

	xchgl %eax, %ecx
	xchgl %ebx, %edx

	decl n
	jmp saberi


prekoracenje:

    incb greska

kraj: 

	movl %ebx, f+4
    movl %eax, f
	
    movl $1, %eax
    movl $0, %ebx
    int $0x80

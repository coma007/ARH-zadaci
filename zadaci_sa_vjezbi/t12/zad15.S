# niz 1
# Mica

.section .data
    niz: .long 1,2,3,4,5,6,7,8,9,10
    suma: .long 0
    a: .long 2
    b: .long 6

.section .text
.globl main

main:
    movl $0, %esi # index
    movl $0, %eax # racunanje sume
    movl a, %ebx

petlja:
    addl niz(%ebx,%esi,4), %eax
    incl %esi
    cmpl b, %esi
    jle petlja
kraj: 
    movl %eax, suma
    movl $1, %eax
    movl $0, %ebx
    int $0x80

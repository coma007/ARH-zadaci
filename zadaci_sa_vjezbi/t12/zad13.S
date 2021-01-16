# sabiranje, dvostruka preciznost
# Mica

.section .data
    a: .long 20, 10
    b: .quad 0xA0000014
    prekoracenje: .byte 0

.section .text
.globl main

main: 
    movl a+4, %eax
    movl b+4, %ebx
    movl a, %ecx
    movl b, %edx

    adcl %ecx, %edx
    addl %eax, %ebx

    jnc kraj
    movl $1, prekoracenje

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

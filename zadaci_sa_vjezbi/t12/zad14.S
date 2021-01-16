# deljenje oduzimanjem, visestruka preciznost
# Mica

.section .data
    a: .quad 123456
    b: .quad 912
    c: .quad 0
    d: .quad 0
    greska: .byte 0

.section .text
.globl main

main:
    movl a, %eax
    movl a+4, %ebx
    cmpl $0, b
    je nuladeli
    jne deli
    cmpl $0, b+4
    je nula

deli:
    cmpl b+4, %ebx
    ja bvece
    jl kraj
    cmpl b, %eax
    jl kraj
    
    

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

# izbacivanje razmaka sa kraja stringa
# Mica 

.section .data
rec:    .ascii "    mica    \0"

.section .text
.globl main

main:
    movl $rec, %eax

uporedime:
    cmpb $0, (%eax)
    je krajreci
    
    incl %eax
    jmp uporedime

krajreci:
    cmpb $' ', -1(%eax)
    jne delete
    decl %eax
    jmp krajreci

delete:
    movb $0, (%eax)

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

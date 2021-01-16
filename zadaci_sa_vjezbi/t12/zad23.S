# izbacivanje razmaka sa pocetka stringa
# Mica 

.section .data
rec:    .ascii "        ekatarina velika  \0"

.section .text
.globl main

main:
    movl $rec, %eax
    cmpb $0, (%eax)
    je kraj

provjeri:

    cmpb $' ', (%eax)
    jne kraj

    incl %eax

    cmpb $' ', (%eax)
    jne krajrazmaka
   
    jmp provjeri

krajrazmaka:

    movb (%eax), %bl
    movb %bl, -1(%eax)
    cmpb $0, (%eax)
    je main
    incl %eax
    jmp krajrazmaka

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

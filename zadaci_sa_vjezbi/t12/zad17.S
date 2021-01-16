# izbacivanje razmaka sa pocetka i kraja niza
# Mica

.section .data
rec:    .ascii "    ka  ta r in  a       \0"

.section .text
.globl main

main:
    movl $rec, %eax
    cmpb $0, (%eax)
    je kraj

    cmpb $' ', (%eax)
    jne provjerikraj

provjeripocetak:
    
    incl %eax

    cmpb $0, (%eax)
    jne razmakpocetak
    
    jmp provjeripocetak

razmakpocetak:

    movb (%eax), %bl
    movb %bl, -1(%eax)
    cmpb $0, (%eax)
    je main
    incl %eax
    jmp razmakpocetak

provjerikraj:
    
    incl %eax
    cmpb $0, (%eax)
    je razmakkraj

    jmp provjerikraj

razmakkraj:
   
    decl %eax
    cmpb $' ', (%eax)
    je razmakkraj
    jne delete

delete:

    movb $0, 1(%eax)

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

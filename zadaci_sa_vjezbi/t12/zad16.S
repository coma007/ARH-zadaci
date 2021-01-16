# neki novi zadacic _ niz _ minimax
# Mica 

.section .data
    NELEM = 13
    niz: .long 17,2,3,5,5,6,22,8,9,115,22,2,3
    min: .long 0
    max: .long 3

.section .text
.globl main

main:
    
    movl $niz, %edx # adresa prvog clana
    movl (%edx), %eax # ovdje cu upisati i testirati min
    movl (%edx), %ebx # ovdje cu upisati i testirati max
    movl (%edx), %ecx # tester
    movl $0, %esi # indeks

pristupi:

    incl %esi
    cmpl $NELEM+1, %esi
    je kraj

    movl niz(, %esi, 4), %ecx

    cmpl %eax, %ecx
    jle mini
    jge maxi


mini:

    movl %ecx, %eax

    jmp pristupi


maxi:

    cmpl %ecx, %ebx
    jge pristupi
    movl %ecx, %ebx

    jmp pristupi
    

kraj:
    movl %eax, min
    movl %ebx, max
    movl $1, %eax
    movl $0, %ebx
    int $0x80

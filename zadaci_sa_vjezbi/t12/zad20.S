# sabiranje elemenata niza _ indeksno 
# Mica

.section .data
NELEM = 10
niz: .long 1,2,3,4,5,6,7,8,9,10
suma: .long 0

.section .text
.globl main

main:
    movl $0, %esi # indeks
    movl suma, %eax # ovdje se cuva zbir

petlja:
    cmpl $NELEM, %esi
    je kraj
	
    addl niz(,%esi,4), %eax # + clan_indeks -> eax
    incl %esi
    
    jmp petlja

kraj:
    movl %eax, suma
    movl $1, %eax
    movl $0, %ebx
    int $0x80


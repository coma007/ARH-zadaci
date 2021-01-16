# suma podniza
# Mica

.section .data
NELEM = 10
niz: .long 1,2,3,4,5,6,7,8,9,10
gornja = 4
donja = 2
suma: .long 0

.section .text
.globl main

main:
    movl $donja, %esi # indeks
    movl suma, %eax # ovdje se cuva zbir


petlja:
	
    addl niz(,%esi,4), %eax # + clan_indeks -> eax
    
    cmpl $gornja, %esi
    je kraj
    
    incl %esi
    jmp petlja

kraj:
    movl %eax, suma
    movl $1, %eax
    movl $0, %ebx
    int $0x80


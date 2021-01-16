# n-ti clan fibonacijevog niza
# sv coma

.section .data
.section .text 
.globl main

main:
	movl $0, %eax #nulti do (n-1)ti clan
	movl $5, %ebx #brojac
	movl $1, %ecx #prvi do nti clan

saberi:
	subl $1, %ebx
	cmpl $1, %ebx
	je kraj

	cmpl %eax, %ecx
	ja vece
	jb manje

vece:
	addl %ecx, %eax

	jmp saberi

manje:
	addl %eax, %ecx

	jmp saberi

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80


	

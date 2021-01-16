# sabiranje prvih 5 prirodnih brojeva
# sv coma

.section .data
.section .text
.globl main
main:
	movl $5, %eax
	movl $0, %ebx

saberi:
	cmpl $0, %eax
	je kraj

	addl %eax, %ebx
	subl $1, %eax

	jmp saberi

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80


# NZD
# Milica

.section .data
.section .text
.globl main

main:
	movl $320, %eax
	movl $64, %ebx
uporedi:
	cmpl %eax, %ebx
	je kraj
	ja vece
	jb manje
vece:
	subl %eax, %ebx
	jmp uporedi
manje:
	subl %ebx, %eax
	jmp uporedi
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80


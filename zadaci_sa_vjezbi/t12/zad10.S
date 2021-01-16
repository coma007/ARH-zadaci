# uporedjivanje brojeva
# Milica

.section .data
.section .text
.globl main
main: 
	movl $0, %ebx
	movl $3255, %ecx
uporedi:
	cmpl %ecx, %ebx
	je jednako
	ja vece
	jb manje
jednako:
	movl $0, %eax 
	jmp kraj
vece:
	movl $1, %eax
	jmp kraj
manje:
	movl $2, %eax
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

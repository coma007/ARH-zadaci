# mnozenje pomocu sabiranja
# mica

.section .data
a: .long 123
b: .long 456
p: .long 0

.section .text
.globl main
main:
	movl a, %eax
	movl b, %ebx
	movl p, %ecx # rezultat

uporedime:

	cmpl $0, %eax
	je kraj
	cmpl $0, %ebx
	je kraj

	cmpl %eax, %ebx
	jl a_vece
	jg b_vece

a_vece:

	addl %eax, %ecx
	decl %ebx

	cmpl $0, %ebx
	je uporedime
	
	jmp a_vece

b_vece:
	

	addl %ebx, %ecx
	decl %eax

	cmpl $0, %eax
	je uporedime
	
	jmp b_vece

kraj:
	movl %ecx, p
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	



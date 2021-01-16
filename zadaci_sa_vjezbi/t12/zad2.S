# faktorijel broja 5
# sv coma

.section .data
.section .text 
.globl main
main:
	movl $5, %eax # ovo je broj 5 (br od koga se trazi fakt)
	movl $0, %ecx # ovdje upisuje rezultat
	movl %eax, %ebx 
	subl $1, %ebx # ovo je prethodnik broja 5

mnozi:
	addl %ebx, %ecx

	subl $1, %eax
	cmpl $0, %eax
	je fakt
	
	jmp mnozi

fakt:
	subl $1, %ebx
	movl %ecx, %eax
	

	cmpl $1, %ebx
	je kraj
	movl $0, %ecx
	jne mnozi

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80



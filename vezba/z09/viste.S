.section .data

poruka1: .ascii "Unesite ime i prezime: \0"
duzina1 = . - poruka1

poruka2: .ascii "Vi ste: \0"
duzina2 = . - poruka2

imeprez: .fill 50,1,42

.section .text
.global main

main:

	movl $4, %eax
	movl $0, %ebx
	leal poruka1, %ecx
	movl $duzina1, %edx
	int $0x80

	movl $3, %eax
	movl $0, %ebx
	leal imeprez, %ecx
	movl $50, %edx
	int $0x80
	movl %eax, %esi

	xorl %edi, %edi

provjeri_velicinu:

	movb imeprez(,%edi,1), %bl
	cmpb $10, %bl
	je predkraj
	cmpb $'a', %bl
	jb dalje
	cmpb $'z', %bl
	ja dalje

	addb $'A'-'a', %bl
	movb %bl, imeprez(,%edi,1)

dalje:

	incl %edi
	jmp provjeri_velicinu

predkraj:

	movl $4, %eax
	movl $0, %ebx
	leal poruka2, %ecx
	movl $duzina2, %edx
	int $0x80

	movl $4, %eax
	movl $0, %ebx
	leal imeprez, %ecx
	movl %esi, %edx
	int $0x80

kraj:

	movl $1, %eax
	movl $0, %ebx
	int $0x80




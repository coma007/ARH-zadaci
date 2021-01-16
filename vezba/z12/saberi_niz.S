# Milica Sladakovic SV 18/2020
# sabiranje niza, potprogrami
# ----------------------------

#int saberi_niz(long long *a, long long *b, long long *c, int n);

.section .text
.global saberi_niz

saberi_niz:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp

	movl $0, -4(%ebp)	 # greska

	pushl %ebx
	pushl %esi
	pushl %edi			 

	movl 8(%ebp), %eax	 # adresa a
	movl 12(%ebp), %ebx	 # adresa b
	movl 16(%ebp), %edi	 # adresa c

	xorl %esi, %esi		 # brojac

petljica:

	xorl %ecx, %ecx		 # zbir nizi
	xorl %edx, %edx		 # zbir visi

	cmpl %esi, 20(%ebp)
	je kraj

	movl (%eax,%esi,8), %ecx
	movl 4(%eax,%esi,8), %edx

	addl (%ebx,%esi,8), %ecx
	adcl 4(%ebx,%esi,8), %edx
	jo greska

	movl %ecx, (%edi)
	addl $4, %edi
	movl %edx, (%edi)
	addl $4, %edi

	incl %esi

	jmp petljica

greska:

	incl -4(%ebp)

kraj:

	movl -4(%ebp), %eax

	popl %edi
	popl %esi
	popl %ebx

	movl %ebp, %esp
	popl %ebp
	ret


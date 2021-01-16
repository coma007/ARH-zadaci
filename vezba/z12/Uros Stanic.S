#Uros Stanic sv17/2020
.section .text
.global saberi_niz
saberi_niz:
	pushl %ebp
	movl %esp,%ebp
	
	
	movl 8(%ebp),%eax	#a
	movl 20(%ebp),%esi	#brojac
	movl 16(%ebp),%edx  #b
	movl 12(%ebp),%edi  #c
	subl $4,%esp
	movl $0,-4(%ebp)	#greska
	
petlja:
	cmpl $0,%esi
	je kraj
	movl (%edi),%ecx 	#sabiranje nizih
	addl (%eax),%ecx
	movl %ecx,(%edx)
	
	addl $4,%eax		#korekcija
	addl $4,%edi
	addl $4,%edx
	
	movl (%edi),%ecx 	#sabiranje visih
	adcl (%eax),%ecx
	movl %ecx,(%edx)
	jo greska
	
	addl $4,%eax 		#korakcija 2
	addl $4,%edi
	addl $4,%edx
	decl %esi
	jmp petlja
	
greska:
	incl -4(%ebp)
		

kraj:
	movl -4(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	
	ret

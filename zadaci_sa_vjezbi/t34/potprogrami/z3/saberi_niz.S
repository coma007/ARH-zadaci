.section .text
.globl saberi_niz
# int saberi_niz(long long *a, long long *b, long long *c, int n)

saberi_niz:

    pushl %ebp
    
    movl %esp, %ebp
    subl $4, %esp

    pushl %ebx
    pushl %esi

    movl 8(%ebp), %eax     # adresa prvog clana niza a
    movl 12(%ebp), %ebx 	   # adresa prvog clana niza b
    movl 16(%ebp), %ecx    # adresa prvog clana niza c (zbir)
    movl 20(%ebp), %edx    # broj clanova

    movl $0, -4(%ebp)       # polje za gresku
	
	decl %edx   # idem od zadnjeg, a 1. element je zapravo 0., Milice pa programiras
    
    
saberi: # dvostruka preciznost
    
    movl (%eax, %edx, 8), %esi # nizi
    addl (%ebx, %edx, 8), %esi
    movl %esi, (%ecx, %edx, 8)

    movl 4(%eax, %edx, 8), %esi # visi
    adcl 4(%ebx, %edx, 8), %esi
    movl %esi, 4(%ecx, %edx, 8)

	jo greska

	decl %edx
	jns saberi

    jmp kraj

greska:

    incl -4(%ebp)

kraj: 
 
    movl -4(%ebp), %eax # u eax greska

    popl %esi
    popl %ebx

	movl %ebp, %esp     # brisi sve lokalne promjenljive
    
    popl %ebp
    ret  

# Milica Sladakovic SV 18/2020
# provjeravanje vertikalnog pariteta niza podataka
# ------------------------------------------------

.section .data

broj = 5
niz: .long 0b01101010101001010101001010101010
	 .long 0b10011010100101001010101010101010
	 .long 0b00101010100101010101110101001010
	 .long 0b11010100101010101001001010101001
	 .long 0b11010100101001010101010101010100
		  #0b11011010101010110110001010110111
paritet: .long 0

.section .text
.global main

main:

	xorl %edx, %edx	# paritet
	movl $1, %ebx   # maska

novi_bit:

	xorl %esi, %esi # brojac elementa niza
	xorl %ecx, %ecx # brojac jedinica	

novi_element:

	movl niz(,%esi,4), %eax # esi-ti element
	testl %ebx, %eax
	jz smjesti_se

	incl %ecx

smjesti_se:
	
	incl %esi
	cmpl $broj, %esi
	jl novi_element
	shrl $1, %ecx 		# ako je neparan, kec ce ici u carry, nula ako je neparan
	rcrl $1, %edx		# ubacuje onaj kec ili nulu iz carry-a u paritet, krece s desna
	shll $1, %ebx 		# promjena maske za testiranje novog bita
	jnc novi_bit		# ako dodje do c = 1, znaci da je maska dosla do kraja, tj svi biti su istestirani

kraj:

	movl %edx, paritet
	movl $1, %eax
	movl paritet, %ebx
	int $0x80

		
	

	




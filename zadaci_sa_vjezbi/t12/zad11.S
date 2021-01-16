# premjestanje _ primjer sa ytba
# Mica

.section .data					# uvodi se zbog konstanti, labela itd.

    bajtovi:
	
        .byte 0xff, 100			# u .byte mogu jedino velicine od 8bita (1 bajt) // kolko hoces brojeva
								# on ih gleda kao 		0xff 0x64		(100 (10) = 0x64 (!6))
								
    reci:
		
        .word 0xee54, 2, 50		# u .word mogu velicine od max 16 bita (2 bajta), // 4hex cifre odgovara 4*4=16bin cifara, tj. 2 bajta // kolko hoces brojeva
								# on ih gleda kao 		0x54 0xee 0x02 0x00 0x32 0x00
								#						jer je little endian pa najznacajnije cifre idu u najnize lokacije; 0x02 0x00 - mora se popuniti 16bit
							
    dugarec:
		
        .long 0xabcd1234		# u .long mogu veilcine od max 32 bita (4 bajta) // kolko hoces brojeva
								# on ih gleda kao 		0x34 0x12 0xcd 0xab
								
.section .text					# uvodi se zbog koda ispod
.globl main

main:

    movl dugarec, %eax			# movl, l kao LONG; 0xabcd1234 -> eax
    movw %ax, reci				# movw, w kao WORD (prva 2 bajta); 0x34 0x12 -> reci
    movl $bajtovi, %eax
    movw bajtovi, %ax
    movl reci+2, %eax
    movb dugarec, %al
    movl bajtovi, %eax


kraj:
	
    movl $1, %eax
    movl $0, %ebx
    int $0x80

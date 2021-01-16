# Program za sabiranje dva broja u proizvoljnoj bazi
# Imenko Prezimić ra1234

# Napisati asemblerski program koji, koristeći potprograme za konverziju
# za bilo koju bazu 2‑36, vrši sabiranje dva neoznačena cela broja data u
# znakovnom obliku i rezultat vraća u znakovnom obliku. Sve konverzije
# raditi odmah nakon unosa, a u slučaju greške prekinuti dalji rad
# programa i ispisati odgovarajuću poruku. Primer korišćenja:
#       Unesite bazu broja:16
#       Unesite broj:Fa
#       Unesite bazu broja:8
#       Unesite broj:123
#       Unesite bazu rezultata:2
#       Rezultat:101001101
# Za ostale primere pokrenuti testiraj.sh.
# Dodatni primeri se mogu napraviti pomoću kalkulatora (Accessories/Calculator)

.section .data

ulaz1:      .ascii "Unesite bazu broja:\0"
len1 = . - ulaz1
baza_str: .fill 3,1,42
baza: .long 0

ulaz2:      .ascii "Unesite broj:\0"
len2 = . - ulaz2
broj_str: .fill 10,1,42


ulaz3:      .ascii "Unesite bazu rezultata:\0"
len3 = . - ulaz3
baza2_str: .fill 3,1,42
baza2: .long 0

izlaz1:     .ascii "Rezultat:\0"
len4 = . - izlaz1
rezultat_str: .fill 10,1,42
rezultat: .long 0

greska1:    .ascii "Greska: pogresan znak!\0"
len5 = . - greska1
greska2:    .ascii "Greska: prekoracenje!\0"
len6 = . - greska2

gornja_granica_sistema: .long 0
donja_granica_sistema: .long 0

greska: .byte 0
broj_1: .long 0
broj_2: .long 0

.section .text
.global main





















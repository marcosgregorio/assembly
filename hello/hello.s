.global _start


.text
_start:
    
	li a0, 1
	la a1, palavra
	li a2, 4
	li a7, 64
	ecall 

	li a0, 2
	li a7, 93
	ecall 

.data
palavra: .ascii "ola\n"
palavra_ao_contrario: .ascii "alo\n"
 

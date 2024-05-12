.global _start


.text
_start:
    
	li a0, 1
	la a1, hello
	li a2, 13
	li a7, 64
	ecall 

	li a0, 2
	li a7, 93
	ecall 

.data
hello: .ascii "Hello world!\n"
 
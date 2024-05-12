.global main

.data
A: .word 2
B: .word 3
C: .word 1

.text

main:
	lw t0, A
	lw t1, B
	lw t2, C

	add t3, t1, t2
	jal calcula_triangulo


calcula_triangulo:
	blt t0, t3, print_stdout_1 # e um triangulo
	jal print_stdout_0 # nao e um triangulo

saida_do_sistema:
	li a0, 2
	li a7, 93
	ecall 

print_stdout_1: 
	li a0, 1
	la a1, _um
	li a2, 2
	li a7, 64
	ecall 
	jal saida_do_sistema

print_stdout_0:
	li a0, 1
	la a1, _zero
	li a2, 2
	li a7, 64
	ecall
	jal saida_do_sistema


.data
_um: .ascii "1\n"
_zero: .ascii "0\n"
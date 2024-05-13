.data

vetor: .word 5, 4, 3, 2, 42
vetor_ordenado: .space 20 # tamanho do meu vetor * 4 (bytes)

.text
.global main
main:
	la a0, vetor
	li a1, 5
	jal ra, bubble_sort
end:
	li a7, 10
	ecall

bubble_sort:
	li t0, 0 # iteradores
	li t1, 0
	jal loop_step

	ret

loop_step:
	bge t0, a1, end
	
	lw t2, 0(a0)
	lw t4, 1(a0)
	mv t3, a0 # aux pra guardar o endereco do vetor
	
	jal ra, loop_elemento
	
	# somar o endereco pulando 4 bytes
	addi t3, t3, 4
	mv a0, t3

	addi t0, t0, 1 # i + 1
	j loop_step

loop_elemento:
	blt t4, t3, swap
	
	ret

swap:
	
	ret

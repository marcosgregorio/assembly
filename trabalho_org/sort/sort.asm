.data
# Nao consegui terminar a tempo ;(
vetor: .word 5, 4, 3, 2, 42
#vetor_ordenado: .space 20 # tamanho do meu vetor * 4 (bytes)

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
	li t0, 0 # step
	li t1, 0 # i
	jal loop_step

	ret

loop_step:
	bge t0, a1, end
	
	lw t2, 0(a0) # valor atual
	
	mv t3, a0 # aux pra guardar o endereco do vetor
	mv t5, a0 # copia para o loop interno
	
	addi t5, t5, 4 # salta 4 bytes ( tamanho - o passo atual )

	jal ra, loop_elemento
	
	# somar o endereco pulando 4 bytes
	addi t3, t3, 4
	mv a0, t3

	addi t0, t0, 1 # step + 1
	j loop_step

loop_elemento:
	li t6, 0
	add t6, a1, t0

	bge t1, t6, loop_step # ( (!<) size - step - 1)
	lw t4, 0(t5) # proximo valor
	
	blt t4, t2, swap
	
	addi t5, t5, 4 # salta 4 bytes
	addi t1, t1, 1 # i + 1
	
	j loop_elemento
	ret

swap:
	sw t4, 0(a0)
	
	li a2, 0
	li a3, 4
	mul a2, t1, a3 # indice * 4
	mv a4, a0 # salvar o endereco do vetor original
	add a0, a0, a2
	
	sw t2, 0(a0+t1)
	ret

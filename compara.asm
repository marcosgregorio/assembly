.data
vetor: .word -5 1 2 3 4

.text
.global diferenca

diferenca:
	la a0, vetor
	li a1, 4
	
	lw t0, 0(a0)
	lw t1, 0(a0)
	
	li t4, 0 # iterador
compara:
	lw t2, 0(a0)
	blt a1, t4, end
	blt t2, t0, troca_menor
	blt t1, t2, troca_maior
	
	addi t4, t4, 1
	addi a0, a0, 4
	j compara
	
troca_menor:
	lw t0, 0(a0)
	j compara
	
troca_maior:
	lw t1, 0(a0)
	j compara
	
end:
	mv a0, t0
	li a7, 1
	ecall
	
	mv a0, t1
	li a7, 1
	ecall
	
	li a7, 10
	ecall

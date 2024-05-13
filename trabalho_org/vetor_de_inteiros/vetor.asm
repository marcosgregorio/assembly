.data

vetor: .word 42, 2, 3, 4, 5
palavra: .ascii "tamanho do vetor e: "
espaco: .ascii " "
quebra: .ascii "\n"
.text
.global main

main:
	li a1, 5 # length do meu vetor
	li a2, 0 # iteracao atual
	jal ra, print_tamanho_vetor
	
	la a0, vetor # enderecando o vetor
	jal ra, itera_vetor

	j end
end:
	li a7, 10
	ecall

itera_vetor:
	bge a2, a1, end
	
	lw t0, 0(a0)
	mv t1, a0 # aux pra guardar o endereco do vetor
	
	jal ra, print_valor_do_array
	
	# somar o endereco pulando 4 bytes
	addi t1, t1, 4
	mv a0, t1

	addi a2, a2, 1 # i + 1
	j itera_vetor

print_valor_do_array:
	li a0, 0
	
	add a0, a0, t0
	li a7, 1
	ecall
	
	la a0, espaco
	li a7, 4
	ecall

	ret

print_tamanho_vetor:
	la a0, palavra
	li a7, 4
	ecall

	li a0, 0
	add a0, a0, a1

	li a7, 1
	ecall

	la a0, quebra
	li a7, 4
	ecall
	ret

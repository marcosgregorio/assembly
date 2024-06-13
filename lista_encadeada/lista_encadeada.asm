.data
	mensagemMenu: .string "\n1) Insere um elemento na lista \n2) Remover elemento da lista por indice \n3) Remover elemento da lista por valor \n4) Mostrar todos os elementos da lista \n5) Mostrar estatisticas \n6) Sair do programa\n"
	mensagemInserirElemento: .string "\nPor favor, insira um numero na lista: \n"
	mensagemFim: .string "\nFim do programa\n"
	mensagem: .string "\n retornado da funcao"
	valorInserido: .string "\n Valor inserido com sucesso! Tamanho: "
.text
# a4 tam do minha lista
# sp seria meu head
main:
	la a0, mensagemMenu
	li a7, 4 # printa mensagem do menu
	ecall
	
	li t1, 1
	li t2, 2
	li t3, 3
	li t4, 4
	li t5, 5
	li t6, 6

	li a7, 5
	ecall
	
	beq a0, t1, insert_element_into_list
	beq a0, t2, remove_element_by_index
	beq a0, t3, remove_element_by_value
	beq a0, t4, print_list
	beq a0, t5, show_statistics
	beq a0, t6, end_program

insert_element_into_list:
	la a0, mensagemInserirElemento
	li a7, 4
	ecall

	li a7, 5
	ecall

	# copiando o valor do inserido no input
	mv t2, a0


  	# pegando o head e armazendo em a3
	add a3, sp, zero
	add t1, a4, zero
	
	jal insere_inteiro
	
	la a0, mensagem
	li a7, 4
	ecall
	# tratar se a alocação foi feita com sucesso. Se for, deve retornar a posição da memoria.
	# se não, retorna -1. 
	
	j main

insere_inteiro:

	# beq t1, zero, insert_into_end_of_list
	beq t1, zero, insert_first_element

	j insert_after
	# carrega o proximo endereco
	#addi a3,a3, 4

	#bnez a6, insert_into_end_of_list
	
	ret

insert_first_element:
	add a3, sp, zero
	
	li a7, 9
	li a0, 8
	ecall
	
	# insere o valor do input
	sw t2, 0(a0)
	sw zero, 4(a0)
	
	# sp está apontando para o primeiro endereço
	sw a0, 0(sp)
	
	addi a4, a4, 1
	
	# printa que o valor que foi inserido e o tamanho da lista
	la a0, valorInserido
	li a7, 4
	ecall

	#lw a0, 0(sp)
	#li a7, 1
	#ecall

	add a0, a4, zero
	li a7, 1	
	ecall
	# corrigir esse retorno
	j main
insert_after:
	lw t3, (sp)
	lw t4, 4(sp)
	lw t3, 0(t3)
	# imprime o valor atual
	#mv a0, t3
	#li a7, 1
	#ecall
	
	beqz t4, insert_last
	# valor atual e menor que o valor do input?
	ble t3, a0, go_to_next_value
	
insert_last:
	addi t5, sp, 4
	
	li a0, 8
	li a7, 9
	ecall
	

	sw t2, 0(a0)
	sw zero, 4(a0)
	
	# armazendo o endereco de a0 em sp + 4
	sw a0, 0(t5)
	
	# print para ver se o valor esta la correto
	#lw t1, 4(sp)
    	#lw a0, 4(t1)
	#li a7, 1
	#ecall
	j main

go_to_next_value:
	lw t3, 0(t4)
	lw t4, 4(t4)
	mv a0, t3
	li a7, 1
	ecall
# printa que o valor que foi inserido e o tamanho da lista

#insert_into_end_of_list:
#	sw a1, 0(a3)
#	sw zero, 4(a3)
  	#addi a4, a4, 1

remove_element_by_index:

remove_element_by_value:

print_list:

show_statistics:

end_program:
	la a0, mensagemFim
	
	li a7, 4
	ecall
	
	nop
	li a7, 93
	ecall 	

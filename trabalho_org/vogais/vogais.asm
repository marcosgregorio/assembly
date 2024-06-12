.data
#palavra: .ascii "palavra"
input_str: .space 200
output_str: .space 200
mensagem: .ascii "digite uma palavra: "
vocais: .ascii "aeiou"

.text
.global main
main:
	
	jal ra, imprime_msg
    
    	la a0, input_str
    	li a1, 200
    	li a7, 8
    	ecall
	
	la a0, input_str # armazena a string inputada
	
	li a7, 4 # print de teste

	la a1, output_str
	j remove_vocais
	ecall

	la a0, output_str
	li a7, 4
	ecall

end:
	li a7, 10
	ecall

imprime_msg:
	la a0, mensagem
    	li a7, 4
    	ecall
	ret

remove_vocais:
	mv t0, a0
	mv t1, a1

loop:
	lbu t2, 0(t0)
	beqz t2, end_vogais
	ret
	la t3, vocais
	li t4, 0
verifica_vocais:
	lbu t5, 0(t3) # pegandoa as vogais agora
	beqz t3, fim_vogais # byte 0 nao eh vogal
	beq t2, t5, eh_vogal
	addi t3, t3, 1
	j verifica_vocais
eh_vogal:
	addi t0, t0, 1
	j loop
fim_vogais:
    	sb t2, 0(t1) # coloca a consoante na string da saida
    	addi t0, t0, 1 # move a string para o proximo char.
    	addi t1, t1, 1
    	j loop

end_vogais:
    sb zero, 0(t1) # armazena o 0 no fim da string
    ret

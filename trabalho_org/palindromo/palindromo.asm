.global main

.data
# filme bao do Nolan pra tu ver depois
string: .ascii "tenet"   
#string_ao_contrario: .ascii "alo"
.text

main:
	la a0, string
	la a1, string
	addi a1, a1, 5  # para ler ao contraio, eu faco o lenght da palavra - 1

verifica_palindrome:
	bge a0, a1, nao_eh_palindrome 
	# Carrega o valor de caractere atual da posição do registrador
	lb t0, 0(a0)
	lb t1, 0(a1)
	beq t0, t1, continua_loop # if de se os carecteres sao iguais, continua
    	li a0, 0
    	j end

continua_loop:
    	addi a0, a0, 1
    	addi a1, a1, -1
    	j verifica_palindrome

nao_eh_palindrome:
    	li a0, 1

end:
    	li a7, 1
    	mv a0, a0
	# printa o valor de se e 1 ou 0
    	ecall 


.data
    text: .asciiz "dozwoloneznaki"
    key: .asciiz "klucz"
    line: .asciiz "\n"
    space: .asciiz "  "
    arrow: .asciiz "->"
    reset: .asciiz "resetCounter"
    encTextPrompt: .asciiz "Type in the message you want to encrypt(max. 16 characters)"
	decTextPrompt: .asciiz "Type in the message you want to decrypt(max. 16 characters)"
	userInputText: .space 18
	userInputKey: .space 18
	keyPrompt: .asciiz "Type in the key(max. 8 characters)"
	encText: .asciiz "The encrypted message: "
	decText: .asciiz "The decrypted message: "

.text
 
    main:  
    
    	#asks for the message
		li $v0, 4
		la $a0, encTextPrompt
		syscall
		
		#gets the input from the user
		li $v0, 8
		la $a0, userInputText
		li $a1, 17
		syscall
		
		#saves the input in the $t0 register
		move $t4, $a0
		
		li $v0, 4
		la $a0, line
		syscall
		
		#asks for the key
		li $v0, 4
		la $a0, keyPrompt
		syscall
		
		#gets the input from the user
		li $v0, 8
		la $a0, userInputKey
		li $a1, 17
		syscall
		
		#saves the input in the $t1 register
		move $t5, $a0
		
		li $v0, 4
		la $a0, line
		syscall
   	
   	addi $t0, $zero, 0
   	addi $t1, $zero, 0
   	
   	while:
   	
   		bgt $t0, 16, resetCounter
   		bgt $t1, 16, exit
   		
   		#li $v0, 11
   		lb $a0, userInputKey($t0)
   		#syscall
   		
   		move $t2, $a0
   		
   		#li $v0, 4
		#la $a0, space
		#syscall
   		
   		#li $v0, 11
   		lb $a0, userInputText($t1)
   		#syscall
   		
 		move $t3, $a0
 		
 		#li $v0, 4
		#la $a0, space
		#syscall
		
	encrypt:
	decrypt:
   		
		add $t2, $t2, $t3
   		sub $t2, $t2, 194
   		
   		bgt $t2, 25, substract
   		
	continue:
   	
   		add $t2, $t2, 97
   		
   		li $v0, 1
   		move $a0, $t2
   		syscall
   		
   		li $v0, 4
		la $a0, line
		syscall
   		
   		addi $t0, $t0, 1
   		addi $t1, $t1, 1
   		
   		j while
  	
   exit:
 
  	li $v0, 10
  	syscall

   resetCounter:
   
	li $t0, 0
   	j while
   	
   substract:
   	sub $t2, $t2, 26
   	
   	j continue
   	
   
   decrypt:

	add $t3, $t3, 97			
   	sub $t3, $t3, $t2
   		
   	blt $t3, 97, add
				
	continue2:
   	   		
   	li $v0, 1
   	move $a0, $t2
   	syscall
   		
   	li $v0, 4
	la $a0, line
	syscall
   		
   	
   	addi $t0, $t0, 1
   	addi $t1, $t1, 1
   		
   	j while
   	
   add: 
	add $t3, $t3, 26
  		
	j continue2
   	

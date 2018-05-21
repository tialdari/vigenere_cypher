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
	keyPrompt: .asciiz "Type in the key(max. 16 characters)"
	encText: .asciiz "The encrypted message: "
	decText: .asciiz "The decrypted message: "
	operationPrompt: .asciiz "Choose operation (encryption: 0 decryption: 1) "

.text
 
    main:  
    	#asks for the operation
		li $v0, 4
		la $a0, operationPrompt
		syscall
	
		#takes the input (0 or 1)
		li $v0, 5
		syscall
	
		#saves the input in the $t0 register
		move $t6, $v0
		
    
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
		
		#checks which operation the user has chosen and continues according to the operation
		beq $t6, 0, encrypt
		beq $t6, 1, decrypt
		
   	
  	addi $t0, $zero, 0
   	addi $t1, $zero, 0
   	
   	encrypt:
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
		

   		
		add $t2, $t2, $t3
   		sub $t2, $t2, 194
   		
   		bgt $t2, 25, substract
   		
	continue:
   	
   		add $t2, $t2, 97
   		
   		li $v0, 11
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

   	while2:
   	
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

		add $t3, $t3, 97																						
   		sub $t3, $t3, $t2
   		
   		blt $t3, 97, add
				
   	continue2:
   	   		
   		li $v0, 11
   		move $a0, $t3
   		syscall
   		
   		#li $v0, 4
		#la $a0, line
		#syscall
   		
   	
   		addi $t0, $t0, 1
   		addi $t1, $t1, 1
   		
   		j while2

	add: 
		add $t3, $t3, 26
  		
	   	j continue2

  	
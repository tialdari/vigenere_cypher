.data
    text: .asciiz "dozwoloneznaki"
    key: .asciiz "klucz"
    line: .asciiz "\n"
    space: .asciiz "  "
    arrow: .asciiz "->"
    reset: .asciiz "resetCounter"

.text
 
    main:  
   	
   	addi $t0, $zero, 0
   	addi $t1, $zero, 0
   	
   	while:
   	
   		bgt $t0, 4, resetCounter
   		bgt $t1, 16, exit
   		
   		lb $a0, key($t0)
   		move $t2, $a0
   		
   		lb $a0, text($t1)
 		move $t3, $a0
   		
		add $t2, $t2, $t3
   		sub $t2, $t2, 194
   		
   		bgt $t2, 25, substract
   		
   	continue:
   	
   		add $t2, $t2, 97
   		
   		li $v0, 11
   		move $a0, $t2
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
   	
.data
    text: .asciiz "dozwoloneznakiheh"
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
   		
   		li $v0, 11
   		lb $a0, key($t0)
   		syscall
   		
   		move $t2, $a0
   		
   		li $v0, 4
   		la $a0, space
   		syscall
   		
   		li $v0, 11
   		lb $a0, text($t1)
   		syscall
   		
   		move $t3, $a0
   		
   		li $v0, 4
   		la $a0, arrow
   		syscall
   		
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
   	
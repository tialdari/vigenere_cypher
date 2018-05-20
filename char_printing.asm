.data
    string: .asciiz "dozwolone16znakow"
    char: .asciiz "c"
    line: .asciiz "\n"

.text
.globl main
    main:   

   	la $a0, string 
   	addi $t0, $zero, 0  
   			           # load the addr of the given string into $a0. 
	
	
	while:
	#sbeqz $a1, exit


	
   	 li $v0, 1                 # service 11 is print character
   	 lb  $a0, string($t0)
   	 move $t1, $a0
   	 bgt $t0, 16, exit
   	 syscall
   	 
   	
   	la $a0, line
	li $v0,4
	syscall
   	 
   	 addi, $t0, $t0, 1
   	 
   	j while
  
    exit:
    li $v0, 10                # return control to SPIM OS
    syscall
   	 
   	 
   

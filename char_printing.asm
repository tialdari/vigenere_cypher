.data
    string: .asciiz "domek "
    char: .asciiz "c"

.text
.globl main
    main:   

   	la $a0, string 
   	addi $t0, $zero, 0  
   			           # load the addr of the given string into $a0. 
	
	
	while:
	#sbeqz $a1, exit


	
   	 li $v0, 11                  # service 11 is print character
   	 lb  $a0, string($t0)
   	    	 beqz $a0, exit
   	 syscall
   	 

   	 
   	 addi, $t0, $t0, 1
   	 
   	j while
  
    exit:
    li $v0, 10                # return control to SPIM OS
    syscall
   	 
   	 
   

.data
    text: .asciiz "dozwoloneznakowhj"
    key: .asciiz "klucz"
    line: .asciiz "\n"
    space: .asciiz "  "
    plus: .asciiz "+"
    arrow: .asciiz "->"
    equals: .asciiz "="

.text
 
    main:   

   	la $a0, text 		#load the text at the register $a0
   	la $a1, key		#load the key at the register $a1
   	
   	addi $t0, $zero, 0  	#initialise the counter for the text
   	addi $t1, $zero, 0	#initialise the counter for the key
   	
  while:
  
  
	
	bgt $t1, 4, resetKeyCounter #jeśli program przeszedł przez klucz, zamień licznik na 0
   	

   	
   	li $v0, 11
   	lb  $a0, text($t0)	   #załaduj kolejną literę tekstu
   	bgt $t0, 16, exit	   #jeśli program preszedł przez cały tekst, zakończ go
	syscall
	
	li $v0, 4
	la $a0, plus
	syscall
	
   	li $v0, 11
	lb $a1, key($t1)
	syscall
	


   		# załaduj kolejną literę klucza
   	
   	add  $t2, $a0, $a1	# dodaj reprezentację  litery klucza i litery tekstu

	sub  $t3, $t2, 97
	
	
	#drukuje wynik
	li $v0, 4
	la $a0, equals
	syscall
		
	li $v0, 1
	move $a2, $t2
	syscall
   	
   	la $a0, line
	li $v0,4
	syscall
   	 
   	 
   	 
   	addi, $t0, $t0, 1
   	addi, $t1, $t1, 1
   	 
   	j while
  
    exit:
    
    	li $v0, 10               
    	syscall
   	 
   resetKeyCounter:
  
   	sub $t1, $t1, 4
   	j while

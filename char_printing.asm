.data
    string: .asciiz "stringer"
    char: .asciiz "c"

.text
.globl main
    main:   


   la $a0, string              # load the addr of the given string into $a0. 
   

    li $v0, 11                  # service 11 is print character
    lb  $a0, 0 ($a0)
    syscall

    exit:
    li $v0, 10                # return control to SPIM OS
    syscall
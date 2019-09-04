.data 
	myage: .asciiz "\n This is my age: "
	age: .word 23 # integer 

.text 
# print an integer to the screen 
	la $a0 myage # load address in the register $a0 
	li $v0 4 # load immediate in the register $v0, 4 means print string
	syscall

li $v0, 1
lw $a0, age 
syscall 
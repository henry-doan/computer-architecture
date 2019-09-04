.data 
	prompt1: .asciiz  "Enter the first Number: \n"
	prompt2: .asciiz  "Enter the second Number: \n"
	menu: .asciiz "Enter an integer number to display the results of the operations: add, subtract, multiply \n"
	resultText1: .asciiz "\n Your add final result is="
	resultText2: .asciiz "\n Your subtract final result is="
	resultText3: .asciiz "\n Your product final result is="
.text

# asking the user to provide first num
	li $v0, 4 # print a string
	la $a0, prompt1 # loading the string to print into the arg to enable printing
	syscall # execute command
	
	# read the num provided by user
	li $v0, 5 # read int
	syscall 
	move $t0, $v0 # move the num read from the input into a temp register t0 
	
	#asking the user for second num
	li $v0, 4
	la $a0, prompt2 
	syscall 
	
	# read the num provided by user
	li $v0, 5 # read int
	syscall 
	move $t1, $v0 # move the num ream from the input into a temp register t0 
	
	
	li $v0, 4 
	la $a0, menu 
	syscall 
	
	# read nnum provided by users
	li $v0, 5
	syscall 
	move $t2, $v0
	
	beq $t2, $t3, addProcess # branch to add process
	beq $t2, $t4, subtractProcess # branch to add process
	beq $t2, $t5, multiplyProcess # branch to add process
	
	addProcess:
	add $t6,$t0,$t1 #adds t0 and t1 and assigns to t6
	
	#print results
	li $v0, 4
	la $a0, resultText1
	syscall 
	
	li $v0, 1
	la $a0, ($t6)
	syscall 
	
	li $v0, 10 # terminate program
	
	
	subtractProcess:
	sub $t6,$t0,$t1 # subtract t0 and t1 and assign to t6 
	
	li $v0, 4
	la $a0, resultText2
	syscall 
	
	li $v0, 1
	la $a0, ($t6)
	syscall 
	
	li $v0, 10 # terminate program
	
	multiplyProcess:
	mul $t6,$t0,$t1 # multiply t0 and t1 and assign to t6 
	
	li $v0, 4
	la $a0, resultText3
	syscall 
	
	li $v0, 1
	la $a0, ($t6)
	syscall 
	
	li $v0, 10 # terminate program	
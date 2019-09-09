.data 
	prompt1: .asciiz  "Enter the first Number: \n"
	prompt2: .asciiz  "Enter the second Number: \n"
	prompt3: .asciiz  "Enter the third Number: \n"
	sumresults: .asciiz  "The Sum of all numbers is: \n"
	minresults: .asciiz  "The Smallest of all numbers is: \n"
	maxresults: .asciiz  "The Biggest of all numbers is: \n"
.text
	# Display first prompt and store first number
	li $v0, 4
	la $a0, prompt1
	syscall 
	
	li $v0, 5
	syscall 
	move $t0, $v0
	
	# Display second prompt and store second number
	li $v0, 4
	la $a0, prompt2
	syscall 
	
	li $v0, 5
	syscall 
	move $t1, $v0
	
	# Display second prompt and store second number
	li $v0, 4
	la $a0, prompt3
	syscall 
	
	li $v0, 5
	syscall 
	move $t2, $v0

addProcess:
	add $t6, $t0, $t1
	add $t7, $t6, $t2
	
	li $v0, 4
	la $a0, sumresults
	syscall 
	
	li $v0, 1
	la $a0, ($t7)
	syscall

minProcess: 
	
	
maxProcess:
	
	
	
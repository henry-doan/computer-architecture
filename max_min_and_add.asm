.data 
	prompt1: .asciiz  "Enter the first Number (0 to exit): \n"
	prompt2: .asciiz  "Enter the second Number: \n"
	prompt3: .asciiz  "Enter the third Number: \n"
	sumresults: .asciiz  "\n The Sum of all numbers is: \n"
	minresults: .asciiz  "\n The Smallest of all numbers is: \n"
	maxresults: .asciiz  "\n The Biggest of all numbers is: \n"
	bye: .asciiz "\n see ya later \n"

.text
main:
	# display first prompt and store first number
	li $v0, 4
	la $a0, prompt1
	syscall 
	
	li $v0, 5
	syscall 
	move $t0, $v0
	
	# if the first number is 0 then go to done
	blez $t0, done
	
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

# add all three numbers
addProcess:
	add $t6, $t0, $t1
	add $t7, $t6, $t2
	
	li $v0, 4
	la $a0, sumresults
	syscall 
	
	li $v0, 1
	la $a0, ($t7)
	syscall

# min process
minProcess: 
	blt $t0, $t1, compare1and3
	
	blt $t1, $t0, compare2and3
	
	
compare1and3:
	blt $t0, $t2, firstnumMin
	
	blt $t2, $t0, thirdnumMin
	
compare2and3: 
	blt $t1, $t2, secondnumMin
	
	blt $t2, $t1, thirdnumMin
	
firstnumMin:
	li $v0, 4
	la $a0, minresults
	syscall 
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	blt $t0, $t2, maxProcess
	
secondnumMin:
	li $v0, 4
	la $a0, minresults
	syscall 
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	blt $t1, $t2, maxProcess
	
thirdnumMin:
	li $v0, 4
	la $a0, minresults
	syscall 
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	
	blt $t2, $t0, maxProcess
#max	
maxProcess:
	bgt $t0, $t1, compare1and3max
	
	bgt $t1, $t0, compare2and3max
	
	
compare1and3max:
	bgt $t0, $t2, firstnumMax
	
	bgt $t2, $t0, thirdnumMax
	
compare2and3max: 
	bgt $t1, $t2, secondnumMax
	
	bgt $t2, $t1, thirdnumMax
	
firstnumMax:
	li $v0, 4
	la $a0, maxresults
	syscall 
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	bgt $t0, $t2, main
	
secondnumMax:
	li $v0, 4
	la $a0, maxresults
	syscall 
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	bgt $t1, $t2, main
	
thirdnumMax:
	li $v0, 4
	la $a0, maxresults
	syscall 
	
	li $v0, 1
	la $a0, ($t2)
	syscall

	bgt $t2, $t0, main

# finish program
done: 
	li $v0, 4
	la $a0, bye
	syscall 
	
	li $v0, 10
	syscall 
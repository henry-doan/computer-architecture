.data 
	prompt1: .asciiz  "\n Enter the first Number (0 to exit): \n"
	prompt2: .asciiz  "Enter the second Number: \n"
	prompt3: .asciiz  "Enter the third Number: \n"
	sumresults: .asciiz  "\n The Sum of all numbers is: \n"
	minresults: .asciiz  "\n The Smallest of all numbers is: \n"
	maxresults: .asciiz  "\n The Biggest of all numbers is: \n"
	bye: .asciiz "\n See you Later \n"

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
	# if the first number is less than second number then go to compare1and3
	blt $t0, $t1, compare1and3
	
	# if the second number is less than third number then go to compare2and3
	blt $t1, $t0, compare2and3
	
compare1and3:
	# if the first number is less than third number then first num is min
	blt $t0, $t2, firstnumMin
	
	# if the third number is less than first number then third num is min
	blt $t2, $t0, thirdnumMin
	
compare2and3: 
	# if the second number is less than thrid number then second num is min
	blt $t1, $t2, secondnumMin
	
	# if the third number is less than second number then third num is min
	blt $t2, $t1, thirdnumMin

# print out the first number as min
firstnumMin:
	li $v0, 4
	la $a0, minresults
	syscall 
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	# go to the max process
	blt $t0, $t2, maxProcess

# print out the second number as min	
secondnumMin:
	li $v0, 4
	la $a0, minresults
	syscall 
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	# go to the max process
	blt $t1, $t2, maxProcess

# print out the second number as min	
thirdnumMin:
	li $v0, 4
	la $a0, minresults
	syscall 
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	
	# go to the max process
	blt $t2, $t0, maxProcess
#max	
maxProcess:
	# if the first number is greater than second number then go to compare1and3max
	bgt $t0, $t1, compare1and3max
	
	# if the second number is greater than the first number then go to compare2and3max
	bgt $t1, $t0, compare2and3max
	
	
compare1and3max:
	# if the first number is greater than third number then first is max
	bgt $t0, $t2, firstnumMax
	
	# if the third number is greater than first number then third is max
	bgt $t2, $t0, thirdnumMax
	
compare2and3max
	# if the second number is greater than thrid number then second is mac
	bgt $t1, $t2, secondnumMax
	
	# if the third number is greater than second number then third is max
	bgt $t2, $t1, thirdnumMax

# first num is max 	
firstnumMax:
	li $v0, 4
	la $a0, maxresults
	syscall 
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	# return back to the start
	bgt $t0, $t2, main

# second num is max 	
secondnumMax:
	li $v0, 4
	la $a0, maxresults
	syscall 
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	# return back to the start	
	bgt $t1, $t2, main
	
# third num is max 		
thirdnumMax:
	li $v0, 4
	la $a0, maxresults
	syscall 
	
	li $v0, 1
	la $a0, ($t2)
	syscall

	# return back to the start
	bgt $t2, $t0, main

# finish program and display good bye message
done: 
	li $v0, 4
	la $a0, bye
	syscall 
	
	li $v0, 10
	syscall 
.data 
	prompt: .asciiz "Input 10 Numbers in the array to get reversed: \n"
	results: .asciiz "Reverse of array: \n"
	newline: .asciiz "\n"
	x: .word 0:10
.text
	main:
		la $a0, prompt
		li $v0, 4
		syscall 
		
		li $s0, 0
		la $s1, x
		
	# Loop through all items	
	loop:
		li $v0, 5
		syscall 
		
		mul $t0, $s0, 4
		add $t0, $s1, $t0
		sw $v0, ($t0)
		add $s0, $s0, 1
		slti $t7, $s0, 10
		bne $t7, $zero, loop
		
		la $a0, results
		li $v0, 4
		syscall 
		
		li $s0, 9
		
	# loop through backqards
	loop2:
		mul $t3, $s0, 4
		add $t0, $s1, $t3
		
		la $a0, newline
		li $v0, 4
		syscall
		
		addi $s0, $s0, -1
		lw $a0, ($t0)
		li $v0, 1
		syscall 
		
		bne $s0, $zero, loop2
		mul $t3, $s0, 4
		add $t0, $s1, $t3
		
		la $a0, newline
		li $v0, 4
		syscall 
		
		lw $a0, ($t0)
		li $v0, 1
		syscall 
		
		li $v0, 10
		syscall
		
		
		
		
		
		
		
		
		
		
		
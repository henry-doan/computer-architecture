.data 
	ask1: .asciiz "\n Enter the first number: "
	ask2: .asciiz "\n Enter the second number: "
	ask3: .asciiz "\n Enter the third number: "
	ask4: .asciiz "\n Enter the fourth number: "
	result: .asciiz "\n The return value of the leaf example function: "
.text
	main: 
		li $v0, 4
		la $a0, ask1
		syscall 
		
		li $v0, 5
		syscall 
		
		move $t0, $v0
		li $v0, 4
		la $a0, ask2
		syscall 
		
		li $v0, 5
		syscall 
			
		move $t1, $v0
		li $v0, 4
		la $a0, ask3 
		syscall 
		
		li $v0, 5
		syscall	
		
		move $t2, $v0
		li $v0, 4
		la $a0, ask4
		syscall 
		
		li $v0, 5
		syscall
		
		move $t3, $v0
		move $a0, $t0
		move $a1, $t1
		move $a2, $t2
		move $a3, $t3		
		
		jal leaf_example
		
		li $v0, 4
		la $a0, result
		syscall 
		
		li, $v0, 1
		move, $a0, $v1
		syscall 
	li $v0, 10
	syscall 
	
	leaf_example:
		add $t0, $a0, $a1
		add $t1, $a2, $a3
		sub $v1, $t0, $t1
		jr $ra
		
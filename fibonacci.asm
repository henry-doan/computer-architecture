.data 
	prompt: .asciiz  "\n Input a value for N for the Fibonacci series:"
	.globl main
.text
	main: 
		li $v0 4
		la $a0, prompt
		syscall 
		
		li $v0, 5
	 	syscall 
	 	
	 	move $t2, $v0    

		move $a0, $t2
		move $v0, $t2
		jal fib  
		move $t3,$v0    #result is in $t3

		move $a0,$t3    #Print the answer
		li $v0,1
		syscall

		li $v0,10
		syscall 
	 	
	#  Fibonacci logic
	fib:

		beqz $a0, zero   #if n = 0 
		beq $a0, 1, one   #if n = 1 

		sub $sp, $sp, 4   
		sw $ra, 0($sp)

		sub $a0, $a0, 1   # n-1
		jal fib     # fib(n-1)
		add $a0, $a0, 1

		lw $ra, 0($sp)   
		add $sp, $sp, 4

		sub $sp, $sp, 4   
		sw $v0, 0($sp)

		sub $sp, $sp, 4  
		sw $ra, 0($sp)

		sub $a0, $a0, 2   #n-2
		jal fib     # fib(n-2)
		add $a0, $a0, 2

		lw $ra, 0($sp)   
		add $sp, $sp, 4

		lw $s7, 0($sp)  
		add $sp, $sp, 4

		add $v0, $v0, $s7
		jr $ra 

	# return zero
	zero:
		li $v0, 0
		jr $ra
	# return 1
	one:
		li $v0, 1
		jr $ra

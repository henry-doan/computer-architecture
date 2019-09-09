.data 
	msg0: .asciiz "\n Factorial"
	msg1: .asciiz "\n Type in a number:"
	msg2: .asciiz "\n The factorial is: "
.text
	main: 
		la $a0 msg0
		li $v0 4
		syscall 
		
		la $a0 msg1
		syscall 
		
		li $v0 5
		syscall 
		
		move $t0 $v0
		beqz $t0 factorial_zero
		addi $t1 $t0-1 
		
	loop:
		beqz  $t1 fact
		mul $t0 $t0 $t1
		addi $t1 $t1-1
		b loop
		
	fact: 
		la $a0 msg2
		li $v0 4
		syscall 
		
		move $a0 $t0
		li $v0 1
		syscall 
		b exit
		
	factorial_zero: 
		li $t0, 1
		b fact
		
	exit: 
		li $v0 10
		syscall 
	
	
	
	
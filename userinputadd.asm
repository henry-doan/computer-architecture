.data 
	str1: .asciiz  "Enter Two Number: \n"
	str2: .asciiz  "The Sum: \n"
	
.text
	li $v0, 4
	la $a0, str1
	syscall 
	
	li $v0, 5 
	syscall 
	
	add $t0, $v0, $zero
	li $v0, 5
	syscall 
	
	add $t1, $v0, $zero
	li $v0, 4
	la $a0, str2 
	syscall
	
	 li $v0, 1
	 add $a0, $t1, $t0
	 syscall  
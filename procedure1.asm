.data 
	message: .asciiz "\nHello my name is:"
.text
	main:
	jal displaymessage # jumper link and call the function
	li, $v0, 1
	add $a0, $zero, 5
	syscall 
	
	li $v0, 10
	syscall 
	
	displaymessage:
	li $v0, 4
	la $a0, message
	syscall 
	
	jr $ra # return to the function
	
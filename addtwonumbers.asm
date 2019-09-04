.data 
	number1: .word 5
	number2: .word 10 
.text 
# pring an addition to the screen
	lw $t0, number1 ($zero)
	lw $t1, number2 ($zero)
	
	add $t2, $t0, $t1 # t2 = t0+t1
	
	li $v0,1 # load immediate in the register $v0, 1 means print integer
	add $a0,$zero,$t2
	syscall 
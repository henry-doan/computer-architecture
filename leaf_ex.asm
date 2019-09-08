leaf_example:
	addi $sp, $sp, -4	
  	sw  $s0, 0($sp)
	add $t0, $a0, $a1	
 	add $t1, $a2, $a3
	sub $s0, $t0, $t1
	lw  $s0, 0($sp)
	addi $sp, $sp, 4
	jr  $ra
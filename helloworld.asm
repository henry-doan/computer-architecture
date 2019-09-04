.data
Hello: .asciiz "\n Hello World :) !"

.text 
main: 
la $a0 Hello # load addess in the register $a0 
li $v0 4 # load immediate in the register $v0, 4 means printing a string
syscall # tell the program to execute now
li $v0 10 # exit execution 
syscall 
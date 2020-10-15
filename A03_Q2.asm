.data

str:		.asciiz 	"Enter a 3 digit number: "
buffer:		.space 		 4	# 3 bytes for 3 chars and 1 byte for null terminator
result:		.asciiz		"\nThe sum of the 3 digits is: "

 
.globl main
.text

main:

	# Print the statement to prompt user to enter a 3 digit number
	li $v0, 4
	la $a0, str
	syscall
	
	
	# Read the number as a sequence of numerical chars
	li, $v0, 8
	la $a0, buffer	# Load the memory address where the chars are stored
	li $a1, 4	# Restrict to only 3 chars and 1 for null terminator
	syscall
	
	# Print the statement to show results
	li $v0, 4
	la $a0, result
	syscall
	
	la $t0, buffer # Load the base address
	
	lb $t1, ($t0) # Load the first byte (first digit) as char
	addi $t1, $t1, -0x30 # Hexadecimal value of '0' is 0x30
	add $a0, $0, $t1 # Add the value to a0
	
	lb $t1, 1($t0) # Load the second byte (second digit) as char
	addi $t1, $t1, -0x30 # Hexadecimal value of '0' is 0x30
	add $a0, $a0, $t1 # Add the value to a0
	
	lb $t1, 2($t0) # Load the third byte (third digit) as char
	addi $t1, $t1, -0x30 # Hexadecimal value of '0' is 0x30
	add $a0, $a0, $t1 # Add the value to a0
	
	
	# Print the sum
	li $v0, 1
	syscall
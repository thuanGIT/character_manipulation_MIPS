.data

str:		.asciiz		"Enter three characters: "
# 3 bytes for 3 chars and 1 byte for null terminator
result:		.asciiz		"\nYour characters in reverse order: "
buffer:		.space		4


.globl main
.text
main:
	# Print the statement to prompt user to enter a sequence of 3 chars
	li $v0, 4 
	la $a0, str # Load the memory address of str into a0
	syscall
	
	# Read the string
	li $v0, 8
	la $a0, buffer # Load the memory address where the string is stored
	li $a1, 4 # Restrict to only 3 chars and 1 for null terminator
	syscall
	
	# Print the statement to show results
	li $v0, 4
	la $a0, result
	syscall
	
	la $t0, buffer # Load the base address
	
	# Print the chars in reverse order
	# Print the third byte
	li $v0, 11
	lb $a0, 2($t0) # Load the third character (offset = 2 bytes)
	syscall
	
	# Print the second byte
	lb $a0, 1($t0) # Load the third character (offset = 2 bytes)
	syscall
	
	# Print the first byte
	lb $a0, ($t0) # Load the third character (offset = 2 bytes)
	syscall
	
	
	


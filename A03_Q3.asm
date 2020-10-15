.data
str:		.asciiz 	"\nEnter a 3-digit hex number (all digits must be from A to F): "
buffer:		.space		4 # 3 bytes 3 chars and 1 for null terminator
result:		.asciiz		"\nThe decimal quivalent: "


.globl main
.text

# A = 10, B = 11, C = 12, D = 13, E = 14, F = 15
# Assuming we use unsigned numbers
main:
	# Print out the statement to prompt user to enter 3 digit hex number
	li $v0, 4
	la $a0, str
	syscall
	
	
	# Read the sequence of 3 chars
	li $v0, 8
	la $a0, buffer # Save to buffer
	addi $a1, $0, 4 # Restriction on the length of chars to be 3 and 1 for null terminator
	syscall
	
	# Print out the result statement
	li $v0, 4
	la $a0, result # Take the string from the memory address at result
	syscall
	
	# Load the base address of the sequence of chars
	la $t0, buffer
	
	# load the first byte (1st char)
	lb $t1, ($t0)
	addi $t1, $t1, -0x37 # ASCII Hexadecimal to decimal, substract 0x37
	sll $t1, $t1, 8 # The most sig fig has a weight of 16^2 = 2^8
	add $a0, $0, $t1 # Save the result to s0
	
	# Load the secondy byte (2nd char)
	lb $t1, 1($t0)
	addi $t1, $t1, -0x37 # ASCII Hexadecimal to decimal, substract 0x37
	sll $t1, $t1, 4 # This has a weight of 16 = 2^4
	add $a0, $a0, $t1 # Add the s0
	
	
	# Load the third byte (3rd char)
	lb $t1, 2($t0)
	addi $t1, $t1, -0x37 # ASCII Hexadecimal to decimal, substract 0x37
	add $a0, $a0, $t1  # Add the s0

	# Print out the equivalent decimal value
	li $v0, 1
	syscall

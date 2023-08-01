.global _start
_start:
	
	    .section .text
    .global main

main:
    @ Store the two numbers in R0 and R1
    mov r0, #30     @ Replace with the first number
    mov r1, #20     @ Replace with the second number

    @ Store decimal 15 in register R5
    mov r5, #15

    @ Compare R0 and R1
    cmp r0, r1
    bgt greater      @ Branch if R0 > R1
    blt less         @ Branch if R0 < R1
    b equal          @ Branch if R0 == R1

greater:
    @ If R0 > R1, perform two logical left shifts on register R5
    lsl r5, r5, #2
    b terminate      @ Terminate the program

less:
    @ If R0 < R1, perform one logical right shift on register R5
    lsr r5, r5, #1
    b terminate      @ Terminate the program

equal:
    @ If R0 == R1, perform one right rotation on register R5
    ror r5, r5, #1
    b terminate      @ Terminate the program

terminate:
    @ Terminate the program
    mov r0, #0       @ Set the exit code to 0
    mov r7, #1       @ Use syscall 1 (exit)
    swi 0            @ Perform the syscall

    .section .data
    @ Add data section here if needed

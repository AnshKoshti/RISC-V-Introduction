# Introduction to RISC-V

# Data section.

.data
prompt: .string "Hey, what's your name?\n"
response: .string "\nIt's good to meet you, "
name: .string "                            "

# Code Section.
.text

main:
    # Init.
    la t0, name # t0 points to the name string.

    # print_string(prompt) - ENV call 4.
    la a1, prompt
    li a0, 4
    ecall

    # Call read_str subroutine.
    jal read_str

    # print_string(response) - ENV call 4.
    la a1, response
    li a0, 4
    ecall

    # print_string(name) - ENV call 4.
    la a1, name
    li a0, 4
    ecall

    # print_char(a0) - ENV call 11.
    li a1, '!'
    li a0, 11
    ecall

    li a1, '\n'
    ecall
    ecall

    # Exit - ENV call 10.
    li a0, 10
    ecall

# read_str subroutine.

read_str:
    # Init.
    li a5, 1

    # Enable console input - ENV call 0x130.
    li a0, 0x130
    ecall

read_char:
    # Read a character from console input - ENV call 0x131.
    li a0, 0x131
    ecall

    # Read the result of the env call in a0.
    beq a0, a5, read_char
    beq a0, zero, finish

    # Handle incoming char.
    sb a1, 0(t0)
    addi t0, t0, 1

    # Interate to get next char.
    j read_char

finish:
    # Subroutine epilogue.
    sb zero, 0(t0)
    jr ra   # jump to ra

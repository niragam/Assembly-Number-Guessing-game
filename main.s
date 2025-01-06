.extern printf, scanf, srand, rand

.section .note.GNU-stack,"",@progbits

.section .data
user_guess:
    .int 0
N:
    .int 10  # limit of random number
M:
    .int 5   # maximum number of guesses
random_number:
    .int 0

.section .rodata
request_seed:
    .string "Enter configuration seed: "
request_num:
    .string "What is your guess? "
incorrect:
    .string "Incorrect.\n"
correct:
    .string "Congratz! You won!\n"
game_over:
    .string "Game over, you lost :(. The Correct answer was %d\n"
scanf_format:
    .string "%d"

.section .text
.globl main
.type main, @function
main:
    # Set up the stack
    pushq %rbp
    movq %rsp, %rbp

    # Print the request for the seed
    movq $request_seed, %rdi
    xor %rax, %rax
    call printf

    # Get the input for the seed
    mov $scanf_format, %rdi
    mov $random_number, %rsi
    xor %rax, %rax
    call scanf

    # Get random number from seed
    mov random_number(%rip), %rdi
    call srand 
    call rand # Get the random number

    # Do modulo N to the random number to get a number between 0 and N-1
    movl N(%rip), %edi # store the divider in %edi
    cmp $0, %edi # compare the N to 0 to ensure we dont divide by 0
    je end # if N is 0, end the program
    xor %rdx, %rdx
    div %rdi # divide the random number that is store in %rax by %rdi - our divider
    movq %rdx, random_number(%rip) # store the remainder in random_number

loop:
    # Check if M is 0 meaning the number of guesses left is 0, if it is game over
    cmpl $0, M(%rip)
    je print_game_over

    # Decrement M
    movl M(%rip), %edi
    dec %edi
    mov %edi, M(%rip)
    
    # Print the guess request
    movq $request_num, %rdi
    xor %rax, %rax
    call printf

    # Get the input for the guess
    mov $scanf_format, %rdi
    mov $user_guess, %rsi
    xor %rax, %rax
    call scanf

    # Move the input from the user to user_guess
    movq %rsi, user_guess(%rip)
    
    # Compare the guess to the random number
    movq user_guess(%rip), %rdi 
    cmpq random_number(%rip), %rdi
    je print_correct
    jmp print_incorrect

print_correct:
    movq $correct, %rdi
    xor %rax, %rax
    call printf
    jmp end

print_incorrect:
    movq $incorrect, %rdi
    xor %rax, %rax
    call printf
    jmp loop

print_game_over:
    movq $game_over, %rdi
    movl random_number(%rip), %esi
    xor %rax, %rax
    call printf
    jmp end

end:
    xor %rax, %rax
    popq %rbp
    ret

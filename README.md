# Number Guessing Game (Assembly)

This project is a simple number guessing game implemented in x86-64 assembly. The game prompts the user to input a seed for generating a random number and allows up to 5 guesses to correctly identify the random number between 0 and 10. The program terminates either when the user guesses the number correctly or runs out of attempts.

## Features
- Requests a seed value for random number generation.
- Generates a random number between 0 and 10.
- Allows up to 5 guesses.
- Displays appropriate messages for correct guesses, incorrect guesses, and game over.

## Requirements
- GCC compiler (for assembling and linking the program)

## How to Build and Run
1. Assemble and link the program using GCC:
   ```bash
   gcc main.s -no-pie -o number_guess
   ```
2. Run the program:
   ```bash
   ./number_guess
   ```

## Example Run
Below are example runs of the program:

### Example Run 1: Correct Guess
1. The program prompts the user to enter a configuration seed:
   ```
   Enter configuration seed: 42
   ```
2. The program prompts for a guess:
   ```
   What is your guess? 7
   Incorrect.
   ```

3. The user guesses correctly:
   ```
   What is your guess? 4
   Congratz! You won!
   ```

### Example Run 2: Game Over
1. The program prompts the user to enter a configuration seed:
   ```
   Enter configuration seed: 123
   ```
2. The user makes 5 incorrect guesses:
   ```
   What is your guess? 2
   Incorrect.
   What is your guess? 5
   Incorrect.
   What is your guess? 1
   Incorrect.
   What is your guess? 8
   Incorrect.
   What is your guess? 9
   Game over, you lost :(. The Correct answer was 6.
   ```
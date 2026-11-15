
#!/bin/bash

# Function to count files
function count_files() {
    find . -maxdepth 1 -type f | wc -l
}

correct_number=$(count_files)

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

guess=0

while [[ $guess -ne $correct_number ]]
do
    read -p "Enter your guess: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        guess=0
    elif [[ $guess -lt $correct_number ]]; then
        echo "Your guess is too low. Try again!"
    elif [[ $guess -gt $correct_number ]]; then
        echo "Your guess is too high. Try again!"
    fi
done

echo "Congratulations! You guessed correctly!"
echo "The number of files is $correct_number."

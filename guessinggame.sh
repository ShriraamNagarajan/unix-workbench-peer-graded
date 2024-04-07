
function get_guess {
    echo "Enter your guess: " >&2  # Directing this to stderr
    read response
    echo $response  # This echoes the user input back to where the function was called.
}

num_of_files=$(ls | wc -l)
user_response=$(get_guess)  

# Validate input
while [[ ! "$user_response" =~ ^[0-9]+$ ]] || [[ "$user_response" -ne $num_of_files ]]
do
    if [[ ! "$user_response" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
    elif [[ $user_response -gt $num_of_files ]]; then
        echo "Too high."
    else
        echo "Too low."
    fi
    user_response=$(get_guess)  
done

echo "Congratulations! You have guessed it right."


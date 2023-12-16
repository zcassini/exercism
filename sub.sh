#!/bin/bash

# Save the current directory
CURRENT_DIR=$(pwd)

# Function to submit exercise
submit_exercise() {
    # Change to the kata directory
    cd "$CURRENT_DIR/$1" || exit

    # Submit the exercise
    nix-shell -p exercism --run "exercism submit"

    # Return to the original directory
    cd "$CURRENT_DIR" || exit
}

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 path/to/kata"
    exit 1
fi

# Call the function with the kata path
submit_exercise "$1"


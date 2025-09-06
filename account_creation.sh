#!/bin/bash

# Check if script is called with -c or --create option
if [[ "$1" == "-c" || "$1" == "--create" ]]; then
    # Prompt for the new username
    read -p "Enter new username: " username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "Error: The username '$username' already exists."
        exit 1
    fi

    # Prompt for the password
    read -sp "Enter new password: " password
    echo

    # Create the user account and set the password
    sudo useradd -m "$username"
    echo "$username:$password" | sudo chpasswd

    # Confirmation message
    echo "Account for '$username' created successfully."
else
    echo "Usage: $0 -c or --create"
    exit 1
fi


#!/bin/bash

# Function to create a new user account
create_user() {
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
}

# Function to delete an existing user account
delete_user() {
    # Prompt for the username to delete
    read -p "Enter username to delete: " username

    # Check if the username exists
    if ! id "$username" &>/dev/null; then
        echo "Error: The username '$username' does not exist."
        exit 1
    fi

    # Delete the user account
    sudo userdel -r "$username"

    # Confirmation message
    echo "Account for '$username' deleted successfully."
}

# Main script logic for create or delete
if [[ "$1" == "-c" || "$1" == "--create" ]]; then
    create_user
elif [[ "$1" == "-d" || "$1" == "--delete" ]]; then
    delete_user
else
    echo "Usage: $0 -c or --create for creating a user, -d or --delete for deleting a user"
    exit 1
fi


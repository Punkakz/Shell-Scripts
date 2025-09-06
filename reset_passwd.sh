#!/bin/bash

reset_password() {

    read -p "Enter username to reset the password: " username

    if ! id "$username" &>/dev/null; then
        echo "Error: The username '$username' does not exist."
        exit 1
    fi

    read -sp "Enter new password for '$username': " new_password
    echo

    echo "$username:$new_password" | sudo chpasswd

    echo "Password for '$username' has been successfully reset."
}

if [[ "$1" == "-r" || "$1" == "--reset" ]]; then
    reset_password
else
    echo "Usage: $0 -r or --reset for resetting a password"
    exit 1
fi

#!/bin/bash
# Function to list all user accounts and their UID

list_users() {
    echo "Listing all user accounts and their UIDs:"
    # List all users from /etc/passwd
    # Format: username: UID
    cut -d: -f1,3 /etc/passwd
}

# Main logic to handle options
if [[ "$1" == "-l" || "$1" == "--list" ]]; then
    list_users
else
    echo "Usage: $0 -l or --list for listing user accounts"
    exit 1
fi

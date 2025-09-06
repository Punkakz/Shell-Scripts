#!/bin/bash

# Function to display help and usage information
show_help() {
    echo "Usage: $0 [OPTION]"
    echo
    echo "Options:"
    echo "  -h, --help     Display this help message"
    echo
    echo "Example usage:"
    echo "  $0 --reset     # Reset a user's password"
    echo "  $0 --list      # List all users and their UIDs"
    echo "  $0 --help      # Display help information"
}

# Main logic to handle options
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
else
    echo "Invalid option. Use -h or --help for usage information."
    exit 1
fi


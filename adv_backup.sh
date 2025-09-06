#!/bin/bash

# Check if the user has provided a directory path
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Directory to back up, for example our soucer is /home/devops_user/devops_workspace/script
SOURCE_DIR="$1"

# Check if the provided path is a valid directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: '$SOURCE_DIR' is not a valid directory."
    exit 1
fi

# Backup destination directory (where backups will be stored)
BACKUP_DIR="$HOME/backup"

# Get current timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create a backup folder with the timestamp
BACKUP_FOLDER="$BACKUP_DIR/backup_$TIMESTAMP"
mkdir "$BACKUP_FOLDER"

# Copy the files from the source directory to the backup folder
cp -r "$SOURCE_DIR"/* "$BACKUP_FOLDER"

# Rotate backups: Keep only the last 3 backups
# Find all backup directories, sort them by creation time (oldest first), and delete the oldest ones
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR" | grep "backup_" | wc -l)

if [ "$BACKUP_COUNT" -gt 3 ]; then
    # Get the list of backup directories, sorted by creation time
    OLDEST_BACKUPS=$(ls -1t "$BACKUP_DIR" | grep "backup_" | tail -n +4)

    # Remove the oldest backups
    for BACKUP in $OLDEST_BACKUPS; do
        rm -rf "$BACKUP_DIR/$BACKUP"
    done
fi

echo "Backup completed successfully! Backup folder: $BACKUP_FOLDER"

#!/bin/bash

<<help

This shell script will take periodic backups

eg. 
./backup.sh <source> <destination>
help

src=$1
dest=$2

timestamp=$(date '+%Y-%m-%d-%H-%M')

tar -czvf "$dest/backup-$timestamp.tar.gz" $src

echo -e "\033[0;32mBackup is Completed\033[0m"

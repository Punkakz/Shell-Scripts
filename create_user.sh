#!/bin/bash

<<help

this is a shell script
to create users

help


echo "=====================creation of user started================="

#read -p "enter the username" username

echo "your username is"$1
echo "your password is"$2

#read -p "enter the password" password

sudo useradd -m "$1"

echo -e "$2\n$2" | sudo passwd "$1"

echo "===============creation of user completed==============" 

sudo userdel $1

echo "==================User deleted==================="

cat /etc/passwd | grep $1 | wc

echo "as wc is 0 the user is deleted"

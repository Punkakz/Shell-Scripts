#!/bin/bash

<<help

This shell script check if user exists

help

read -p "Enter the username you wish to check" username

count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

echo "$count"

if [ $count == 0 ];
then
	echo "User does not exist"
else
	echo "User exist"
fi	

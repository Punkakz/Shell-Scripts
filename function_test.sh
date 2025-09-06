#!/bin/bash

<<help

This is an explanation of function

help

function create_user {

read -p "Enter the username=" username
sudo useradd -m $username

echo "user created successfully" 

}

for ((i=1 ; i<=5 ; i++ )) 
	do 
		create_user
	done

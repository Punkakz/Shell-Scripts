#!/bin/bash


<<help

this is script will install the package that you will put in the arguments.

help

echo "Installing $1"

sudo apt-get update > /dev/null
sudo apt-get install $1 -y > /dev/null

echo "Installation completed" 

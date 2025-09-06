#!/bin/bash

hero="rancho"
villian="virus"

echo "3 idiots ka hero hai $hero"

echo "3 idiots ka villian hai $villian"


# Shell / environment variable are there!

echo "current logged in user is $USER"

# user input
read -p "Rancho ka pura naam kya tha" fullname

echo "pura naam hai $fullname"

# arguments

echo "movie name is $0"

echo "first idiot $1"

echo "second idiot $2"

echo "third idiot $3"

echo "all 3 idiots are $@"

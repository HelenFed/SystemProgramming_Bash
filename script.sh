#!/bin/bash

#Checking if there are two parameters
if [ "$#" -ne 2 ]; then
	echo "Two parameters needed."
	exit 1
fi

#Checking if the parameters are numbers (either positive, negative or fractional)
if ! [[ "$1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
	echo "Both parameters have to be numbers."
	exit 1
fi

#Reading parameters
num1=$1
num2=$2

#Name of the script and path that conatains system aliases
script_name=$(basename "$0")
config_file="$HOME/.bashrc"

#Checking the conditions, printing info and executing needed commands
if (( $(echo "$num1 > $num2" | bc -l) )); then
	echo "First number is greater than the second. $num1 > $num2"
	echo "List of alias of my system: "
	grep -E '^\s*alias ' "$config_file" | awk '{gsub(/^[ \t]+|[ \t]+$/, ""); print}'
	
else
	echo "First number is not greater than the second one. $num1 !> $num2"
	echo "Size of $script_name file: $(du -h "$script_name" | cut -f1)"
fi


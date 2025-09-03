#!/bin/bash

#variable initialization
sChars='' #variable containing special characters
numOfChars=0 #number of characters for each type of password
if [ $# -eq 1 ] #accepts only one argument
then
	case "$1" in #accepts the first argument given by the user
	Easy*|easy*|EASY*) #different kinds of arguments have been made acceptable making it easier for the user
		#changes the number of characters to 8(no need to change the value of 'sChars' since its needed value for this specific use has already been initialized)
		numOfChars=8
		#informs the user via appropriate message
		echo "Creating a random 'easy' password that consists of $numOfChars letters of the English alphabet and/or numbers 0-9:"
		;;
	Medium*|medium*|MEDIUM*) #different kinds of arguments have been made acceptable making it easier for the user
		sChars='.!#' #adds the needed special characters intended for the 'medium' password
		numOfChars=12 #changes the number of characters to 12
		#informs the user via appropriate message
		echo "Creating a random 'medium' password that consists of $numOfChars letters of the English alphabet and/or numbers 0-9 and/or the characters $sChars:"
		;;
	Hard*|hard*|HARD*) #different kinds of arguments have been made acceptable making it easier for the user
		sChars='.!#@,?^$' #adds the needed special characters intended for the 'hard' password
		numOfChars=20 #changes the number of characters to 20
		#informs the user via appropriate message
		echo "Creating a random 'hard' password that consists of $numOfChars letters of the English alphabet and/or numbers 0-9 and/or the characters $sChars:"
		;;
	*)
		#informs the user via appropriate message and exits
		echo -n "Invalid input! Exiting..."
		;;
	esac
	#prints a random '$numOfChars'-character password and then a newline
	tr -dc [:alnum:]$sChars < /dev/urandom | head -c $numOfChars; echo
else
	echo "Please give only one argument as input. Exiting..."
fi

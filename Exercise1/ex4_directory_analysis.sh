#!/bin/bash

if [ $# -eq 1 ] #case where only one argument was given
then
    if [ -d "$1" ]
    then #case where the argument provided is a directory
        echo "\"$1\" is a directory." #prints appropriate message
        #smoothen the appearance
        echo "--------------------------------------------------------------------------------------------------------"
        echo "The 5 largest files(starting from the largest) in \"$1\" are:" #prints appropriate message
        #finds the files in the directory, checks their individual disk-usage and prints the 5 largest ones' name and size
        find "$1" -type f -exec du -h {} \; | sort -rh | head -n 5 | awk '{print $2 " with a size of " $1}'
        #smoothen the appearance
        echo "--------------------------------------------------------------------------------------------------------"
        touch "counter.txt" #creates a file to contain the number of files with more than one hard links
        #finds the number of files with more than one hard links and places it into "counter.txt"
        find "$1" -type f -links +1 | grep -c '/' > counter.txt
        if [ $(cat counter.txt) -gt 0 ]
        then #case where the number of files with more than one hard links exceeds zero
            echo "There exist files with more than one hard links in \"$1\"" #prints appropriate message
        else #case where the number of files with more than one hard links does not exceed zero
            echo "There exist no files with more than one hard links in \"$1\"" #prints appropriate message
        fi
        #smoothen the appearance
        echo "--------------------------------------------------------------------------------------------------------"
        if find "$1" -type f -exec ls -o {} \; | grep -s '^--' | grep -q '/';
        then #case where the number of files without read permission exceeds zero
            echo "There exist files without read permission in: \"$1\"" #prints appropriate message
        else #case where the number of files without read permission does not exceed zero
            echo "There exist no files without read permission in: \"$1\"" #prints appropriate message
        fi
    else #case where the argument provided is not a directory
        echo "\"$1\" is not a directory. Exiting..." #informs the user their input is invalid and exits
    fi
else #case where the number of arguments given does not equal 1
    #informs the user the number of directories they entered is invalid and exits
    echo "Please give just one directory as argument. Exiting..."
fi

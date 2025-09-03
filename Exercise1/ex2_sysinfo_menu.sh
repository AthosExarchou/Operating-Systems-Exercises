#!/bin/bash

#prompt statement to be printed after each iteration
PS3="Choose an option from 1 to 6 inclusively: "

#I use "select" as instructed for the convenience of the user
select option in Hostname Kernel CPU Memory Disk-Usage Exit

do #start of iteration
    case "$option" in #takes the user's choice as input
    #different inputs have been made acceptable to aid the user, in the case that an implementation without the use of "select" is ever needed
    hostname*|Hostname*|HOSTNAME*)
    #informs the user via appropriate message and prints the hostname
        echo -n "System Information for: "; uname -n
        ;;
    kernel*|Kernel*|KERNEL*)
    #informs the user via appropriate message and prints the kernel version
        echo -n "Kernel Version: "; uname -r
        ;;
    cpu*|Cpu*|CPu*|CpU*|CPU*|cPu*|cpU*|cPU*)
        #used "sed" to print "CPU" instead of "Model name:" and "awk" for a smooth appearance
        lscpu | sed -n 's/Model name:/CPU:/p' | awk '{$1=$1}1'
        ;;
    memory*|Memory*|MEMORY*)
        #used "sed" to print the appropriate message for each circumstance instead of "Mem:" and "awk" for 'stdout' and a smooth appearance
        free -h | sed -n 's/Mem:/Memory: Total:/p'| awk '{$1=$1}1' | awk '{printf $1 " " $2 " " $3 " "}'
        free -h | sed -n 's/Mem:/Used:/p'| awk '{$1=$1}1' | awk '{printf $1 " " $3 " "}'
        free -h | sed -n 's/Mem:/Free:/p'| awk '{$1=$1}1' | awk '{print $1 " " $4}'
        ;;
    disk-usage*|diskusage*|Disk-usage*|Diskusage*|Disk-Usage*|DiskUsage*|DISK-USAGE*|DISKUSAGE*)
        #used "sed" to print the appropriate message for each circumstance instead of "total" and "awk" for 'stdout' and a smooth appearance
        df -h --total | sed -n 's/total/Disk Usage: Total:/p' | awk '{$1=$1}1' | awk '{printf $1 " " $2 " " $3 " " $4 " "}'
        df -h --total | sed -n 's/total/Used:/p'| awk '{$1=$1}1' | awk '{printf $1 " " $3 " "}'
        df -h --total | sed -n 's/total/Free:/p'| awk '{$1=$1}1' | awk '{print $1 " " $4}'
        ;;
    exit*|Exit*|EXIT*)
        echo "Exiting..." #informs the user via appropriate message
        break #exits
        ;;
    *) #case where the input is invalid
        #urges the user to retry via appropriate message
        echo "Invalid input! Try again."
        ;;
    esac
done #end of iteration

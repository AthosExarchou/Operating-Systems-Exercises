#!/bin/bash

#"awk" takes as 'stdin' the contents of "syslog", but before it prints anything,
#that which would have been printed is then given as input to "uniq -c" with the use of a 'pipe'
#and is instead printed as the number of times it would have appeared together with the fitting month and date
awk '{print $1 " " $2}' < syslog | uniq -c

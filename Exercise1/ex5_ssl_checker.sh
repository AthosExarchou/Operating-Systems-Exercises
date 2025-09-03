#!/bin/bash

## could have put the site's link inside a variable
## I see however no need for that in the current instance of the exercise

#expiration date variable displays diagnostic information about the SSL connection to the server,
#extracts the expiry date and prints out its value (errors are placed in /dev/null, so they essentially vanish)
exp=$(echo | openssl s_client -connect "www.hua.gr":443 2> /dev/null | openssl x509 -noout -enddate | awk -F= '{print $2}')

#takes the expiry date and converts it to type-integer
expiry=$(date -d "$exp" +%s)
#takes the current date and converts it to type-integer
cur_date=$(date +%s)

echo "Certificate expiration date: $exp" #prints the expiration date
echo -n "Current date: "; date #prints the current date

#compares the ssl cerificate expiration date with the current date and prints the appropriate message
if [ "$expiry" -lt "$cur_date" ];
then #case where the ssl certificate has not expired
    echo "The certificate has expired."
else #case where the ssl certificate has expired
    echo "The certificate has yet to expire."
fi

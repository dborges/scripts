#!/bin/bash

function validate() {
 okay=0
 if ! [[ "$inpt" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] ; then
   echo 0;
 else
   octs=(${inpt//./ })
   for (( i=0; i<=3; i++ )) ; do
     chck=$((octs[$i]+0))
     if [ "$chck" != "" ] ; then
       if [[ "$chck" =~ ^[0-9]+$ ]] ; then
         if [ "$chck" -lt 256 -a "$chck" -ge 0 ] ; then
           okay=$((okay+1));
         fi
       fi
     fi
   done
   if [ "$okay" -eq 4 ] ; then
     echo 1;
   else
     echo 0;
   fi
 fi
}

inpt=''
echo "type 'stop' to exit:"
while [ "$inpt" != "stop" ] ; do
 read -p "Address to validate: " inpt
 stat=$(validate)
 stat=$((stat+0))
 if [ "$stat" -eq 1 ] ; then
   echo "Valid IP Address"
 else
   echo "Invalid IP Address Syntax"
 fi
done

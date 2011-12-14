#!/bin/bash

#author David Borges
#version 1.0

#This file will create a proper csv with some user input

DNU=0,do-not-use,1.1.1.1,,255.0.0.0,1.1.1.2,1.1.1.0,255.0.0.0,
route=eth0
encoders=0

if [ -e "test.csv" ];
then 
rm test.csv
fi

echo "CSV Creator version 1.0"
echo "Default values appear in parentheses"
echo
echo "What would you like to name the file? (test.csv):"
read filename
filename=${filename:="test.csv"}



while [ $encoders -lt 1 ]
do
echo "How many encoders will you be configuring?"
read enc
encoders=$((enc+0))
done

echo "What encoder number do you wish to start with? (1):"
read x
x=${x:=1}

echo "HD or SD (SD):"
read def
def=${def:="sd"}

echo "Starting IP Address of CDN Network (192.168.1.10):"
read eth0
eth0=${eth0:="192.168.1.10"}

echo "Netmask CDN (255.255.255.0):"
read netmasketh0
netmasketh0=${netmasketh0:="255.255.255.0"}

echo "Starting IP Address of Management Network (192.168.2.10):"
read eth1
eth1=${eth1:="192.168.2.10"}

echo "Gateway of Management Network (192.168.2.1):"
read gateway
gateway=${gateway:="192.168.2.1"}

echo "Netmask Management (255.255.255.0):"
read netmasketh1
netmasketh1=${netmasketh1:="255.255.255.0"}

echo "$DNU" >> $filename

	arry=(${eth0//./ })
	arry2=(${eth1//./ })
	
	frnt="${arry[0]}.${arry[1]}.${arry[2]}."
	frnt2="${arry2[0]}.${arry2[1]}.${arry2[2]}."
	
	back=$((arry[3]+0))
	back=$((arry2[3]+0))
	
	untl=$((back+$encoders))

#	xxxx=$((back-1))

	for (( x=$back; x<$untl; x++ ))
	do
	 # Increment
	 back=$((back+1))
	 # Output
		for (( c=$start; c<$until; c++ ))
	 echo "$c,skitter-$def,$c,${frnt}${back},,$netmasketh0,${frnt2}${back},$gateway,$netmasketh1,$route" >> $filename
		c++
	done





cat $filename
rm test.csv
exit 0

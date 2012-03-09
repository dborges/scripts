#!/bin/bash

network=10.0.144.
file=/etc/network/interfaces
echo "What is the last octet of the IP address of the encoder?"
read encoder
encoder=$encoder

echo "Connecting to $network$encoder.."
echo "Remounting as Read-Writeable Filesystem"
ssh -t root@$network$encoder 'mount -o remount,rw /'
echo "Removing DNS from encoders"
ssh -t root@$network$encoder 'echo "" > /etc/resolv.conf'
sleep 10
ssh -t root@$network$encoder 'mount -o remount,rw /'
ssh -t root@$network$encoder 'cat /etc/resolv.conf'
echo "Complete"
exit 0


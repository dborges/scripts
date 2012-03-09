#!/bin/bash

network=10.0.144.
file=/etc/network/interfaces
echo "What is the last octet of the IP address of the encoder?"
read encoder
encoder=$encoder

echo "Connecting to $network$encoder.."
echo "Remouting as Read-Writeable Filesystem"
ssh -t root@$network$encoder 'mount -o remount,rw /'
echo "Editing interfaces file"
ssh -t root@$network$encoder 'vim /etc/network/interfaces'
echo "Applying new IP changes"
ssh -t root@$network$encoder '/etc/init.d/networking restart'
sleep 10
echo "Remounting as a Read-Only Filesystem"
ssh -t root@$network$encoder 'mount -o remount,ro /'
echo "Adding Multicast Route"
ssh -t root@$network$encoder 'route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0'
#ssh -t root@$network$encoder '/mnt/usr/init.d/autoconfigd stop'
#ssh -t root@$network$encoder '/mnt/usr/init.d/SkitterEncoder stop 1 '
#ssh -t root@$network$encoder '/mnt/usr/init.d/autoconfigd start'
#ssh -t root@$network$encoder '/mnt/usr/init.d/SkitterEncoder start 1 '
ssh -t root@$network$encoder 'ps aux | grep Skitter'
ssh -t root@$network$encoder 'route'

echo "Complete"
exit 0


#!/bin/bash

#Author David P. Borges Jr.

HDPATH=/home/dborges/libhdhomerun/hdhomerun_config
SCANPATH=/home/dborges/libhdhomerun/scan/

echo ""

$HDPATH discover

echo "HD Homerun Channel Scanning"
echo "---------------------------"
echo ""
echo "Please type in the ID or IP Address of the HD Homerun"
read ip
ip=$ip

echo ""
echo "Please type in tuner 1 or 2"
read tuner
tuner=$tuner

echo""
echo "Scanning HD Homerun @ $ip on Tuner $tuner"

$HDPATH $ip scan /tuner$tuner > $SCANPATH$ip.scan
echo ""
echo "Scanning Complete!!"
echo ""
echo "Here are all the channels available from this tuner"
echo ""
cat $SCANPATH$ip.scan | grep 8vsb -A4 | grep -v SCANNING









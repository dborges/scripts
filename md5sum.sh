#!/bin/bash

xHASH="0dd71872c3296f537a48cfb8b988734d"

xCURRENT=$(ssh -t 10.1.1.250 "md5sum /home/mark/EncoderInstaller/EmergencyInstaller.ver01.54.05.mar9_2012.intel.7z | awk '{print \$1}'")
xCURRENT=${xCURRENT:0:32}
#echo "|$xHASH|"
#echo "|$xCURRENT|"

if [ "$xHASH" == "$xCURRENT" ]; then
	echo "File has completed downloading"
else 
	echo "File has not yet finished"
#	echo "$xCURRENT"
fi

exit 0





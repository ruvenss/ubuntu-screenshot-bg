#!/bin/bash
uploadserver=https://YOUR_SERVER/
user=1
key=YOUR_KEY
pngfile=$(date +"%Y-%m-%d-%H-%M").png
webfile=$(date +"%Y-%m-%d-%H-%M").webp
curlfile='files[]=@.screenshots-bg/'
curlf="curl -F '${curlfile}${webfile}' -F 'key=${key}' ${uploadserver}"
mkdir -p ~/.screenshots-bg
scrot -z -u '%Y-%m-%d-%H-%M.png' -d1 -e 'mv $f ~/.screenshots-bg/'
convert ~/.screenshots-bg/$pngfile -quality 30% ~/.screenshots-bg/$webfile
rm ~/.screenshots-bg/$pngfile
eval $curlf

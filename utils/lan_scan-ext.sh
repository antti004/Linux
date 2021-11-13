#!/bin/sh

#nmap -sn $1/24 | awk '/Nmap scan/{gsub(/[()]/,"",$NF); print $NF > "ips.txt"}'
EXT_FILE=ips.ext.txt
touch $EXT_FILE

while IFS= read -r line
do
   echo $line >> $EXT_FILE
   nmap -sT -O $line >> $EXT_FILE
done < "ips.txt"

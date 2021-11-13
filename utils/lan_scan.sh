#!/bin/sh

nmap -sn $1/24 | awk '/Nmap scan/{gsub(/[()]/,"",$NF); print $NF > "ips.txt"}'

#!/bin/sh
BOTID="301857222:AAGM2t25iCqIUYAVQT6yHdp8cR0wVJkMlHY"
CHATID="148204072"
name=$(hostname)

# If errors then clean 
#tr -d "\r" < telegram_ip.sh > cleaned.sh
#


for ipaddr in $(ip -br -4 -c=never addr list | grep UP | awk '{print $3}'| cut -d/ -f1)
do
  echo $ipaddr
  URL="https://api.telegram.org/bot$BOTID/sendMessage"
  path="chat_id=$CHATID&text=host=$name&$ipaddr"
  data="chat_id=$CHATID&text=$name"
  echo $data
  curl -G -XGET $URL  --data-urlencode "chat_id=$CHATID" --data-urlencode "text=$name $ipaddr"
done

import logging
import requests
import urllib.parse

TOKEN='301857222:AAGM2t25iCqIUYAVQT6yHdp8cR0wVJkMlHY' #aa_devices_bot
#TOKEN='358875431:AAF_Xf2nHovO1iQ42lyczc5eN2egCpRh8XU' #aa_project_emu_bot
URL = f"https://api.telegram.org/bot{TOKEN}"

UPDATE_ID=10733332
CHAT_ID=148204072

#logging.basicConfig(level=logging.DEBUG,format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')


def send_msg(msg,msg_id):
    query = urllib.parse.quote(msg)
    tarUrl =URL+ f'/sendMessage?chat_id={CHAT_ID}&text={msg}&reply_to_message_id={msg_id}'    
#    resp = requests.get(tarUrl)
#    print(resp)


def get_latest():
    tarUrl = f'{URL}/getUpdates'
    jsn = requests.get(tarUrl).json()
    results = jsn['result'] 
    ar = results[len(results) - 1]
    print(ar['message']['text'])

def get_updates():
    tarUrl = f'{URL}/getUpdates'
    jsn = requests.get(tarUrl).json()
    for item in jsn['result']:
        date = item['message']['date']
        msg = item['message']['text'] 
        msg_id=item['message']['message_id']
        arMsg = msg.split(' ')
        print("ID = "+str(msg_id))
        if arMsg[1] == 'aa':
            print("Executing command")
            send_msg("Received",msg_id)
        print(f"{date} {msg}")

if __name__ == '__main__':
   #get_updates()
   get_latest()
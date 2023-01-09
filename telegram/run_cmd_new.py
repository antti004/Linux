import logging
import requests
import socket
import urllib.parse
import subprocess
import os

VERSION="1.0"

TOKEN='301857222:AAGM2t25iCqIUYAVQT6yHdp8cR0wVJkMlHY' #aa_devices_bot
#TOKEN='358875431:AAF_Xf2nHovO1iQ42lyczc5eN2egCpRh8XU' #aa_project_emu_bot
URL = f"https://api.telegram.org/bot{TOKEN}"

UPDATE_ID=10733332
CHAT_ID=148204072
HOSTNAME = socket.gethostname()


#logging.basicConfig(level=logging.DEBUG,format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')


def send_msg(text,reply_msg_id=0):
    tarUrl =URL+ f'/sendMessage'
    msg_txt = HOSTNAME+ " " +'\U00002b55'+ ' ' +text
    body = {'chat_id':CHAT_ID,'text':msg_txt}
    if reply_msg_id > 0:
        body = {'chat_id':CHAT_ID,'text':HOSTNAME+ " "+text,'reply_to_message_id':msg_id}
    resp = requests.post(tarUrl,json=body)


def send_msg_OLD(msg,msg_id):
    query = urllib.parse.quote(msg)
    tarUrl =URL+ f'/sendMessage?chat_id={CHAT_ID}&text={msg}&reply_to_message_id={msg_id}'    
    resp = requests.get(tarUrl)

def delete_msg(msg_id):
    tarUrl =URL+ f'/deleteMessage?chat_id={CHAT_ID}&message_id={msg_id}'    
    resp = requests.get(tarUrl)
    print("delete_msg",resp)

def edit_msg(msg_id,value):
    prsValue = urllib.parse.quote(value)
    tarUrl =URL+ f'/editMessageText?chat_id={CHAT_ID}&message_id={msg_id}&text={prsValue}'    
    resp = requests.get(tarUrl)


def get_latest():
    tarUrl = f'{URL}/getUpdates?offset=-1'
    jsn = requests.get(tarUrl).json()
    results = jsn['result'] 

    if(len(results)==0):
        return 0

    result = results[0]
    update_id = result['update_id']
    date = result['message']['date']
    msg_txt = result['message']['text'] 
    msg_id = result['message']['message_id']

    print(f'Latest count={len(results)} updateID={update_id}')
    ar_txt = msg_txt.split(' ') # 1. target_host 2. cmd
    if ar_txt[0] != HOSTNAME:
        print("not for this host")
        return 0

    send_msg("processing = "+ar_txt[1])
    delete_msg(msg_id)
    clear_latest(update_id+1)
    run_cmd(ar_txt)

#    print(f'{date} id={msg_id} {msg_txt}')
    return update_id     

def clear_latest(update_id):
    tarUrl = f'{URL}/getUpdates?offset={update_id}'
    jsn = requests.get(tarUrl).json()
    resp = requests.get(tarUrl)
    print(f'** Clear_latest {update_id}')
    print(resp)

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





def run_cmd(ar):
    print(ar)
    if len(ar) < 1:
       send_msg("Invalid command")
       return
    
    cmd = ar[1]
    

    if cmd == 'reboot':
       send_msg("rebooting")
       os.system("reboot &")
    
    if cmd == 'test':
       send_msg("Test executed")
    
    if cmd == 'update':
       send_msg("updateing")
       os.system("apt get update &")

    if cmd == 'upgrade':
       send_msg("upgradeing")
       os.system("apt get dist-upgrade -y &")

    if cmd == 'ver' or cmd == 'version':
       send_msg(f'version={VERSION}')

if __name__ == '__main__':
   #get_updates()
   get_latest()

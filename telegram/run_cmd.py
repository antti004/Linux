import logging
import requests
import socket
import urllib.parse
import subprocess
import os
from urllib.request import urlopen
import psutil
import time

VERSION="1.1"

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

def get_ip():
    result=[l for l in ([ip for ip in socket.gethostbyname_ex(socket.gethostname())[2] 
    if not ip.startswith("127.")][:1], [[(s.connect(('8.8.8.8', 53)), 
    s.getsockname()[0], s.close()) for s in [socket.socket(socket.AF_INET, 
    socket.SOCK_DGRAM)]][0][1]]) if l][0][0]
    return result

def get_ext_ip():
    ext_ip = str(urlopen('https://api64.ipify.org/?format=text').read().decode())
    return ext_ip

def get_uptime():
    tm = int(time.time()-psutil.boot_time()) 
    d = int(tm/60/60/24)
    h = int(tm / 60/60%24)
    m = int(tm /60 % 60)
    return f'{d:02}d.{h:02}h{m:02}m'

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
   ip=get_ip()
   wan_ip=get_ext_ip()
   up = get_uptime()
   s = f'ip={ip} wan={wan_ip} "{up}"'
   send_msg(s) 

import logging
import requests
import socket
import urllib.parse
import subprocess
import os
from urllib.request import urlopen

TOKEN='301857222:AAGM2t25iCqIUYAVQT6yHdp8cR0wVJkMlHY' #aa_devices_bot
#TOKEN='358875431:AAF_Xf2nHovO1iQ42lyczc5eN2egCpRh8XU' #aa_project_emu_bot
URL = f"https://api.telegram.org/bot{TOKEN}"

UPDATE_ID=10733332
CHAT_ID=148204072
HOSTNAME = socket.gethostname()


#logging.basicConfig(level=logging.DEBUG,format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

def send_message(text,reply_msg_id=0):
    tarUrl =URL+ f'/sendMessage'
    body = {'chat_id':CHAT_ID,'text':HOSTNAME+ " "+text}
    if reply_msg_id > 0:
        body = {'chat_id':CHAT_ID,'text':HOSTNAME+ " "+text,'reply_to_message_id':msg_id}
    resp = requests.post(tarUrl,json=body)


def delete_msg(msg_id):
    tarUrl =URL+ f'/deleteMessage?chat_id={CHAT_ID}&message_id={msg_id}'    
    resp = requests.get(tarUrl)
    print("delete_msg",resp)


def run_cmd(ar):
    print(ar)
    if ar[1]=='reboot':
       print("Rebooting")
       ret = os.system("reboot &")
       print(ret)
#       subprocess.Popen(["reboot","now"])


def reboot_needed():
    return os.path.exists('/var/run/reboot-required')

def get_ip():
    result=[l for l in ([ip for ip in socket.gethostbyname_ex(socket.gethostname())[2] 
    if not ip.startswith("127.")][:1], [[(s.connect(('8.8.8.8', 53)), 
    s.getsockname()[0], s.close()) for s in [socket.socket(socket.AF_INET, 
    socket.SOCK_DGRAM)]][0][1]]) if l][0][0]
    return result

def get_ext_ip():
    ext_ip = str(urlopen('https://api64.ipify.org/?format=text').read().decode())
    return ext_ip


if __name__ == '__main__':
    ar = []
    ar.append("ip="+get_ip())
    ar.append("ext_ip="+get_ext_ip())

#    ar.append('\U00002757')
    if reboot_needed():
       ar.append('\U0000267B') #recycle

    if len(ar) == 0: 
       exit(0)

    msg = " ".join(ar)
    send_message(msg)
    
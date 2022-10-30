import logging
import requests
import urllib.parse

TOKEN='301857222:AAGM2t25iCqIUYAVQT6yHdp8cR0wVJkMlHY' #aa_devices_bot
#TOKEN='358875431:AAF_Xf2nHovO1iQ42lyczc5eN2egCpRh8XU' #aa_project_emu_bot
URL = f"https://api.telegram.org/bot{TOKEN}"

UPDATE_ID=10733332
CHAT_ID=148204072

#logging.basicConfig(level=logging.DEBUG,format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

def msg_replay_post(text,msg_id):
    tarUrl =URL+ f'/sendMessage'
    body = {'chat_id':CHAT_ID,'text':text,'replay_to_message_id':msg_id}
    resp = requests.post(tarUrl,json=body)
    print(resp)


def send_msg(msg,msg_id):
    query = urllib.parse.quote(msg)
    tarUrl =URL+ f'/sendMessage?chat_id={CHAT_ID}&text={msg}&reply_to_message_id={msg_id}'    
    resp = requests.get(tarUrl)

def delete_msg(msg_id):
    tarUrl =URL+ f'/deleteMessage?chat_id={CHAT_ID}&message_id={msg_id}'    
    resp = requests.get(tarUrl)

def edit_msg(msg_id,value):
    prsValue = urllib.parse.quote(value)
    tarUrl =URL+ f'/editMessageText?chat_id={CHAT_ID}&message_id={msg_id}&text={prsValue}'    
    resp = requests.get(tarUrl)


def get_latest():
    tarUrl = f'{URL}/getUpdates?offset=-1'
    jsn = requests.get(tarUrl).json()
    results = jsn['result'] 
    print("Latest count="+str(len(results)))
    result = results[0]
    date = result['message']['date']
    msg_txt = result['message']['text'] 
    msg_id = result['message']['message_id']
 #   send_msg("Received",msg_id)
#    delete_msg(msg_id)
#    edit_msg(msg_id,"Processing")
    msg_replay_post("done",msg_id)
    print(f'{date} id={msg_id} {msg_txt}')
    print(result)
    return msg_id     

def clear_latest(msg_id):
    tarUrl = f'{URL}/getUpdates?offset=-{msg_id}'
    jsn = requests.get(tarUrl).json()
    resp = requests.get(tarUrl)
    print(f'** Clear_latest')
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

if __name__ == '__main__':
   #get_updates()
   last_msg_id =get_latest()
   clear_latest(last_msg_id)
import logging
import requests
 
TOKEN='301857222:AAGM2t25iCqIUYAVQT6yHdp8cR0wVJkMlHY' #aa_devices_bot
#TOKEN='358875431:AAF_Xf2nHovO1iQ42lyczc5eN2egCpRh8XU' #aa_project_emu_bot
URL = f"https://api.telegram.org/bot{TOKEN}/getUpdates?limit=1"
UPDATE_ID=10733332
CHAT_ID=148204072

#logging.basicConfig(level=logging.DEBUG,format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')



def get_updates():
    jsn = requests.get(URL).json()
    for item in jsn['result']:
        date = item['message']['date']
        msg = item['message']['text'] 
        print(f"{date} {msg}")

if __name__ == '__main__':
   get_updates()
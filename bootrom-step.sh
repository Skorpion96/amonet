#!/bin/bash

set -e
sudo apt install git && git clone https://github.com/bkerler/mtkclient.git && cd mtkclient && sudo apt install pip3 && pip3 install -r requirements.txt && pip3 install .
read -p "Disconnect battery, disconnect the device and reconnect it in brom shorting click in the motherboard using a paperclip. Press [Enter] key to continue..."
#Next command is just to trigger mtkclient which is what matters to us, it won't really unlock seccfg, we need it to bypass watchdog protection
python3 mtk da seccfg unlock
cd modules
read -p "Now Connect battery, disconnect the device and reconnect it in brom shorting click in the motherboard using the paperclip. Press [Enter] key to continue..."
python3 main.py
cd ..

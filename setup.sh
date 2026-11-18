#!/bin/sh

setup-xorg-base

apk add --no-cache icewm alacritty

mkdir -p $HOME/Downloads
wget -P $HOME/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/GoogleSansCode.zip

mkdir -p $HOME/.local/share/fonts
unzip $HOME/Downloads/GoogleSansCode.zip -d $HOME/.local/share/fonts
fc-cache -fv

echo "Welcome to Alabastos!"

touch $HOME/.xinitrc
echo "exec icewm-session" >> $HOME/.xinitrc

startx
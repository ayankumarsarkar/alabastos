#!/bin/sh

apk add setup-xorg-base icewm alacritty

echo "Welcome to Alabastos!"

touch $HOME/.xinitrc
echo "exec icewm-session" >> $HOME/.xinitrc

startx
#!/bin/sh

setup-xorg-base

apk add icewm alacritty

echo "Welcome to Alabastos!"

touch $HOME/.xinitrc
echo "exec icewm-session" >> $HOME/.xinitrc

startx
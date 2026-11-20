#!/bin/sh

setup-xorg-base

apk add --no-cache icewm alacritty firefox xfe xfe-xfi

mkdir -p $HOME/Downloads

# A Mono Face Font
wget -P $HOME/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/GoogleSansCode.zip

# An Eurocentric Font
wget -P $HOME/Downloads https://software.sil.org/downloads/r/gentium/Gentium-7.000.zip

mkdir -p $HOME/.local/share/fonts

unzip $HOME/Downloads/GoogleSansCode.zip -d $HOME/.local/share/fonts/GoogleSansCode
unzip $HOME/Downloads/Gentium-7.000.zip -d $HOME/.local/share/fonts/Gentium

fc-cache -fv

echo "Welcome to Alabastos!"

touch $HOME/.xinitrc
echo "exec icewm-session" >> $HOME/.xinitrc

startx
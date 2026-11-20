#!/bin/sh

setup-xorg-base

apk add --no-cache icewm alacritty firefox xfe xfe-xfi

mkdir -p $HOME/Downloads
mkdir -p $HOME/Pictures

# A Mono Face Font
wget -P $HOME/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/GoogleSansCode.zip

# An Eurocentric Font
wget -P $HOME/Downloads https://software.sil.org/downloads/r/gentium/Gentium-7.000.zip

FONTS="$HOME/.local/share/fonts"
mkdir -p $FONTS

unzip $HOME/Downloads/GoogleSansCode.zip -d $FONTS/GoogleSansCode
unzip $HOME/Downloads/Gentium-7.000.zip -d $FONTS/Gentium

fc-cache -fv
unset FONTS

WALLPAPERS=$HOME/.local/share/wallpapers
mkdir -p $WALLPAPERS

mkdir -p $HOME/.icewm

cp alabastos.png $WALLPAPERS/alabastos.png

touch $HOME/.icewm/prefoverride
cat << EOF > "$HOME/.icewm/prefoverride"
DesktopBackgroundImage="$WALLPAPERS/alabastos.png"
DesktopBackgroundColor="rgb:00/00/00"
DesktopBackgroundScaled=1
DesktopBackgroundCenter=0
EOF

echo "Welcome to Alabastos!"

touch $HOME/.xinitrc
echo "exec icewm-session" >> $HOME/.xinitrc

startx
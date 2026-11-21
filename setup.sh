#!/bin/sh

setup-xorg-base

apk add --no-cache icewm alacritty firefox xfe xfe-xfi flameshot

DOWNLOADS=$HOME/Downloads
mkdir -p $DOWNLOADS
#mkdir -p $HOME/Pictures

# << This script is untested >>
wget -P $DOWNLOADS https://github.com/localsend/localsend/releases/download/v1.18.2/LocalSend-1.18.2-linux-x86-64.tar.gz
tar -xzf $DOWNLOADS/LocalSend-1.18.2-linux-x86-64.tar.gz -C $DOWNLOADS
mkdir -p $HOME/.local/bin
install -m 0755 $DOWNLOADS/LocalSend-1.18.2-linux-x86-64/localsend $HOME/.local/bin/localsend
chmod +x $HOME/.local/bin/localsend
cp -r $DOWNLOADS/LocalSend-1.18.2-linux-x86-64/bin $DOWNLOADS/LocalSend-1.18.2-linux-x86-64/lib $HOME/.local/
# << This script is untested >>

# A Mono Face Font
wget -P $DOWNLOADS https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/GoogleSansCode.zip

# An Eurocentric Font
wget -P $DOWNLOADS https://software.sil.org/downloads/r/gentium/Gentium-7.000.zip

FONTS="$HOME/.local/share/fonts"
mkdir -p $FONTS

unzip $DOWNLOADS/GoogleSansCode.zip -d $FONTS/GoogleSansCode
unzip $DOWNLOADS/Gentium-7.000.zip -d $FONTS/Gentium

fc-cache -fv
unset FONTS

ICEWM="$HOME/.icewm"
mkdir -p $ICEWM

WALLPAPERS=$HOME/.local/share/wallpapers
mkdir -p $WALLPAPERS

cp alabastos.png $WALLPAPERS/alabastos.png

touch $ICEWM/prefoverride
cat << EOF > "$ICEWM/prefoverride"
DesktopBackgroundImage="$HOME/.local/share/wallpapers/alabastos.png"
DesktopBackgroundColor="rgb:00/00/00"
DesktopBackgroundScaled=1
DesktopBackgroundCenter=0
EOF
unset WALLPAPERS

THEMES=$ICEWM/themes
mkdir -p $THEMES

tar -xzf themes/cupertino.tar.gz -C $THEMES
tar -xzf themes/cupertino-dark.tar.gz -C $THEMES

touch $ICEWM/theme
cat << EOF > "$ICEWM/theme"
Theme="cupertino-dark/default.theme"
EOF
unset THEMES

unset ICEWM

touch $HOME/.xinitrc
cat << EOF > "$HOME/.xinitrc"
exec icewm-session
EOF

cd $HOME
echo "Welcome to Alabastos!"

startx
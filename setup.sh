#!/bin/sh

setup-xorg-base

apk add --no-cache icewm picom alacritty firefox 

apk add --no-cache xfe-xfi ristretto flameshot gimp

apk add --no-cache xfe xfe-xfa xfe-xfw lite-xl  zathura zathura-pdf-poppler

DOWNLOADS=$HOME/Downloads
mkdir -p $DOWNLOADS
mkdir -p $HOME/Pictures

# Monospace Font
#wget -P $DOWNLOADS https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.zip

# Serif Fonts (Eurocentric)
#wget -P $DOWNLOADS https://software.sil.org/downloads/r/gentium/Gentium-7.000.zip

# Sans-Serif Font (Eurocentric)
#wget -P $DOWNLOADS https://software.sil.org/downloads/r/andika/Andika-7.000.zip

FONTS="$HOME/.local/share/fonts"
mkdir -p $FONTS

#unzip $DOWNLOADS/JetBrainsMono.zip -d $FONTS/JetBrainsMono
#unzip $DOWNLOADS/Gentium-7.000.zip -d $FONTS/
#unzip $DOWNLOADS/Andika-7.000.zip -d $FONTS/
tar -xzf archives/graphoi.tar.gz -C $FONTS

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
SmallIconSize=28
MenuIconSize=28

TaskBarShowCPUStatus=1
CPUStatusShowAcpiTemp=1
CPUStatusShowAcpiTempInGraph=1
EOF
unset WALLPAPERS

THEMES=$ICEWM/themes
mkdir -p $THEMES

tar -xzf archives/cupertino.tar.gz -C $THEMES
tar -xzf archives/cupertino-dark.tar.gz -C $THEMES

touch $ICEWM/theme
cat << EOF > "$ICEWM/theme"
Theme="Cupertino_Dark/default.theme"
EOF
unset THEMES

PICOM=$HOME/.config/picom
mkdir -p $PICOM
cp /etc/xdg/picom.conf.example $PICOM/picom.conf

touch $ICEWM/startup
cat << EOF > "$ICEWM/startup"
#!/bin/sh
picom -b --config $HOME/.config/picom/picom.conf &
EOF
chmod +x $ICEWM/startup
unset PICOM

unset ICEWM

touch $HOME/.xinitrc
cat << EOF > "$HOME/.xinitrc"
exec icewm-session
EOF

cd $HOME
echo "Welcome to Alabastos!"

startx
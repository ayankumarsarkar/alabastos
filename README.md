# Alabastos

Alabastos is a lightweight desktop setup for Alpine Linux. It combines the IceWM window manager, a custom Cupertino-style theme, the Picom compositor, and a small collection of everyday Linux applications into a ready-to-run graphical environment.

<p align="center">
  <img src="alabastos.png" alt="Alabastos desktop wallpaper" width="720">
</p>

## What the setup installs

The setup script installs and configures:

- **X.Org** through `setup-xorg-base`
- **IceWM** window manager
- **Picom** compositor
- **Alacritty** terminal
- **Firefox** web browser
- **Xfe** file manager and its utilities (Xfa, Xfw, Xfi)
- **Flameshot** screenshot tool
- **LocalSend** file-sharing application
- Andika (Sans-Serif), and Gentium (Serif), JetBrainsMono (Monospace Nerd Font)
- The Cupertino light and dark IceWM themes (taken from [Cupertino | Ice-WM Themes](https://www.opendesktop.org/s/Window-Managers/p/2012987))
- An Alabastos wallpaper (created using Canva) and default desktop configuration

LocalSend installation is currently marked as untested in `setup.sh`.

## Requirements

- Alpine Linux
- A network connection
- Root access
- An X.Org-compatible system
- `wget`, `tar`, `unzip`, `fc-cache`, and `startx`

Run the setup while logged in as the desktop user that should receive the configuration. Do not run it as `root` unless you intentionally want to configure the root account (like me).

## Installation

From a fresh Alpine Linux installation, clone or copy this repository and run:

```sh
git clone https://github.com/ayankumarsarkar/alabastos.git
cd alabastos
chmod +x setup.sh
./setup.sh
```

The script creates the necessary `~/.icewm`, `~/.config/picom`, font, and wallpaper directories, then starts the X session with `startx`.

> **Warning:** `setup.sh` replaces the existing `~/.icewm/theme`, `~/.icewm/prefoverride`, `~/.icewm/startup`, and `~/.xinitrc` files. Back up any existing desktop configuration before running it. It is highly recomended to run the script on an alpine live environment.

## Default configuration

After installation, Alabastos uses:

- Dark Cupertino IceWM theme
- Alabastos wallpaper
- Picom started automatically by IceWM
- `icewm-session` started by `~/.xinitrc`

To switch to the light theme, change `Theme=` in `~/.icewm/theme` to:

```sh
Theme="Cupertino/default.theme"
```

Changes to IceWM themes can be applied from the IceWM theme menu or by restarting the session.

## Repository layout

```text
.
├── alabastos.png             # Default desktop wallpaper
├── setup.sh                  # Alpine desktop setup script
├── themes/
│   ├── cupertino.tar.gz
│   └── cupertino-dark.tar.gz
└── LICENSE
```

## Customizing

- Edit `~/.icewm/theme` to change the IceWM theme.
- Edit `~/.icewm/prefoverride` to change wallpaper or desktop background settings.
- Edit `~/.config/picom/picom.conf` to adjust compositor behavior.
- Replace `~/.local/share/wallpapers/alabastos.png` with another wallpaper.
- Change `~/.xinitrc` if you want to start a different desktop or window manager.

## License

Alabastos is available under the [MIT License](LICENSE).

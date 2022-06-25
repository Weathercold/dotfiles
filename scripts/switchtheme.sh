#!/usr/bin/env bash
# NOTE: It's really important to backup before running this script!
# First argument is the name of the theme.

[ -z "$1" ] && echo "Please specify a theme." >&2 && exit 1

# Current theme indicator for Fish and others

echo $1 > ~/.config/current_theme

# Sway

echo "include ${1}_config" > ~/.config/sway/theme

# Waybar

ln -fs ~/.config/waybar/${1}_config ~/.config/waybar/config
echo "@import url('$1.css');" > ~/.config/waybar/style.css

# Rofi

echo "@theme \"$1\"" > ~/.config/rofi/theme.rasi

# Foot

echo -e "[main]\ninclude=~/.config/foot/$1.ini" > ~/.config/foot/theme.ini

# GTK

gset="gsettings set org.gnome.desktop.interface"
if [[ $1 -eq catppuccin ]] ; then
  $gset gtk-theme            Catppuccin-purple
  $gset icon-theme           Tela
  $gset cursor-theme         Fuchsia
  $gset cursor-size          30
  $gset cursor-blink-time    500
  $gset font-name            "Open Sans 13"
  $gset monospace-font-name  "Inconsolata 13"
fi
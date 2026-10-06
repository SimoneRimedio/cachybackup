#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

echo "==> Creo le cartelle dentro dotfiles/"
mkdir -p "$DOTFILES/i3/.config/i3/scripts"
mkdir -p "$DOTFILES/polybar/.config/polybar"
mkdir -p "$DOTFILES/picom/.config/picom"
mkdir -p "$DOTFILES/fastfetch/.config/fastfetch"
mkdir -p "$DOTFILES/dunst/.config/dunst"
mkdir -p "$DOTFILES/kitty/.config/kitty"
mkdir -p "$DOTFILES/fish/.config/fish"
mkdir -p "$DOTFILES/lightdm/etc/lightdm"
mkdir -p "$DOTFILES/Immagini/Sfondi"
mkdir -p "$DOTFILES/feh/.config/feh"

echo "==> Copio i file di i3"
cp ~/.config/i3/config "$DOTFILES/i3/.config/i3/config"
cp ~/.config/i3/scripts/*.sh "$DOTFILES/i3/.config/i3/scripts/" 2>/dev/null || true

echo "==> Copio i file di Polybar"
cp -r ~/.config/polybar/* "$DOTFILES/polybar/.config/polybar/"

echo "==> Copio i file di Picom"
cp ~/.config/picom/picom.conf "$DOTFILES/picom/.config/picom/picom.conf"

echo "==> Copio i file di Fastfetch"
cp -r ~/.config/fastfetch/* "$DOTFILES/fastfetch/.config/fastfetch/"

echo "==> Copio i file di Dunst"
cp -r ~/.config/dunst/* "$DOTFILES/dunst/.config/dunst/"

echo "==> Copio i file di Kitty"
cp -r ~/.config/kitty/* "$DOTFILES/kitty/.config/kitty/" 2>/dev/null || true

echo "==> Copio i file di Fish"
cp -r ~/.config/fish/* "$DOTFILES/fish/.config/fish/" 2>/dev/null || true

echo "==> Copio gli Sfondi e le configurazioni di feh"
cp -r ~/Immagini/Sfondi/* "$DOTFILES/Immagini/Sfondi/" 2>/dev/null || true
cp ~/.fehbg "$DOTFILES/feh/.fehbg" 2>/dev/null || true
cp -r ~/.config/feh/* "$DOTFILES/feh/.config/feh/" 2>/dev/null || true

echo "==> Copio i file di rofi"
mkdir -p "$DOTFILES/rofi/.config/rofi/scripts"
cp ~/.config/rofi/config.rasi "$DOTFILES/rofi/.config/rofi/config.rasi"
cp ~/.config/rofi/powermenu.rasi "$DOTFILES/rofi/.config/rofi/powermenu.rasi"
cp ~/.config/rofi/scripts/powermenu.sh "$DOTFILES/rofi/.config/rofi/scripts/powermenu.sh"

echo "==> Copio i file di lightdm (servono i permessi sudo)"
sudo cp /etc/lightdm/lightdm.conf "$DOTFILES/lightdm/etc/lightdm/lightdm.conf"
sudo cp /etc/lightdm/lightdm-gtk-greeter.conf "$DOTFILES/lightdm/etc/lightdm/lightdm-gtk-greeter.conf"
sudo chown "$USER:$USER" "$DOTFILES/lightdm/etc/lightdm/"*.conf

echo "==> Salvo la lista pacchetti"
pacman -Qqen > "$DOTFILES/packages.txt"
pacman -Qqem > "$DOTFILES/packages-aur.txt"

echo ""
echo "✅ Backup completato in $DOTFILES"

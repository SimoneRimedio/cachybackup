#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

echo "==> Creo le cartelle dentro dotfiles/"
mkdir -p "$DOTFILES/i3/.config/i3/scripts"
mkdir -p "$DOTFILES/i3status-rust/.config/i3status-rust"
mkdir -p "$DOTFILES/i3wsr/.config/i3wsr"
mkdir -p "$DOTFILES/lightdm/etc/lightdm"

echo "==> Copio i file di i3"
cp ~/.config/i3/config "$DOTFILES/i3/.config/i3/config"
cp ~/.config/i3/scripts/*.sh "$DOTFILES/i3/.config/i3/scripts/"

echo "==> Copio i file di i3status-rust"
cp ~/.config/i3status-rust/config.toml "$DOTFILES/i3status-rust/.config/i3status-rust/config.toml"

echo "==> Copio i file di i3wsr"
cp ~/.config/i3wsr/config.toml "$DOTFILES/i3wsr/.config/i3wsr/config.toml"

echo "==> Creo le cartelle dentro dotfiles/ (rofi)"
mkdir -p "$DOTFILES/rofi/.config/rofi/scripts"

echo "==> Copio i file di rofi"
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

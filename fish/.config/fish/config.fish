source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    fastfetch --logo arch
end

fish_add_path /var/lib/flatpak/exports/bin
fish_add_path ~/.local/share/flatpak/exports/bin

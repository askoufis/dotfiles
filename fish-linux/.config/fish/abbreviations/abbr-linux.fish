# --- Config files ---
abbr -a -g eabbr-linux $EDITOR $HOME/.config/fish/abbreviations/abbr-linux.fish

# --- Screenshot ---
abbr -a -g ss "maim -s -u | xclip -selection clipboard -t image/png -i"

# --- Package management ---
# Requires pacman-contrib to be installed
# Removes old packages from the pacman cache, keeping the last 3 versions
abbr -a -g clear-package-cache "sudo paccache -rk3; paru -Sc --aur --noconfirm"
abbr -a -g update-package-mirrors reflector --save /etc/pacman.d/mirrorlist -c AU -c NZ --latest 10 --sort rate --protocol https

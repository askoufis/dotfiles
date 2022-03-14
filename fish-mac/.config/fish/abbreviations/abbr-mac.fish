# --- Config files ---
abbr -a -g eabbr-mac $EDITOR $HOME/.config/fish/abbreviations/abbr-mac.fish

# Generate a UUID and copy it to the clipboard
abbr -a -g uu "echo -n (uuidgen) | pbcopy"

if status --is-interactive
    # --- Screenshot ---
    abbr -a -g ss "maim -s -u | xclip -selection clipboard -t image/png -i"
end

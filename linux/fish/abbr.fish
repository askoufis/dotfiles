if status --is-interactive
    abbr -a -g ef 'nvim $HOME/.config/fish/config.fish'
    abbr -a -g sf 'source /home/adam/.config/fish/config.fish'
    abbr -a -g et 'nvim $HOME/.config/tmux/tmux.conf'
    abbr -a -g ev 'nvim $HOME/.config/nvim/init.vim'
    abbr -a -g eabbr 'nvim $HOME/.config/fish/abbr.fish'
    abbr -a -g se sudoedit
    abbr -a -g vim nvim
    abbr -a -g ls exa

    # --- Git ---
    abbr -a -g ga git add
    abbr -a -g gcn git commit -n
end

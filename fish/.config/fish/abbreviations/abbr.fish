if status --is-interactive
    # --- Git ---
    abbr -a -g ga git add
    abbr -a -g gcn git commit -n
    abbr -a -g gpf git push --force-with-lease
    abbr -a -g gam git commit --amend
    abbr -a -g gf git fetch --all --prune
    abbr -a -g gcm git checkout master
    abbr -a -g gfpom 'git fetch --prune && git pull origin master'
    abbr -a -g greb "git rebase -i (git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD))"

    # --- Misc ---
    abbr -a -g ef 'nvim $HOME/.config/fish/config.fish'
    abbr -a -g sf 'source /home/adam/.config/fish/config.fish'
    abbr -a -g et 'nvim $HOME/.config/tmux/tmux.conf'
    abbr -a -g ev 'nvim $HOME/.config/nvim/init.vim'
    abbr -a -g eabbr 'nvim $HOME/.config/fish/abbr.fish'
    abbr -a -g se sudoedit
    abbr -a -g vim nvim
    abbr -a -g v nvim .
    abbr -a -g ls exa
    abbr -a -g la exa -la
    abbr -a -g cat bat
end

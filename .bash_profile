# source ~/tmuxinator.bash
alias vim="nvim"
alias tmux="tmux -2"
alias la='ls -a'
alias vb='vim ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias md5sum='md5'
alias mysqlgo='docker container start mysql-dev-server'
alias mysqlstop='docker container stop mysql-dev-server'
alias ga='git add'
alias gs='git status'
alias gf='git fetch --all --prune'
alias base='git rebase -i'
# strips trailing newline
alias uu='echo -n $(uuidgen) | pbcopy'
# export GOPATH="$HOME/go"
export MYVIMRC="~/.vimrc"
export AWS_REGION="ap-southeast-2"
export GIT_EDITOR=nvim
export EDITOR=nvim
# export HOMEBREW_GITHUB_API_TOKEN=""
# export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

function awsauth { ~/code/aws-auth-saml-linux-osx-bash/auth.sh "$@"; [[ -r "$HOME/.aws/sessiontoken" ]] && .  "$HOME/.aws/sessiontoken"; }

# Git
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Don't know if I need this...
GIT_PS1_SHOWDIRTYSTATE=true

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Tell ls to be colourful
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\033[0m\] \$ '

# To stop Ctrl-s and Ctrl-q from screwing stuff up
stty -ixon

# Colours
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

source ~/tmuxinator.bash
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
alias kafkastart='~/kafka/kafka_2.11-2.0.0/bin/kafka-server-start.sh ~/kafka/kafka_2.11-2.0.0/config/server.properties'
alias zoostart='~/kafka/kafka_2.11-2.0.0/bin/zookeeper-server-start.sh ~/kafka/kafka_2.11-2.0.0/config/zookeeper.properties'
# strips trailing newline
alias uu='echo -n $(uuidgen) | pbcopy'
alias startcassandra='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'
alias stopcassandra='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'
export GOPATH="$HOME/go"
export MYVIMRC="~/.vimrc"
export AWS_REGION="ap-southeast-2"
export GIT_EDITOR=nvim
export EDITOR=nvim
export HOMEBREW_GITHUB_API_TOKEN=""
export KAFKA_OPTS="-Djava.security.auth.login.config=/Users/adamskoufis/kafka/kafka_2.11-2.0.0/config/kafka_server_jaas.conf"
export KAFKA_HOME="/Users/adamskoufis/kafka/kafka_2.11-2.0.0"
export ZK_HOSTS="localhost:2181"
export KAFKA_BROKERS="localhost:9192"
export ANSIBLE_VAULT_PASSWORD_FILE="/Users/adamskoufis/.ansible/.vault-pass"
# export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

# For hub
# export GITHUB_TOKEN="f87711cba4ea8556ea6de0b9f25c35a1aa99bfc8"
# export YOUR_USER="askoufis"
export PATH=$GOPATH/bin:/Users/adamskoufis/.local/bin:/usr/local/mysql/bin:$HOME/.cargo/bin:/usr/local/bin:$PATH

function awsauth { ~/code/aws-auth-saml-linux-osx-bash/auth.sh "$@"; [[ -r "$HOME/.aws/sessiontoken" ]] && .  "$HOME/.aws/sessiontoken"; }

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git
source ~/.git-completion.bash
source ~/.git-prompt.sh
# source ~/alacritty-completions.bash

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
# added by Anaconda2 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/anaconda2/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# added by Miniconda3 installer
export PATH="/Users/adamskoufis/miniconda3/bin:$PATH"
. /Users/adamskoufis/miniconda3/etc/profile.d/conda.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

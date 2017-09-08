alias ls='ls --color=auto'
alias tmux="tmux -2"
alias serverlogin="ssh adamsko@128.199.156.30"
alias la='ls -a --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias mercury='~/Mercury_3.9/bin/mercury'
export downloads="/storage/Downloads"
export usb="/run/media/adamsko/AJSKO1"
export adam="/storage/Adam"
export MYVIMRC="~/.vimrc"
export gv5="~/.wine/drive_c/Program*Files**x86*/GaussView508"
export PATH=/home/adamsko/.local/bin/:$PATH
export AWS_REGION="ap-southeast-2"
export GIT_EDITOR=vim

source ~/.git-prompt.sh
source ~/.git-completion.bash

# PS1='[\u@\h \W]\$ '
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '

# To stop Ctrl-s and Ctrl-q from screwing shit up
stty -ixon

export TERM=screen-256color

export PATH=$PATH:~/.local/bin:/usr/local/go/bin:~/idea-IC-172.3968.16/bin

PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH

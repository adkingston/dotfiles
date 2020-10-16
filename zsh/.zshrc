# Path to your oh-my-zsh installation.
export ZSH="/home/alexander/.config/zsh/oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"
ZSH_CUSTOM=/home/alexander/.config/zsh/oh-my-zsh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8


export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gbview='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias vim=nvim
alias tmux="tmux -u2"

alias mutt=neomutt

eval $(ssh-agent -s)
ssh-add ~/.ssh/github_rsa
clear

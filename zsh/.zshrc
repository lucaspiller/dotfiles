alias ag='ag -S'
alias vim=nvim
export EDITOR=nvim

# add custom completion scripts
fpath=(~/.zsh/completions $fpath)

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

tm() {
  [[ -z "$1" ]] && { echo "usage: tm <session>" >&2; return 1; }
  tmux has -t $1 && tmux attach -d -t $1 || tmux new -s $1
}

# ohmyzsh options
plugins=(git)

export ZSH_THEME="macovtoo"
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# record directory in ~/.lastpwd
record_pwd() {
  pwd > ~/.lastpwd
}
chpwd_functions=(record_pwd)

# go to last directory when opening a new shell
if [[ -d "`cat ~/.lastpwd`" ]]; then
  cd "`cat ~/.lastpwd`"
fi

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# 10ms key timeout
export KEYTIMEOUT=1

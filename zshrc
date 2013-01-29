# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

XDG_CONFIG_HOME=~/.config/

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

export EDITOR=vim

source $ZSH/oh-my-zsh.sh

alias tmux="TERM=xterm-256color tmux"

# Function for starting/resuming tmux sessions by name
#   workon sessionname
# If outside of vim will connect to existing or create new session and connect
# If in a vim session and exists, will switch sessions
# If in vim and doesn't exist: fails TODO: fix this
workon() {
  exist=$(tmux ls | cut -d ":" -f 1 | grep "^$1$")
  if [[ -n $exist ]]; then
    print Attaching to session $1
    if [[ -n $TMUX ]]; then
      tmux switch-client -t $1
    else
      tmux attach-session -t $1
    fi
  else
    print Creating session $1
    tmux new -s $1
  fi
}
_workon () { compadd `tmux ls | cut -d ":" -f 1`}
compdef _workon workon

# For when I forget I'm not in vim
alias :e=vim
alias :q=exit
alias :q!=exit
alias :qall!=exit
alias :qall=exit

# General aliases
alias be="bundle exec"
alias workon='nocorrect workon '

export GOPATH=/home/jhoskins/dev/go

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
export PATH=$PATH:/home/jhoskins/bin
export PATH=$PATH:/home/jhoskins/.gem/ruby/1.9.1/bin
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.local/bin:$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"


# Source Powerlinej
. $XDG_CONFIG_HOME/powerline/bindings/zsh/powerline.zsh

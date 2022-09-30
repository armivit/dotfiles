export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(fancy-ctrl-z fzf git vi-mode zsh-interactive-cd)

# User configuration
export EDITOR="nvim"
export XDG_DATA_HOME="$HOME/.local/share"

# NodeJS version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# PHP version manager
export PHPBREW_HOME="$HOME/.phpbrew"
[ -s "$PHPBREW_HOME/bashrc" ] && \. "$PHPBREW_HOME/bashrc"

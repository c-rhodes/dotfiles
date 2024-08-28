# oh-my-zsh installation path
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="agnoster"

# oh-my-zsh plugins
plugins=(git python pip ubuntu)

# User configuration

eval `dircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-dark`

source $ZSH/oh-my-zsh.sh

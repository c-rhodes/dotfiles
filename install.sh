#!/bin/bash

# Based on Dave Jones' dotfiles/install.sh
# https://github.com/waveform80/dotfiles/blob/master/install.sh

set -eu

# Disable annoying bits of unity
if type gsettings >/dev/null 2>&1; then
    gsettings set com.canonical.Unity.Lenses remote-content-search "none"
    gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false
fi

sudo apt-get update
sudo apt-get install -y \
        build-essential \
        ack-grep \
	curl \
	htop \
	git \
	git-core \
	git-extras \
	vim \
	zsh \
	tmux \
	ipython \
	ipython3 \
	python-dev \
	python-pip \
	python-virtualenv \
	python3-dev \
	python3-pip \
	virtualenvwrapper \

# Change default shell to zsh
chsh -s $(which zsh)

# Install powerline fonts
cd
git clone https://github.com/powerline/fonts.git
fonts/install.sh

# Install Solarized dircolor
cd
git clone https://github.com/seebi/dircolors-solarized.git

# Install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Setup zsh
ln -sf $HOME/workspace/dotfiles/zshrc $HOME/.zshrc

# Setup vim
ln -sf $HOME/workspace/dotfiles/vimrc $HOME/.vimrc

# Setup tmux
ln -sf $HOME/workspace/dotfiles/tmux.conf $HOME/.tmux.conf

# Setup git
ln -sf $HOME/workspace/dotfiles/gitconfig $HOME/.gitconfig

# Setup gdb
ln -sf $HOME/workspace/dotfiles/gdbinit $HOME/.gdbinit

# Setup ack
sudo ln -sf /usr/bin/ack-grep /usr/bin/ack
ln -sf $HOME/workspace/dotfiles/ackrc $HOME/.ackrc

# Setup IPython
ipython profile create
ln -sf $HOME/workspace/dotfiles/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py

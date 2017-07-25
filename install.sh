#!/bin/bash

# Based on Dave Jones' dotfiles/install.sh
# https://github.com/waveform80/dotfiles/blob/master/install.sh

set -eu

PACKAGES="\
    ack-grep \
    build-essential \
    cscope \
    exuberant-ctags \
    curl \
    git \
    git-core \
    git-extras \
    htop \
    ipython \
    ipython3 \
    python3-dev \
    python3-pip \
    python-dev \
    python-pip \
    python-virtualenv \
    tmux \
    vim \
    virtualenvwrapper \
    zsh \
    "

sudo apt update
sudo apt install -y $PACKAGES

set +e

if command -v gsettings >/dev/null; then
    if [ "$(lsb_release -is)" = "Ubuntu" ]; then
        # Disable annoying bits of unity
        gsettings set com.canonical.Unity.Lenses remote-content-search "none"
        gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false
    fi
fi

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

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

# Setup ctags
ln -sf $HOME/workspace/dotfiles/ctags $HOME/.ctags

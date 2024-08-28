#!/bin/bash

# Based on Dave Jones' dotfiles/install.sh
# https://github.com/waveform80/dotfiles/blob/master/install.sh

set -eu

SCRIPT_PATH="$(realpath "$(dirname "${BASH_SOURCE[0]:-$0}")")"

PACKAGES=(
    curl
    git
    git-core
    git-extras
    htop
    tmux
    vim
    zsh
    ripgrep
    shellcheck
    flake8
)

sudo apt update
sudo apt install -y "${PACKAGES[@]}"

set +e

# Change default shell to zsh
# NOTE: Must change required to sufficient in /etc/pam.d/chsh for this to work.
chsh -s "$(which zsh)"

# Install powerline fonts
if [ ! -d "$SCRIPT_PATH"/fonts ]; then
  git -C "$SCRIPT_PATH" clone https://github.com/powerline/fonts.git
  "$SCRIPT_PATH"/fonts/install.sh
fi

# Install Solarized dircolor
if [ ! -d "$SCRIPT_PATH"/dircolors-solarized ]; then
  git -C "$SCRIPT_PATH" clone https://github.com/seebi/dircolors-solarized.git
fi

# Install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symlink config files to $HOME.
ln -sf "$SCRIPT_PATH"/zshrc "$HOME"/.zshrc
ln -sf "$SCRIPT_PATH"/vimrc "$HOME"/.vimrc
ln -sf "$SCRIPT_PATH"/tmux.conf "$HOME"/.tmux.conf
ln -sf "$SCRIPT_PATH"/gitconfig "$HOME"/.gitconfig
ln -sf "$SCRIPT_PATH"/gdbinit "$HOME"/.gdbinit

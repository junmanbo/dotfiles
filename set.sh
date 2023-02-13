#!/bin/bash

echo "Setting Start!"
echo "Which OS do you use??"
echo "a) Based on Arch"
echo "u) Based on Ubuntu"
echo "f) Fedora"
echo "m) Mac(brew)"

read CHOICE
case $CHOICE in
    a)
        sudo pacman -S python tmux nodejs npm clang neovim zsh
        python -m pip install --upgrade pip
        python -m pip install flake8 black
   ;;
    u)
        sudo apt install tmux neovim nodejs npm python-is-python3 zsh
        python3 -m pip install --upgrade pip
        python3 -m pip install flake8 black
   ;;
    f)
        sudo dnf install tmux neovim nodejs npm zsh
        python -m pip install --upgrade pip
        python -m pip install flake8 black
   ;;
    m)
        brew install tmux nvm neovim
        python3 -m pip install --upgrade pip
        python3 -m pip install flake8 black
   ;;
esac

# Set vim
echo "Copy neovim configuration"
mkdir -p ~/.config/nvim
cp -r ~/dotfiles/nvim ~/.config/

# Copying Tmux configuration file
cp ~/dotfiles/tmux.conf ~/.tmux.conf
 
echo "Everything is Done!!"

exit 0

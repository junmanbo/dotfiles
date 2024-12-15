#!/bin/bash

echo "Setting Start!"
echo "Which OS do you use??"
echo "a) Based on Arch"
echo "u) Based on Ubuntu"
echo "r) Based on RedHat"
echo "m) Mac(brew)"

echo "Install tmux, vim, zsh, poetry..."

read CHOICE
case $CHOICE in

    a)
        sudo pacman -S python tmux nodejs npm clang zsh
   ;;
    u)
        sudo apt install tmux wget curl gcc git libncurses-dev python3-pip python-is-python3 zsh -y
        sudo apt install python3-flake8 python3-poetry -y
   ;;
    r)
        sudo yum install tmux zsh wget curl gcc ncurses-devel libtool git python3 python3-pip -y --allowerasing
        python3 -m pip install --upgrade pip
        python3 -m pip install flake8 poetry
        echo "alias poetry='python3 -m poetry'" >> ~/.zshrc
   ;;
    m)
        brew install tmux nvm vim
   ;;
esac

# ZSH Setting
# Install oh my zsh
echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
 
# Download ZSH plugin
echo "Install autosuggestion plugin"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Install syntax highlighting plugin"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Install powerlevel10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# .zshrc 파일 경로
ZSHRC_FILE="$HOME/.zshrc"

# ZSH_THEME 변경
sed -i.bak 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $ZSHRC_FILE

# plugins 변경
sed -i 's/plugins=(git)/plugins=(\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n  vi-mode\n  git\n)/' $ZSHRC_FILE
echo ".zshrc 파일이 성공적으로 업데이트되었습니다."

# Install Latest VIM from source code
echo "Install vim..."
git clone https://github.com/vim/vim.git ~/vim
cd ~/vim/src
make
sudo make install

# NVM 설치 스크립트
echo "Install nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# NVM 설정 적용
source ~/.zshrc

# 최신 LTS 버전의 Node.js 설치
echo "Install latest Node.js LTS version..."
nvm install --lts

# 설치된 Node.js 버전 확인
echo "Check Node.js version..."
node -v


# Set vim
echo "Copy vim configuration"
cp -r ~/dotfiles/vim ~/.vim
cp ~/dotfiles/vimrc.vim ~/.vimrc

# Copying Tmux configuration file
cp ~/dotfiles/tmux.conf ~/.tmux.conf


echo "Everything is Done!!"

exit 0

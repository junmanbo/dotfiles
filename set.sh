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
   ;;
    r)
        sudo yum install tmux zsh wget curl gcc ncurses-devel libtool git python3 python3-pip -y --allowerasing
   ;;
    m)
        brew install tmux nvm vim
   ;;
esac

# Install Latest VIM from source code
echo "Install vim..."
git clone https://github.com/vim/vim.git $HOME/vim
cd $HOME/vim/src
make
sudo make install
cd $HOME

# NVM 설치 스크립트
echo "Install nvm..."
# GitHub API를 통해 최신 릴리즈 태그 가져오기
latest_tag=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# 최신 태그를 가져오지 못한 경우 에러 처리
if [ -z "$latest_tag" ]; then
  echo "최신 릴리즈 정보를 가져오지 못했습니다."
  exit 1
fi

# 최신 install.sh 스크립트 URL 생성
install_script_url="https://raw.githubusercontent.com/nvm-sh/nvm/$latest_tag/install.sh"

echo "NVM 최신 릴리즈 태그: $latest_tag"

# 스크립트 다운로드 및 실행
curl -o- "$install_script_url" | bash

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
cp -r $HOME/dotfiles/vim $HOME/.vim
cp $HOME/dotfiles/vimrc.vim $HOME/.vimrc

# Copying Tmux configuration file
cp $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

# Install UV (python package manager)
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Everything is Done!!"

exit 0

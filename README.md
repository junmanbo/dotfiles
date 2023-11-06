# dotfiles

dotfiles for me

- npm 사전 설치 필수!

## VIM을 IDE로 만들기

1. Clone Repository `git clone https://github.com/junmanbo/dotfiles.git`
2. Script 실행 `sh ~/dotfiles/set.sh`
3. 사용하는 OS 및 distro 선택

### vim 에서 coc 사용하려면

- node 버전 14.x 이상 설치

### vim 에서 Github Copilot 사용하려면

- neovim 실행 후 `:Copilot setup` 에서 Github 계정 로그인 
- `:Copilot enable` Copilot 활성화

## neovim 설정

1. nvchad 설치
    - `git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim`
2. custom 에 설정해 놓은 file 및 directory 복사하기
    - cp -r ~/dotfiles/nvim/lua/custom/* ~/.config/nvim/lua/custom/
3. neovim 실행하고 :MasonInstallAll 실행
4. neovim 실행하고 :TSInstall python 실행

-> (추후예정) vim, neovim 골라서 기존의 set.sh에서 하나의 script 로 설치할 수 있도록 세팅하기

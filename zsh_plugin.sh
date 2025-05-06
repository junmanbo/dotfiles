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

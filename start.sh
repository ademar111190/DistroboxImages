#!/bin/bash
echo "Starting 🍻"

cd ~
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

curl --output ~/.zshrc \"https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.zshrc\"
curl --output ~/.p10k.zsh https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.p10k.zsh
curl --output ~/.gitconfig https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.gitconfig

echo "entering zsh, please exit to finish the script"
zsh

echo "Done 🍻"

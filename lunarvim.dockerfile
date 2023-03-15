FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# lunarvim stuff
RUN sudo zypper addrepo https://cli.github.com/packages/rpm/gh-cli.repo -y; \
    sudo zypper refresh; \
    zypper -n install -t pattern devel_basis; \
    zypper -n install bat exa gh git git-lfs htop ncdu neofetch neovim nodejs19 python3 zsh; \
    python -m ensurepip --upgrade; \
    wget -O rustuio.sh https://sh.rustup.rs; \
    sh rustuio.sh -y; \
    rm rustuio.sh; \
    chmod 755 -R /root/.cargo;

RUN echo "#!/bin/bash" > /usr/bin/init-script; \
    echo "cd ~" >> /usr/bin/init-script; \
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"" >> /usr/bin/init-script; \
    echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" >> /usr/bin/init-script; \
    echo "git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" >> /usr/bin/init-script; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.zshrc" >> /usr/bin/init-script; \
    echo "echo \"export PATH=\$PATH:/root/.cargo/bin\" >> \$HOME/.zshrc" >> /usr/bin/init-script; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.p10k.zsh" >> /usr/bin/init-script; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.gitconfig" >> /usr/bin/init-script; \
    echo "echo \"entering zsh, please exit to finish the script\"" >> /usr/bin/init-script; \
    echo "zsh" >> /usr/bin/init-script; \
    echo "mv ~/.zshrc.1 ~/.zshrc" >> /usr/bin/init-script; \
    echo "zsh" >> /usr/bin/init-script; \
    echo "wget -O lunarvim.sh https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.sh" >> /usr/bin/init-script; \
    echo "sh lunarvim.sh -y" >> /usr/bin/init-script; \
    echo "rm lunarvim.sh" >> /usr/bin/init-script; \
    echo "echo \"entering lvim for initial installation, please exit after it finishes to continue the script\"" >> /usr/bin/init-script; \
    echo "sleep 5s" >> /usr/bin/init-script; \
    echo "lvim" >> /usr/bin/init-script; \
    echo "mkdir -p \$HOME/.config/lvim" >> /usr/bin/init-script; \
    echo "mkdir -p \$HOME/.config/nvim/pack/github/start" >> /usr/bin/init-script; \
    echo "git clone --depth=1 https://github.com/github/copilot.vim \$HOME/.config/nvim/pack/github/start/copilot.vim" >> /usr/bin/init-script; \
    echo "wget -O \$HOME/.config/lvim/config.lua https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/config.lua" >> /usr/bin/init-script; \
    echo "echo \"entering lvim for copilot setup, run :Copilot setup and after it finishes run :q to continue the script\"" >> /usr/bin/init-script; \
    echo "sleep 5s" >> /usr/bin/init-script; \
    echo "lvim" >> /usr/bin/init-script; \
    chmod 755 /usr/bin/init-script


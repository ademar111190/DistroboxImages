FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# my stuff
RUN zypper -n install bat exa git git-lfs htop ncdu neofetch neovim zsh

RUN echo "#!/bin/bash" > /usr/bin/init-script; \
    echo "cd ~" >> /usr/bin/init-script; \
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"" >> /usr/bin/init-script; \
    echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" >> /usr/bin/init-script; \
    echo "git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" >> /usr/bin/init-script; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.zshrc" >> /usr/bin/init-script; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.p10k.zsh" >> /usr/bin/init-script; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.gitconfig" >> /usr/bin/init-script; \
    echo "echo \"entering zsh, please exit to finish the script\"" >> /usr/bin/init-script; \
    echo "zsh" >> /usr/bin/init-script; \
    echo "mv ~/.zshrc.1 ~/.zshrc" >> /usr/bin/init-script; \
    echo "zsh" >> /usr/bin/init-script; \
    chmod 755 /usr/bin/init-script

FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# my stuff
RUN zypper -n install bat exa git neofetch neovim zsh

RUN echo "#!/usr/bin/env bash" > /bin/init-zsh; \
    echo "cd ~" >> /bin/init-zsh; \
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"" >> /bin/init-zsh; \
    echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" >> /bin/init-zsh; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.zshrc" >> /bin/init-zsh; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.p10k.zsh" >> /bin/init-zsh; \
    echo "chmod +x /bin/init-zsh"

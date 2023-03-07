FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# my stuff
RUN zypper -n install bat exa git neofetch neovim zsh

ENV PATH="${PATH}:/opt"

RUN echo "#!/bin/bash" > /opt/init-zsh; \
    echo "cd ~" >> /opt/init-zsh; \
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"" >> /opt/init-zsh; \
    echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" >> /opt/init-zsh; \
    echo "git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" >> /opt/init-zsh; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.zshrc" >> /opt/init-zsh; \
    echo "wget https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.p10k.zsh" >> /opt/init-zsh; \
    echo "echo \"entering zsh, please exit to finish the script\"" >> /opt/init-zsh; \
    echo "zsh" >> /opt/init-zsh ; \
    echo "mv ~/.zshrc.1 ~/.zshrc"; \
    chmod 755 /opt/init-zsh

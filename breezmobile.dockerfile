FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# my stuff
RUN zypper -n install bat exa git git-lfs htop ncdu neofetch zsh unzip zip awk

RUN echo "#!/bin/bash" > /usr/bin/init-script; \
    echo "cd ~" >> /usr/bin/init-script; \
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"" >> /usr/bin/init-script; \
    echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" >> /usr/bin/init-script; \
    echo "git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" >> /usr/bin/init-script; \
    echo "curl --output ~/.zshrc \"https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.zshrc\"" >> /usr/bin/init-script; \
    echo "curl --output ~/.p10k.zsh https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.p10k.zsh" >> /usr/bin/init-script; \
    echo "curl --output ~/.gitconfig https://raw.githubusercontent.com/ademar111190/DistroboxImages/main/.gitconfig" >> /usr/bin/init-script; \
    echo "echo \"entering zsh, please exit to finish the script\"" >> /usr/bin/init-script; \
    echo "zsh" >> /usr/bin/init-script; \
    echo "echo \"install go\"" >> /usr/bin/init-script; \
    echo "wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz" >> /usr/bin/init-script; \
    echo "rm -rf ~/go && tar -C ~ -xzf go1.21.0.linux-amd64.tar.gz" >> /usr/bin/init-script; \
    echo "rm go1.21.0.linux-amd64.tar.gz" >> /usr/bin/init-script; \
    echo "~/go/bin/go install golang.org/x/mobile/cmd/gomobile@latest" >> /usr/bin/init-script; \
    echo "~/go/bin/go install golang.org/x/mobile/cmd/gobind@latest" >> /usr/bin/init-script; \
    echo "echo \"install flutter\"" >> /usr/bin/init-script; \
    echo "git clone --depth 1 --branch 3.7.12 https://github.com/flutter/flutter.git ~/flutter" >> /usr/bin/init-script; \
    echo "~/flutter/bin/flutter precache" >> /usr/bin/init-script; \
    echo "echo \"export PATH=$PATH:~/go/bin\" >> ~/.zshrc" >> /usr/bin/init-script; \
    echo "echo \"export PATH=$PATH:~/flutter/bin\" >> ~/.zshrc" >> /usr/bin/init-script; \
    chmod 755 /usr/bin/init-script

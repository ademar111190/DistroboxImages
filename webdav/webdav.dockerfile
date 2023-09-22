FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel \
    libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# my stuff
RUN zypper -n install bat exa git git-lfs git-delta htop ncdu neofetch zsh unzip zip awk fzf

ARG version=v0.36.0
RUN curl -fsSL -o dufs.tar.gz "https://github.com/sigoden/dufs/releases/download/${version}/dufs-${version}-x86_64-unknown-linux-musl.tar.gz" ;\
    tar xvzf dufs.tar.gz; \
    rm dufs.tar.gz; \
    mv dufs /usr/bin/dufs; \
    chmod 755 /usr/bin/dufs

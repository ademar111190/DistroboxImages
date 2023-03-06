FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# jetbrains dependencies
RUN zypper -n install fuse3 gtk4-devel libXtst

ARG version=1.27.3.14493
RUN wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-${version}.tar.gz ; \
    tar xvzf jetbrains-toolbox-${version}.tar.gz ; \
    rm jetbrains-toolbox-${version}.tar.gz ; \
    mv jetbrains-toolbox-${version}.tar.gz /bin/jetbrains-toolbox

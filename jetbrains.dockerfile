FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# jetbrains dependencies
RUN zypper -n install fuse fuse3 gtk4-devel libfuse2 libXtst
# android avd dependencies
RUN zypper -n install libpulse0 execstack mozilla-nss

ARG version=2.0.2.16660
RUN wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-${version}.tar.gz; \
    tar xvzf jetbrains-toolbox-${version}.tar.gz; \
    rm jetbrains-toolbox-${version}.tar.gz; \
    mv jetbrains-toolbox-${version}/jetbrains-toolbox /usr/bin/jetbrains-toolbox; \
    chmod 755 /usr/bin/jetbrains-toolbox

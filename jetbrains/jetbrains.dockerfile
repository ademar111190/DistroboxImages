FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel \
    libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# jetbrains dependencies
RUN zypper -n install fuse fuse3 gtk4-devel libfuse2 libXtst
# android avd dependencies
RUN zypper -n install libpulse0 execstack mozilla-nss

# jetbrains toolbox
ARG version=2.0.3.17006
RUN curl -fsSL "https://download.jetbrains.com/toolbox/jetbrains-toolbox-${version}.tar.gz" -o toolbox.tar.gz ; \
    tar xvzf toolbox.tar.gz; \
    rm toolbox.tar.gz; \
    mv jetbrains-toolbox-${version}/jetbrains-toolbox /usr/bin/jetbrains-toolbox; \
    rm -r jetbrains-toolbox-${version}/jetbrains-toolbox; \
    chmod 755 /usr/bin/jetbrains-toolbox

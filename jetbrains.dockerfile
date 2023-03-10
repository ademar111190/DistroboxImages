FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# jetbrains dependencies
RUN zypper -n install fuse fuse3 gtk4-devel libfuse2 libXtst

ARG version=1.27.3.14493
RUN wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-${version}.tar.gz; \
    tar xvzf jetbrains-toolbox-${version}.tar.gz; \
    rm jetbrains-toolbox-${version}.tar.gz; \
    mv jetbrains-toolbox-${version}/jetbrains-toolbox /usr/bin/jetbrains-toolbox; \
    chmod 755 /usr/bin/jetbrains-toolbox

RUN echo "#!/bin/bash" > /usr/bin/init-script; \
    echo "jetbrains-toolbox" >> /usr/bin/init-script; \
    echo "sleep 1m # make sure the first run happened" >> /usr/bin/init-script; \
    echo "distrobox-export --app jetbrains-toolbox" >> /usr/bin/init-script; \
    echo "echo \"You may need to fix the icon path on the file ~/.local/share/applications/<<image name>>-jetbrains-toolbox.desktop\"" >> /usr/bin/init-script; \
    chmod 755 /usr/bin/init-script

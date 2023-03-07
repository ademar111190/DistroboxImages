FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# jetbrains dependencies
RUN zypper -n install fuse3 gtk4-devel libXtst

ENV PATH="${PATH}:/opt"
ENV PATH="${PATH}:/opt/jetbrains-toolbox"

ARG version=1.27.3.14493
RUN wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-${version}.tar.gz ; \
    tar xvzf jetbrains-toolbox-${version}.tar.gz ; \
    rm jetbrains-toolbox-${version}.tar.gz ; \
    mkdir -p /opt ; \
    mv jetbrains-toolbox-${version} /opt/jetbrains-toolbox ; \
    chmod a+rwx -R /opt/jetbrains-toolbox

RUN echo "#!/bin/bash" > /opt/init-jetbrains-toolbox; \
    echo "jetbrains-toolbox" ; \
    echo "distrobox-export --app jetbrains-toolbox" >> /opt/init-jetbrains-toolbox; \
    echo "You may need to fix the icon path on the file \${HOME}/.local/share/applications/jetbrains-toolbox.desktop" >> /opt/init-jetbrains-toolbox; \
    chmod 755 /opt/init-jetbrains-toolbox

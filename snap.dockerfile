FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# snap dependencies
RUN zypper -n addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed snappy; \
    zypper -n --gpg-auto-import-keys refresh; \
    zypper -n dup; \
    zypper -n install snapd; \
    systemctl enable snapd; \
    systemctl start snapd; \
    systemctl enable snapd.apparmor; \
    systemctl start snapd.apparmor; \
    snap install snap-store

RUN echo "#!/bin/bash" > /usr/bin/init-script; \
    echo "cd ~" >> /usr/bin/init-script; \
    echo "snap-store" >> /usr/bin/init-script; \
    echo "sleep 1m # make sure the first run happened" >> /usr/bin/init-script; \
    echo "distrobox-export --app snap-store" >> /usr/bin/init-script; \
    echo "echo \"You may need to fix the icon path on the file ~/.local/share/applications/<<image name>>-jetbrains-toolbox.desktop\"" >> /usr/bin/init-script; \
    chmod 755 /usr/bin/init-script

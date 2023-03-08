FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# enpass dependencies
RUN zypper addrepo -f -c https://download.opensuse.org/repositories/X11:XOrg/openSUSE_Tumbleweed/X11:XOrg.repo X11XOrg; \
    zypper update; \
    zypper -n install libxcb

RUN wget https://yum.enpass.io/RPM-GPG-KEY-enpass-signing-key; \
    rpm --import RPM-GPG-KEY-enpass-signing-key; \
    zypper addrepo -f -c https://yum.enpass.io/stable/x86_64/ Enpass; \
    zypper update; \
    zypper -n install enpass

RUN echo "#!/bin/bash" > /usr/bin/init-script; \
    echo "enpass" >> /usr/bin/init-script; \
    echo "sleep 1m # make sure the first run happened" >> /usr/bin/init-script; \
    echo "distrobox-export --app enpass" >> /usr/bin/init-script; \
    echo "echo \"You may need to fix the icon path on the file ~/.local/share/applications/<<image name>>-enpass.desktop\"" >> /usr/bin/init-script; \
    chmod 755 /usr/bin/init-script

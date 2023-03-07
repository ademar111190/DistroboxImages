FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget


RUN wget https://yum.enpass.io/RPM-GPG-KEY-enpass-signing-key ; \
    rpm --import RPM-GPG-KEY-enpass-signing-key ; \
    zypper ar -n -f -c https://yum.enpass.io/stable/x86_64/ Enpass ; \
    zypper update ; \
    zypper -n install enpass

RUN mkdir /opt ; chmod 777 /opt ; \
    echo "#!/bin/bash" > /opt/init-enpass; \
    echo "enpass" ; \
    echo "distrobox-export --app enpass" >> /opt/init-enpass; \
    echo "You may need to fix the icon path on the file \${HOME}/.local/share/applications/enpass.desktop" >> /opt/init-enpass; \
    chmod 755 /opt/init-enpass

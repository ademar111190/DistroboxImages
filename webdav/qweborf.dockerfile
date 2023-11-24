FROM quay.io/toolbx-images/ubuntu-toolbox:22.04

RUN export DEBIAN_FRONTEND=noninteractive ; apt update

# distrobox stuff
RUN apt install -y bash apt-utils bash-completion bc bzip2 curl dialog diffutils findutils gnupg gnupg2 gpgsm hostname \
    iproute2 iputils-ping keyutils language-pack-en less libcap2-bin libkrb5-3 libnss-mdns libnss-myhostname \
    libvte-2.9*-common locales lsof man-db manpages mtr ncurses-base openssh-client passwd pigz pinentry-curses procps \
    rsync sudo tcpdump time traceroute tree tzdata unzip util-linux wget xauth xz-utils zip libegl1-mesa \
    libgl1-mesa-glx libvulkan1 mesa-vulkan-drivers

# qweborf https://ltworf.github.io/weborf/qweborf.html
RUN curl -fsSL https://github.com/ltworf/weborf/releases/download/1.0/qweborf_1.0-1_all.deb -o qweborf.deb; \
    curl -fsSL https://github.com/ltworf/weborf/releases/download/1.0/weborf_1.0-1_amd64.deb -o weborf.deb; \
    apt install -y ./weborf.deb ; \
    apt install -y ./qweborf.deb ; \
    rm weborf.deb qweborf.deb

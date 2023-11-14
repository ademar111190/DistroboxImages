FROM quay.io/toolbx-images/ubuntu-toolbox:22.04

RUN export DEBIAN_FRONTEND=noninteractive ; apt update

# distrobox stuff
RUN apt install -y bash apt-utils bash-completion bc bzip2 curl dialog diffutils findutils gnupg gnupg2 gpgsm hostname \
    iproute2 iputils-ping keyutils language-pack-en less libcap2-bin libkrb5-3 libnss-mdns libnss-myhostname \
    libvte-2.9*-common locales lsof man-db manpages mtr ncurses-base openssh-client passwd pigz pinentry-curses procps \
    rsync sudo tcpdump time traceroute tree tzdata unzip util-linux wget xauth xz-utils zip libegl1-mesa \
    libgl1-mesa-glx libvulkan1 mesa-vulkan-drivers

# breez cloud stuff
RUN apt install -y build-essential git protobuf-compiler libclang-dev gcc-arm-linux-gnueabi gcc-arm-linux-gnueabihf \
    gcc-aarch64-linux-gnu g++-arm-linux-gnueabi nodejs npm

# clion needs access the cc compiler so we need to install in on this box insted of using the jetbrains box
RUN apt install -y libfuse2 fuse fuse3 libgtk-4-dev libxtst-dev xdg-utils flatpak
ARG version=2.0.3.17006
RUN curl -fsSL "https://download.jetbrains.com/toolbox/jetbrains-toolbox-${version}.tar.gz" -o toolbox.tar.gz ; \
    tar xvzf toolbox.tar.gz; \
    rm toolbox.tar.gz; \
    mv jetbrains-toolbox-${version}/jetbrains-toolbox /usr/bin/jetbrains-toolbox; \
    rm -r jetbrains-toolbox-${version}/jetbrains-toolbox; \
    chmod 755 /usr/bin/jetbrains-toolbox

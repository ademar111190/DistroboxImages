FROM docker.io/library/ubuntu:22.04

RUN export DEBIAN_FRONTEND=noninteractive ; apt update

# distrobox stuff
RUN apt install -y bash apt-utils bash-completion bc bzip2 curl dialog diffutils findutils gnupg gnupg2 gpgsm hostname \
    iproute2 iputils-ping keyutils language-pack-en less libcap2-bin libkrb5-3 libnss-mdns libnss-myhostname \
    libvte-2.9*-common locales lsof man-db manpages mtr ncurses-base openssh-client passwd pigz pinentry-curses procps \
    rsync sudo tcpdump time traceroute tree tzdata unzip util-linux wget xauth xz-utils zip libegl1-mesa \
    libgl1-mesa-glx libvulkan1 mesa-vulkan-drivers

# lineage os stuff
RUN apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf \
    imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev \
    libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zlib1g-dev \
    libwxgtk3.0-gtk3-dev python3 python2
RUN curl -fsSL https://storage.googleapis.com/git-repo-downloads/repo --output /usr/bin/repo ; \
    chmod +x /usr/bin/repo

# utils (adb fastboot)
RUN apt install -y nano udev usbutils
# lsusb
# Bus 001 Device 013: ID 18d1:d00d Google Inc. Xiaomi Mi/Redmi 2 (fastboot)
# sudo vim /etc/udev/rules.d/51-android.rules # host machine
# SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="d00d", MODE="0666", GROUP="plugdev"

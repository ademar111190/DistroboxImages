FROM quay.io/toolbx-images/ubuntu-toolbox:22.04

RUN export DEBIAN_FRONTEND=noninteractive ; apt update

# distrobox
RUN apt install -y bash apt-utils bash-completion bc bzip2 curl dialog diffutils findutils gnupg gnupg2 gpgsm hostname \
    iproute2 iputils-ping keyutils language-pack-en less libcap2-bin libkrb5-3 libnss-mdns libnss-myhostname \
    libvte-2.9*-common locales lsof man-db manpages mtr ncurses-base openssh-client passwd pigz pinentry-curses procps \
    rsync sudo tcpdump time traceroute tree tzdata unzip util-linux wget xauth xz-utils zip libegl1-mesa \
    libgl1-mesa-glx libvulkan1 mesa-vulkan-drivers

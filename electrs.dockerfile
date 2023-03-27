FROM docker.io/library/ubuntu:22.10

# distrobox stuff
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt upgrade -y; \
    apt-get install -y \
      bash \
      apt-utils \
      bc \
      curl \
      dialog \
      diffutils \
      findutils \
      gnupg2 \
      less \
      libnss-myhostname \
      libvte-2.9[0-9]-common \
      libvte-common \
      lsof \
      ncurses-base \
      passwd \
      pinentry-curses \
      procps \
      sudo \
      time \
      wget \
      util-linux \
      libegl1-mesa \
      libgl1-mesa-glx \
      libvulkan1 \
      mesa-vulkan-drivers
# umbrel stuff
RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -y \
      build-essential \
      cargo \
      clang \
      cmake \
      git
RUN git clone https://github.com/romanz/electrs; \
    cd electrs; \
    git checkout v0.9.12; \
    cargo build --locked --release; \
    ./target/release/electrs --version

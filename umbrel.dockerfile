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
      iproute2 \
      dbus-x11 \
      flatpak \
      fswatch \
      jq \
      rsync \
      curl \
      git \
      gettext-base \
      python3 \
      gnupg \
      avahi-daemon \
      avahi-discover \
      libnss-mdns \
      python3-pip \
      libffi-dev \
      docker-compose
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/docker
RUN curl -L "https://github.com/mikefarah/yq/releases/download/v4.24.5/yq_linux_arm64" -o /usr/bin/yq; \
    chmod +x /usr/bin/yq
RUN git clone --depth 1 --branch v0.5.3 https://github.com/getumbrel/umbrel.git
RUN echo "[Unit]" > /etc/systemd/system/umbrel-startup.service; \
    echo "Wants=network-online.target" >> /etc/systemd/system/umbrel-startup.service; \
    echo "After=network-online.target" >> /etc/systemd/system/umbrel-startup.service; \
    echo "Wants=docker.service" >> /etc/systemd/system/umbrel-startup.service; \
    echo "After=docker.service" >> /etc/systemd/system/umbrel-startup.service; \
    echo "# This prevents us hitting restart rate limits and ensures we keep restarting" >> /etc/systemd/system/umbrel-startup.service; \
    echo "# indefinitely." >> /etc/systemd/system/umbrel-startup.service; \
    echo "StartLimitInterval=0" >> /etc/systemd/system/umbrel-startup.service; \
    echo "[Service]" >> /etc/systemd/system/umbrel-startup.service; \
    echo "Type=forking" >> /etc/systemd/system/umbrel-startup.service; \
    echo "TimeoutStartSec=infinity" >> /etc/systemd/system/umbrel-startup.service; \
    echo "TimeoutStopSec=16min" >> /etc/systemd/system/umbrel-startup.service; \
    echo "ExecStart=/umbrel/scripts/start" >> /etc/systemd/system/umbrel-startup.service; \
    echo "ExecStop=/umbrel/scripts/stop" >> /etc/systemd/system/umbrel-startup.service; \
    echo "User=root" >> /etc/systemd/system/umbrel-startup.service; \
    echo "Group=root" >> /etc/systemd/system/umbrel-startup.service; \
    echo "StandardOutput=syslog" >> /etc/systemd/system/umbrel-startup.service; \
    echo "StandardError=syslog" >> /etc/systemd/system/umbrel-startup.service; \
    echo "SyslogIdentifier=umbrel startup" >> /etc/systemd/system/umbrel-startup.service; \
    echo "RemainAfterExit=yes" >> /etc/systemd/system/umbrel-startup.service; \
    echo "Restart=always" >> /etc/systemd/system/umbrel-startup.service; \
    echo "RestartSec=10" >> /etc/systemd/system/umbrel-startup.service; \
    echo "[Install]" >> /etc/systemd/system/umbrel-startup.service; \
    echo "WantedBy=multi-user.target" >> /etc/systemd/system/umbrel-startup.service; \
    chmod 644 "/etc/systemd/system/umbrel-startup.service"; \
    systemctl enable "umbrel-startup.service"

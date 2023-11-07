FROM quay.io/toolbx-images/ubuntu-toolbox:22.04

RUN export DEBIAN_FRONTEND=noninteractive ; apt update

# distrobox stuff
RUN apt install -y bash apt-utils bash-completion bc bzip2 curl dialog diffutils findutils gnupg gnupg2 gpgsm hostname \
    iproute2 iputils-ping keyutils language-pack-en less libcap2-bin libkrb5-3 libnss-mdns libnss-myhostname \
    libvte-2.9*-common locales lsof man-db manpages mtr ncurses-base openssh-client passwd pigz pinentry-curses procps \
    rsync sudo tcpdump time traceroute tree tzdata unzip util-linux wget xauth xz-utils zip libegl1-mesa \
    libgl1-mesa-glx libvulkan1 mesa-vulkan-drivers

# stable diffusion
RUN apt install -y wget git python3 python3.10-venv python3-pip libgl1 libglib2.0-0 google-perftools execstack

# AMD rocm https://rocm.docs.amd.com/en/latest/
# at this time we have 5.7.1 already but 5.4.2 is required by PyTorch
ENV ROCM_VERSION=5.4.2
RUN mkdir --parents --mode=0755 /etc/apt/keyrings ; wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | \
    gpg --dearmor | sudo tee /etc/apt/keyrings/rocm.gpg > /dev/null
RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] http://repo.radeon.com/amdgpu/${ROCM_VERSION}/ubuntu jammy main" >> /etc/apt/sources.list.d/amdgpu.list
RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] http://repo.radeon.com/rocm/apt/debian jammy main" >> /etc/apt/sources.list.d/rocm.list
RUN echo "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600" >> /etc/apt/preferences.d/rocm-pin-600
RUN apt update ; apt install -y amdgpu-dkms rocm-hip-libraries rocm-hip-sdk rocm-libs rccl \
    "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
RUN echo "/opt/rocm/lib" >> /etc/ld.so.conf.d/rocm.conf ; \
    echo "/opt/rocm/lib64" >> /etc/ld.so.conf.d/rocm.conf ; \
    ldconfig

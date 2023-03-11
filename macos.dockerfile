FROM registry.opensuse.org/opensuse/tumbleweed:latest

# distrobox stuff
RUN zypper -n install bash bc curl diffutils findutils gnupg less libvte-2* libvulkan1 libvulkan_intel libvulkan_radeon lsof Mesa-dri ncurses pinentry procps shadow sudo systemd time util-linux util-linux-systemd wget
# mac os dependencies
RUN zypper -n install git python3-pip qemu-audio-pa qemu-kvm qemu-tools qemu-x86

RUN git clone --depth=1 https://github.com/notAperson535/OneClick-macOS-Simple-KVM.git macoskvm
RUN python3 macoskvm/fetch-macOS-v2.py -s ventura; \
    (ls RecoveryImage.dmg >> /dev/null 2>&1 && mv RecoveryImage.dmg BaseSystem.dmg) || echo ""; \
    qemu-img convert BaseSystem.dmg -O raw BaseSystem.img; \
    rm BaseSystem.dmg
RUN (ls macOS.qcow2 >> /dev/null 2>&1 && echo "") || qemu-img create -f qcow2 macOS.qcow2 20G

ARG args=( \
        -enable-kvm \
        -m 2G \
        -machine q35,accel=kvm \
        -smp 2,cores=2 \
        -cpu Haswell,vendor=GenuineIntel,kvm=on,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,+xsavec,+xgetbv1,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc,+avx2 \
        -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \
        -smbios type=2 \
        -device intel-hda -device hda-output \
        -drive if=pflash,format=raw,readonly=on,file="$OVMF/OVMF_CODE.fd" \
        -drive if=pflash,format=raw,file="$OVMF/OVMF_VARS.fd" \
        -vga qxl \
        -usb -device usb-kbd -device usb-tablet \
        -netdev user,id=net0 \
        -device vmxnet3,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
        -monitor telnet:127.0.0.1:5801,server,nowait \
        -device ich9-ahci,id=sata \
        -drive id=OpenCore,if=none,format=qcow2,file="OpenCore.qcow2" \
        -device ide-hd,bus=sata.2,drive=OpenCore \
        -drive id=InstallMedia,format=raw,if=none,file="BaseSystem.img" \
        -device ide-hd,bus=sata.3,drive=InstallMedia \
        -drive id=SystemDisk,if=none,file="macOS.qcow2" \
        -device ide-hd,bus=sata.4,drive=SystemDisk \
    )

RUN echo "#!/bin/bash" > /usr/bin/init-script; \
    echo "qemu-system-x86_64 \"${args[@]}\"" > /usr/bin/init-script; \
    chmod 755 /usr/bin/init-script

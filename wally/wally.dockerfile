FROM registry.fedoraproject.org/fedora:38

# distrobox stuff
RUN yum install -y bash bash-completion bc curl diffutils findutils glibc-all-langpacks glibc-locale-source gnupg2 less lsof ncurses pam passwd pinentry procps-ng shadow-utils sudo time tzdata util-linux vte-profile wget mesa-dri-drivers mesa-vulkan-drivers vulkan
# wally dependencies
RUN yum install -y gtk3 webkit2gtk3 libusb

RUN touch /etc/udev/rules.d/50-zsa.rules ;\
    echo "# Rules for Oryx web flashing and live training" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"16c0\", MODE=\"0664\", GROUP=\"plugdev\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"3297\", MODE=\"0664\", GROUP=\"plugdev\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "# Legacy rules for live training over webusb (Not needed for firmware v21+)" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  # Rule for all ZSA keyboards" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  SUBSYSTEM==\"usb\", ATTR{idVendor}==\"3297\", GROUP=\"plugdev\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  # Rule for the Moonlander" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  SUBSYSTEM==\"usb\", ATTR{idVendor}==\"3297\", ATTR{idProduct}==\"1969\", GROUP=\"plugdev\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  # Rule for the Ergodox EZ" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  SUBSYSTEM==\"usb\", ATTR{idVendor}==\"feed\", ATTR{idProduct}==\"1307\", GROUP=\"plugdev\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  # Rule for the Planck EZ" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "  SUBSYSTEM==\"usb\", ATTR{idVendor}==\"feed\", ATTR{idProduct}==\"6060\", GROUP=\"plugdev\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "# Wally Flashing rules for the Ergodox EZ" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "ATTRS{idVendor}==\"16c0\", ATTRS{idProduct}==\"04[789B]?\", ENV{ID_MM_DEVICE_IGNORE}=\"1\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "ATTRS{idVendor}==\"16c0\", ATTRS{idProduct}==\"04[789A]?\", ENV{MTP_NO_PROBE}=\"1\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"16c0\", ATTRS{idProduct}==\"04[789ABCD]?\", MODE:=\"0666\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "KERNEL==\"ttyACM*\", ATTRS{idVendor}==\"16c0\", ATTRS{idProduct}==\"04[789B]?\", MODE:=\"0666\"" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "# Wally Flashing rules for the Moonlander and Planck EZ" >> /etc/udev/rules.d/50-zsa.rules ;\
    echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"df11\", MODE:=\"0666\", SYMLINK+=\"stm32_dfu\"" >> /etc/udev/rules.d/50-zsa.rules

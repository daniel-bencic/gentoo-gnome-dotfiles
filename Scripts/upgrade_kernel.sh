#!/bin/bash
if [ $(id -u) -ne 0 ]; then
        1>&2 echo "Script must be run as root user."
        exit 1
fi

if [ ! -d "/usr/src/linux-$1" ]; then
        1>&2 echo "Kernel sources ($1) not found."
        exit 1
fi

CURRENT_KERNEL=$(uname -r)

echo "Upgrading kernel $CURRENT_KERNEL -> $1."

ln -sfT /usr/src/linux-$1 /usr/src/linux
cp /usr/src/linux-$CURRENT_KERNEL/.config /home/me/kernel-config-$CURRENT_KERNEL
cp /usr/src/linux-$CURRENT_KERNEL/.config /usr/src/linux/.config
cd /usr/src/linux
make olddefconfig

mount $(fdisk -l | grep -Po "/dev/\S*(?=\s.*EFI System)") /boot
make -j$(($(nproc) + 1))
make modules_install
make install

cp /boot/vmlinuz-$1 /boot/efi/boot/bootx64.efi
OLD_BOOT_ENTRY=$(efibootmgr -v | grep -Po "(?<=Boot)\d{4}(?=[*]\sGentoo)")
efibootmgr -c -d /dev/nvme0n1 -p 1 -L "Gentoo" -l '\efi\boot\bootx64.efi'
efibootmgr -b $OLD_BOOT_ENTRY -B

emerge @module-rebuild

rm -r /usr/src/linux-$CURRENT_KERNEL
rm -r /lib/modules/$CURRENT_KERNEL
rm /boot/vmlinuz-$CURRENT_KERNEL
rm /boot/System.map-$CURRENT_KERNEL
rm /boot/config-$CURRENT_KERNEL

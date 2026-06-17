#!/bin/bash

set -e

confirm_and_continue() {
    echo "--------------------------------------------------"
    read -p "Did the process complete successfully? Do you want to continue? (y/n): " response
    case "$response" in
        [Yy]* )
            echo "Great! Moving on to the next step..."
            echo "--------------------------------------------------"
            ;;
        [Nn]* )
            echo "Process aborted by user. Exiting script."
            exit 1
            ;;
        * )
            echo "Invalid selection. Please enter 'y' or 'n'."
            confirm_and_continue # Re-asks the question if an invalid key is pressed
            ;;
    esac
}


echo "----------------------------------------"
echo "Please run 'sudo su' before starting this script."
echo "----------------------------------------"




confirm_and_continue



# Set the system hostname
echo "debian" > /etc/hostname

# Configure /etc/hosts
cat > /etc/hosts << EOF
127.0.0.1       localhost
127.0.1.1       $(cat /etc/hostname)

::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
EOF

# Set the timezone (adjust to your region)
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime


# Install and configure locales
apt install -y locales
dpkg-reconfigure

timedatectl





confirm_and_continue






# Configure APT sources for Debian 13 (Trixie)
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian trixie main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware
EOF

# Update package lists
apt update

# Install kernel, system tools, and essential utilities
apt install -y linux-image-amd64 linux-headers-amd64 \
    firmware-linux firmware-linux-nonfree \
    grub-efi-amd64 efibootmgr network-manager \
    btrfs-progs sudo vim bash-completion






confirm_and_continue





# Prepare swap file
truncate -s 0 /var/swap/swapfile
chattr +C /var/swap/swapfile                     # Disable COW
btrfs property set /var/swap compression none    # Disable compression

# My system has 4 GB RAM, so I create 6 GB swap for hibernation (1.5× of RAM)
dd if=/dev/zero of=/var/swap/swapfile bs=1M count=6144 status=progress
chmod 600 /var/swap/swapfile
mkswap -L SWAP /var/swap/swapfile

# Add swap to fstab and enable it
echo "/var/swap/swapfile none swap defaults 0 0" >> /etc/fstab
swapon /var/swap/swapfile
swapon -v

# Configure GRUB for hibernation
SWAP_OFFSET=$(btrfs inspect-internal map-swapfile -r /var/swap/swapfile)
BTRFS_UUID=$(blkid -s UUID -o value ${DISK}2)
GRUB_CMD="quiet resume=UUID=$BTRFS_UUID resume_offset=$SWAP_OFFSET"
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"$GRUB_CMD\"" >> /etc/default/grub

# Update GRUB configuration with new kernel parameters
update-grub

# Configure initramfs for hibernation (using swap file)
cat > /etc/initramfs-tools/conf.d/resume << EOF
RESUME=/var/swap/swapfile
RESUME_OFFSET=$SWAP_OFFSET
EOF

# Update initramfs to include hibernation support
update-initramfs -u -k all




confirm_and_continue



# Create a new user (replace with your username and name)
useradd -m -G sudo,adm -s /bin/bash -c "aaron" swartz

# Set the user password
passwd swartz

# Verify the user creation
id swartz




confirm_and_continue




# Install GRUB for UEFI
grub-install \
  --target=x86_64-efi \
  --efi-directory=/boot/efi \
  --bootloader-id=debian \
  --recheck

# Generate GRUB configuration
update-grub



confirm_and_continue



exit




confirm_and_continue



# Unmount all mounted directories
umount -vR /mnt

# Reboot into the installed system
reboot

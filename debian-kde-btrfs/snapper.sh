#!/bin/sh


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



# Create a subvolume for .mozilla
btrfs subvolume create ~/.mozilla

# Verify the subvolume has been created
sudo btrfs subvolume list /




confirm_and_continue # Re-asks the question if an invalid key is pressed




# Install Snapper and required tools
sudo apt install -y snapper btrfs-assistant inotify-tools git make

# Create Snapper config for root (@) and home (@home) subvolumes
sudo snapper -c root create-config /
sudo snapper -c home create-config /home

# Grant user access and synchronize ACLs
sudo snapper -c root set-config ALLOW_USERS=$USER SYNC_ACL=yes
sudo snapper -c home set-config ALLOW_USERS=$USER SYNC_ACL=yes

# List available Snapper configs
sudo snapper list-configs

# Show current settings for root and home
snapper -c root get-config
snapper -c home get-config

# List snapshots for root and home
snapper ls
snapper -c home ls







confirm_and_continue # Re-asks the question if an invalid key is pressed




cd /tmp


# Clone the GRUB-Btrfs repository from GitHub
git clone https://github.com/Antynea/grub-btrfs.git
cd grub-btrfs

# Edit the configuration to set kernel parameters for snapshots
sed -i.bkp \
  '/^#GRUB_BTRFS_SNAPSHOT_KERNEL_PARAMETERS=/a \
GRUB_BTRFS_SNAPSHOT_KERNEL_PARAMETERS="rd.live.overlay.overlayfs=1"' \
  config

# Install GRUB-Btrfs
sudo make install

# Enable and start the GRUB-Btrfs daemon to update
# GRUB automatically when snapshots are created
sudo systemctl enable --now grub-btrfsd.service



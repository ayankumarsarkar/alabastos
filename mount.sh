blkid
read -p "Would you like to mount a partition?" partition
echo "Mounting $partition..."
MOUNT_POINT="/mnt/$partition"
mkdir -p $MOUNT_POINT
mount /dev/$partition $MOUNT_POINT
unset MOUNT_POINT
echo "Done."
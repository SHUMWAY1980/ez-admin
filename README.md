# 🛠️ ez-admin

## 📚 Overview

`ez-admin` is a powerful utility designed to bypass Windows authentication and establish a secondary account with administrative privileges. This tool is intended for responsible and ethical use.

## 📦 Prerequisites

Before you begin, ensure you have the following:

- A USB stick
- [Alpine Standard x86_64 ISO](https://alpinelinux.org/downloads/)
- [Rufus](https://github.com/pbatard/rufus/releases/latest)

## 🚀 Setup

Follow these steps to set up `ez-admin`:

1. Insert your USB stick.
2. Launch Rufus.
3. In Rufus, select your USB stick as the device.
4. Click "SELECT" and navigate to the downloaded `alpine-standard-x86_64.iso`.
5. Click "START".
6. Choose "Write in ISO image mode" and click "OK".
7. Once the process completes, exit Rufus.
8. Download and extract this repository.
9. Navigate to the Alpine USB in the explorer.
10. Transfer `ez-admin.sh` and `install-apks.sh` from the extracted repository to the USB.
11. Also, move the `apks` directory from the repository to the USB.
12. Safely eject the USB.

## 💻 Usage

To use `ez-admin`, follow these steps:

1. Connect the USB to the target Windows machine.
2. Restart the machine and repeatedly press the boot manager key (usually F12).
3. Boot from the Alpine USB and wait for it to load.
4. When prompted for login, enter "root".
5. Execute the following commands:
    ```bash
    cd /media/usb
    chmod +x *.sh
    ./install-apks.sh
    ./ez-admin.sh
    ```
6. Follow the on-screen instructions and enter the correct partition (usually "/dev/sda3").
7. After seeing the "Done!" message, power off the machine using the "poweroff" command and remove the USB.
8. Boot into Windows as usual.
9. Navigate to the existing user account.
10. Click the accessibility icon to open a terminal with admin rights.
11. Use "ez-add-user.bat" to create a new "Admin" account with the password "1234".

## 🧹 Additional Commands

- To delete the user, use "ez-remove-user.bat".
- To revert all changes, use "ez-restore.bat".

## ⚠️ Disclaimer

`ez-admin` is intended for educational purposes only. Any misuse can result in criminal charges. The authors are not responsible for any damage caused by the misuse of this tool.

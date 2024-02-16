# SSH Public Key Automation Script

## Overview
This PowerShell script automates the process of adding your SSH public key to the `authorized_keys` file on your Raspberry Pi, enabling passwordless SSH login.

## Prerequisites
- Windows operating system with PowerShell
- SSH key pair generated on your Windows machine

## Usage
1. Ensure that you have generated an SSH key pair on your Windows machine. If not, the script will prompt you to generate SSH keys.
2. Download or copy the `add_ssh_key.ps1` script to your local machine.
3. Run PowerShell as an administrator.
4. Navigate to the directory containing the `add_ssh_key.ps1` script.
5. Execute the script by running `.\add_ssh_key.ps1` in PowerShell.
6. Follow the prompts to enter your Raspberry Pi username and IP address.
7. The script will automatically add your SSH public key to the `authorized_keys` file on your Raspberry Pi.

## Script Details
- The script checks if SSH keys are generated on your Windows machine. If not, it prompts you to generate SSH keys using the `ssh-keygen` command.
- Once SSH keys are generated or if they were already present, the script prompts for your Raspberry Pi username and IP address.
- It then SSHs into your Raspberry Pi and appends the SSH public key to the `authorized_keys` file.

## Note
- Ensure that SSH is enabled on your Raspberry Pi and that you have network connectivity to it.
- This script assumes that you are using the default SSH key pair location (`$env:USERPROFILE\.ssh\id_rsa.pub`). If your SSH keys are stored elsewhere, modify the script accordingly.

## Author
- [Q8HK](https://github.com/Q8HK)

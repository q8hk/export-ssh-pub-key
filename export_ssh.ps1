# Check if SSH keys are generated
$publicKeyPath = "$env:USERPROFILE\.ssh\id_rsa.pub"
if (-not (Test-Path $publicKeyPath)) {
    Write-Host "SSH keys not found. You need to generate SSH keys first."

    # Prompt user to generate SSH keys
    $generateKeys = Read-Host "Do you want to generate SSH keys now? (y/n)"
    if ($generateKeys.ToLower() -eq "y") {
        # Execute ssh-keygen command
        Write-Host "Generating SSH keys..."
        ssh-keygen -t rsa
    } else {
        Write-Host "SSH keys are required for this script to work. Exiting."
        exit
    }
}

# Prompt for Raspberry Pi username and IP address
$piUsername = Read-Host "Enter your Raspberry Pi username"
$piIpAddress = Read-Host "Enter your Raspberry Pi IP address"

# Get the contents of the public key file
$publicKey = Get-Content $publicKeyPath

# SSH into Raspberry Pi and append public key to authorized_keys file
$sshCommand = "ssh $piUsername@$piIpAddress 'mkdir -p ~/.ssh && echo $publicKey >> ~/.ssh/authorized_keys'"
Invoke-Expression $sshCommand

Write-Host "SSH public key added to authorized_keys file on Raspberry Pi."


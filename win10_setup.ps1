# Enable WSL2
Write-Host "Turn on WSL2..."
try {
    wsl --set-default-version 2 -ErrorAction Stop
    Write-Host "WSL2 was set as the default version successfully."
} catch {
    Write-Warning "An error occurred while setting WSL2 as the default version:"
    Write-Warning $_.Exception.Message
}

# Check if Ubuntu 22.04 LTS is installed
Write-Host "Check if Ubuntu 22.04 LTS is installed..."
$UbuntuCheck = wsl.exe -l -q | Select-String "Ubuntu-22.04"
if (-not $UbuntuCheck) {
    Write-Host "Ubuntu 22.04 LTS doesn't exist. Install Ubuntu 22.04 LTS..."
    Try {
        wsl.exe --install -d Ubuntu-22.04 -ErrorAction Stop
        Write-Host "Ubuntu 22.04 LTS installed successfully."
    } catch {
        Write-Warning "An error occurred while installing Ubuntu 22.04 LTS:"
        Write-Warning $_.Exception.Message
    }
}

# Run commands within WSL2 Ubuntu
wsl -d Ubuntu-22.04 bash -c

## Update and upgrade packages
sudo apt update && sudo apt upgrade -y

## Install Docker
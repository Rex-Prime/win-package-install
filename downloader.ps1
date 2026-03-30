# Self-elevate script to run as admin
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    exit
}

ECHO "Installing Programs..."

# Browsers

ECHO "Configuring chocolatey..."

choco feature enable -n allowGlobalConfirmation

choco install librewolf
choco install discord
choco install tor-browser
choco install joplin
choco install qbittorrent
choco install sumatrapdf
choco install processhacker
choco install jdownloader
choco install 7zip
choco install thunderbird
choco install vlc
choc install imageglass

choco feature disable -n allowGlobalConfirmation

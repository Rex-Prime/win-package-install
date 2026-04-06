# Self-elevate script to run as admin
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    exit
}

ECHO "Installing Programs..."

ECHO "Configuring chocolatey..."

# Choco

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing Chocolatey..." -ForegroundColor Yellow

    # Install Choco <3
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

choco feature enable -n allowGlobalConfirmation

choco install librewolf
choco install discord
choco install tor-browser
choco install joplin
choco install qbittorrent
choco install sumatrapdf
choco install processhacker
choco install 7zip
choco install thunderbird
choco install vlc
choco install imageglass
choco install wiztree

choco install spotify
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -DisableStartup -podcasts_off -block_update_on -new_theme -adsections_off -no_shortcut -lyrics_stat Spotify"

choco feature disable -n allowGlobalConfirmation


# Winget

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget not available, skipping..." -ForegroundColor Yellow
} else {
    winget install ludusavi
}

# Scoop

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Scoop is not installed" -ForegroundColor Yellow
    Write-Host "Installing Scoop..." -ForegroundColor Green

    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

scoop install restic
scoop install rclone
scoop install yt-dlp

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
choco install 7zip
choco install thunderbird
choco install vlc
choc install imageglass

choco install spotify
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -DisableStartup -podcasts_off -block_update_on -new_theme -adsections_off -no_shortcut -lyrics_stat Spotify"

choco feature disable -n allowGlobalConfirmation

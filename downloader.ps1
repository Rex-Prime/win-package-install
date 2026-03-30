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

choco feature disable -n allowGlobalConfirmation

"Install Chocolatey and packages..." >> c:\intune.log
# Install Chocolatey
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Chocolatey packages
choco install -y git
choco install -y starship
choco install -y volta
choco install -y cascadia-code-nerd-font
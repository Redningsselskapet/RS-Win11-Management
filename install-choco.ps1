"Install Chocolatey and standard packages..." >> c:\intune.log
# Install Chocolatey
if (-not(Get-Command choco -ErrorAction SilentlyContinue)) {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Chocolatey packages
choco install -y starship
choco install -y cascadia-code-nerd-font
choco install -y gsudo

" - Done." >> c:\intune.log
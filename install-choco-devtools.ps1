"Install Chocolatey and devtools packages..." >> c:\intune.log
# Install Chocolatey
if (-not(Get-Command choco -ErrorAction SilentlyContinue)) {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Chocolatey packages
choco install -y git
choco install -y volta
choco install -y vscode
choco install -y kubernetes-cli
choco install -y kubectx
choco install -y kubens
choco install -y k9s
choco install -y azure-cli
choco install -y lens
choco install -y gitkraken

" - Done." >> c:\intune.log
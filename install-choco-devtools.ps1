"Install Chocolatey and devtools packages..." >> c:\intune.log
# Install Chocolatey
if (-not(Get-Command choco -ErrorAction SilentlyContinue)) {
    "Installing choco.."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Chocolatey packages
choco install -y git >> c:\intune.log
choco install -y volta >> c:\intune.log
choco install -y vscode >> c:\intune.log
choco install -y kubernetes-cli >> c:\intune.log
choco install -y kubectx >> c:\intune.log
choco install -y kubens >> c:\intune.log
choco install -y k9s >> c:\intune.log
choco install -y azure-cli >> c:\intune.log
choco install -y lens >> c:\intune.log
choco install -y gitkraken >> c:\intune.log

" - Done." >> c:\intune.log
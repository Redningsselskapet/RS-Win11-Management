Write-Host "Install Chocolatey and devtools packages..." >> c:\intune.log
# Install Chocolatey
if (-not(Get-Command choco -ErrorAction SilentlyContinue)) {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) 
}

# Install Chocolatey packages
Write-Host -NoNewline " - Installing git..." >> c:\intune.log
choco install -y git
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing volta..." >> c:\intune.log
choco install -y volta 
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing vscode..." >> c:\intune.log
choco install -y vscode 
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing kubernetes-cli..." >> c:\intune.log
choco install -y kubernetes-cli 
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing kubectx..." >> c:\intune.log
choco install -y kubectx
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing kubens..." >> c:\intune.log
choco install -y kubens 
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing k9s..." >> c:\intune.log
choco install -y k9s
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing azure-cli..." >> c:\intune.log
choco install -y azure-cli 
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing lens..." >> c:\intune.log
choco install -y lens
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing gitkraken..." >> c:\intune.log
choco install -y gitkraken
Write-Host "Done" >> c:\intune.log

Write-Host "Done" >> c:\intune.log
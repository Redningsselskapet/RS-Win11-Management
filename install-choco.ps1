Write-Host "Install Chocolatey and standard packages..." >> c:\intune.log
# Install Chocolatey
if (-not(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host -NoNewline " - Installing starship..."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Write-Host "Done"
}

# Install Chocolatey packages
Write-Host -NoNewline " - Installing starship..." >> c:\intune.log
choco install -y starship
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - cascadia-code-nerd-font..." >> c:\intune.log
choco install -y cascadia-code-nerd-font
Write-Host "Done" >> c:\intune.log

Write-Host -NoNewline " - Installing gsudo..." >> c:\intune.log
choco install -y gsudo
Write-Host "Done" >> c:\intune.log

Write-Host "Done." >> c:\intune.log


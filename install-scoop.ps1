if (-not(Get-Command scoop)) {
  Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
}
scoop update
scoop install git

scoop install starship
scoop install volta

scoop bucket add nerd-fonts
scoop install --global scoop install CascadiaCode-NF-Mono 

# Caution: This will overwrite your existing Windows Terminal settings
# Invoke-RestMethod -Uri https://raw.githubusercontent.com/Redningsselskapet/RS-Win11-Management/master/settings.json -OutFile $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json


if (-not(Test-Path $profile)) {
  New-Item -Path $profile -ItemType File -Force
  Add-Content $profile -Value "# Generated by install-scoop.ps1"
}

if ((Get-Content $profile -Raw).Length -eq 0) {
  Add-Content $profile -Value "Generated by install-scoop.ps1"
}

if(-not((Get-Content $profile -Raw).Contains("Invoke-Expression (&starship init powershell)"))) {
  Write-Host "Adding Starship to PowerShell profile"
  Add-Content $profile -Value "`n# Load Starship prompt"
  Add-Content $profile -Value "Invoke-Expression (&starship init powershell)"
}

if (-not((Get-Content $profile -Raw).Contains("(& volta completions powershell) | Out-String | Invoke-Expression"))) {
  Write-Host "Adding Volta completions to PowerShell profile"
  Add-Content $profile -Value "`n# Volta completions"
  Add-Content $profile -Value "(& volta completions powershell) | Out-String | Invoke-Expression"
}

# This only applies to PowerShell 7 and later
if (-not((Get-Content $profile -Raw).Contains("`$PSStyle.FileInfo.Directory = `"``e[34m`""))) {
  Write-Host "Adding PSStyle to PowerShell profile"
  Add-Content $profile -Value "`n# Fix background color for directory names in PowerShell 7"
  Add-Content $profile -Value "if (`$Host.Version.Major -ge 7) {`$PSStyle.FileInfo.Directory = `"``e[34m`"}"
}

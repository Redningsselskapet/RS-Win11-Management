"Installing PowerShell profiles..." >> c:\intune.log

# Caution: This will overwrite your existing Windows Terminal settings
# Genereate a new settings.json file with the following command:
# Invoke-RestMethod -Uri https://raw.githubusercontent.com/Redningsselskapet/RS-Win11-Management/master/settings.json -OutFile (New-Item -Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Force) 

$PS_profile = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

if (-not(Test-Path $PS_profile)) {
    New-Item -Path $PS_profile -ItemType File -Force
    Add-Content $PS_profile -Value "# Generated by install-choco.ps1"
  }
  
  if ((Get-Content $PS_profile -Raw).Length -eq 0) {
    Add-Content $PS_profile -Value "Generated by install-choco.ps1"
  }
  
  if(-not((Get-Content $PS_profile -Raw).Contains("Invoke-Expression (&starship init powershell)"))) {
    Write-Host "Adding Starship to PowerShell profile"
    Add-Content $PS_profile -Value "`n# Load Starship prompt"
    Add-Content $PS_profile -Value "Invoke-Expression (&starship init powershell)"
  }
  
  if (-not((Get-Content $PS_profile -Raw).Contains("(& volta completions powershell) | Out-String | Invoke-Expression"))) {
    Write-Host "Adding Volta completions to PowerShell profile"
    Add-Content $PS_profile -Value "`n# Volta completions"
    Add-Content $PS_profile -Value "(& volta completions powershell) | Out-String | Invoke-Expression"
  }
  
  # This only applies to PowerShell 7 and later
  if (-not((Get-Content $PS_profile -Raw).Contains("`$PSStyle.FileInfo.Directory = `"``e[34m`""))) {
    Write-Host "Adding PSStyle to PowerShell profile"
    Add-Content $PS_profile -Value "`n# Fix background color for directory names in PowerShell 7"
    Add-Content $PS_profile -Value "if (`$Host.Version.Major -ge 7) {`$PSStyle.FileInfo.Directory = `"``e[34m`"}"
  }
  
  $PS_profile = "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

  if (-not(Test-Path $PS_profile)) {
    New-Item -Path $PS_profile -ItemType File -Force
    Add-Content $PS_profile -Value "# Generated by install-choco.ps1"
  }
  
  if ((Get-Content $PS_profile -Raw).Length -eq 0) {
    Add-Content $PS_profile -Value "Generated by install-choco.ps1"
  }
  
  if(-not((Get-Content $PS_profile -Raw).Contains("Invoke-Expression (&starship init powershell)"))) {
    Write-Host "Adding Starship to PowerShell profile"
    Add-Content $PS_profile -Value "`n# Load Starship prompt"
    Add-Content $PS_profile -Value "Invoke-Expression (&starship init powershell)"
  }
  
  if (-not((Get-Content $PS_profile -Raw).Contains("(& volta completions powershell) | Out-String | Invoke-Expression"))) {
    Write-Host "Adding Volta completions to PowerShell profile"
    Add-Content $PS_profile -Value "`n# Volta completions"
    Add-Content $PS_profile -Value "(& volta completions powershell) | Out-String | Invoke-Expression"
  }
  
  # This only applies to PowerShell 7 and later
  if (-not((Get-Content $PS_profile -Raw).Contains("`$PSStyle.FileInfo.Directory = `"``e[34m`""))) {
    Write-Host "Adding PSStyle to PowerShell profile"
    Add-Content $PS_profile -Value "`n# Fix background color for directory names in PowerShell 7"
    Add-Content $PS_profile -Value "if (`$Host.Version.Major -ge 7) {`$PSStyle.FileInfo.Directory = `"``e[34m`"}"
  }
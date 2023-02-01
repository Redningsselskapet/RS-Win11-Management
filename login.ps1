# Login Script

"Running Redningsselskapet Login Script..."

# Set the default location for the log file
$logPath = "$env:SYSTEMDISK\Windows\Temp\login.log"

# Update Scoop packages
Write-Information "Updating Scoop packages..." >> $logPath
if (Get-Command scoop -ErrorAction SilentlyContinue) { scoop update * >> $logPath }

# Checking for elevated permissions. If not, break.
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Insufficient permissions to run this part of login script. You are probably not the administrator of this PC." >> $logPath;
    Break
}
else {
    Write-Host "Elevated permissions detected. Continuing..." -ForegroundColor Green >> $logPath;
    # Update Chocolatey Packages
    Write-Information "Updating Chocolatey packages..." >> $logPath
    if (Get-Command choco -ErrorAction SilentlyContinue) { choco upgrade -y all >> $logPath }
}


# Remove always on vpn connections
Write-Information "Checking VPN connections configuration" >> $logPath
try {
    Get-VpnConnection -ErrorAction stop
} catch {
    Write-Warning "Remove faulty vpn configuration" >> $logPath
    rasdial /disconnect >> $logPath
    Remove-VpnConnection -Name "RS AlwaysOn VPN" -Force
}   



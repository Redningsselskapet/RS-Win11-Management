$logFile = "c:\intune.log"
$scriptName = $MyInvocation.MyCommand.Name
$packages = @("starship", "cascadia-code-nerd-font", "gsudo");

function log {
    param($message)
    $msg = "{0} {1}" -f (Get-TimeStamp), "$message ($scriptName)"
    Write-Output $msg | Out-File $logFile -Append
    Write-Host $msg 
}

function Get-TimeStamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
}

function packageInstall {
    param($package)
    if (packageExists $package) {
        log "$package is already installed"
    }
    else {
        log "Start installing $package..."
        choco install $package -y --no-progress
        log "Installed $package successfully!"
    }
}
function packageExists {
    param($package)
    try {
        $installed = choco list --local-only | Select-String $package
    }
    catch {
        Write-Host "Failed to check if $package is installed" -ForegroundColor Red
        Write-Host $_ -ForegroundColor Red
        return
    }
    if ($installed) {
        return $true
    }
    else {
        return $false
    }
}

# Set Chocolatey path
$env:Path = "$env:Path;C:\ProgramData\chocolatey\bin"

# Install Chocolatey if not already installed
if (Get-Command choco -ErrorAction SilentlyContinue) {
    log "Chocolatey is already installed"
}
else {
    log "Installing Chocolatey... " 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    log "Chocolatey installed successfully!"
}

foreach ($package in $packages) {
    try {
        packageInstall $package
    }
    catch {
        log "Failed to install $package"
        log $_
    }
}
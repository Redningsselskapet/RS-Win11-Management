# Login Script

"Running Redningsselskapet Login Script..." > c:\rs-login.log

# Update Scoop
if (Get-Command scoop -ErrorAction SilentlyContinue) { scoop update * >> c:\rs-login.log }

if (Get-Command choco -ErrorAction SilentlyContinue) { choco upgrade -y all >> c:\rs-login.log }

# Download TeamViewer QuickSupport
if (-not (Test-Path -Path "C:\Program Files (x86)\TeamViewer\TeamViewerQS.exe")) {
    "Downloading TeamViewer QuickSupport..." >> c:\rs-login.log
    $tvUrl = "https://get.teamviewer.com/6u3kbmg"
    $tvPath = "C:\Program Files (x86)\TeamViewer\TeamViewerQS.exe"
    Invoke-RestMethod $tvUrl -OutFile $tvPath
    " - Done." >> c:\rs-login.log
}
# Login Script

Write-Host "Running Redningsselskapet Login Script..."

# Update Scoop
if (Get-Command scoop -ErrorAction SilentlyContinue) { scoop update * }

if (Get-Command scoop -ErrorAction SilentlyContinue) { choco upgrade -y all }

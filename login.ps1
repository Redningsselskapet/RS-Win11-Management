# Login Script

"Running Redningsselskapet Login Script..." > c:\rs-login.log

# Update Scoop
if (Get-Command scoop -ErrorAction SilentlyContinue) { scoop update * >> c:\rs-login.log }

if (Get-Command choco -ErrorAction SilentlyContinue) { choco upgrade -y all >> c:\rs-login.log }


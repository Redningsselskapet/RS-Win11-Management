$pathFelles = "\\15hovfil01.nssr.local\felles$"
$pathHome = "\\15hovfil01.nssr.local\home$\$env:username"

$scriptUrl = "https://raw.githubusercontent.com/Redningsselskapet/RS-Win11-Management/master/map-network-drives.ps1"
$scriptPath = "c:\Users\$env:UserName\map-network-drives.ps1"


function mapNetworkDrive([string]$Name, [string]$Path) {

    $MappedDrive = (Get-PSDrive -Name $Name -ErrorAction SilentlyContinue)

    #Check if drive is already mapped
    if ($MappedDrive) {
        #Drive is mapped. Check to see if it mapped to the correct path
        if ($MappedDrive.DisplayRoot -ne $Path) {
            # Drive Mapped to the incorrect path. Remove and readd:
            Remove-PSDrive -Name $Name
            New-PSDrive -Name $Name -Root $Path -Persist -PSProvider "FileSystem" -Scope Global
        }
    }
    else {
        #Drive is not mapped
        New-PSDrive -Name $Name -Root $Path -Persist -PSProvider "FileSystem" -Scope Global
    }
}


$scriptExist = Test-Path -Path $scriptPath -PathType Leaf
if (-not($scriptExist)) {
    Invoke-RestMethod $scriptUrl -OutFile $scriptPath
}
mapNetworkDrive -Name "U" -Path $pathFelles
mapNetworkDrive -Name "Z" -Path $pathHome



$pathFelles = "\\15hovfil01.nssr.local\felles$"
$pathHome = "\\15hovfil01.nssr.local\home$\$env:username"

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

mapNetworkDrive -Name "U" -Path $pathFelles
mapNetworkDrive -Name "Z" -Path $pathHome






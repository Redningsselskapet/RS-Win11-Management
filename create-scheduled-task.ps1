$scriptUrl = "https://raw.githubusercontent.com/Redningsselskapet/RS-Win11-Management/master/map-network-drives.ps1"
$scriptPath = "c:\map-network-drives.ps1"

# Consider force overwrite to push changes to script
$scriptExist = Test-Path -Path $scriptPath -PathType Leaf
if (-not($scriptExist)) {
    Invoke-RestMethod $scriptUrl -OutFile $scriptPath
}

$taskPath = "\Redningsselskapet\"
$taskName = "Map Network Drives"
$delay = New-TimeSpan -Seconds 30
$trigger = New-ScheduledTaskTrigger -AtLogon -RandomDelay $delay
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass $scriptPath"
$task = Get-ScheduledTask -TaskName $taskName -TaskPath $taskPath -ErrorAction SilentlyContinue -OutVariable task
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administratorer" -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries 

if (-not($task)) {
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath $taskPath -TaskName $taskName -Description "Maps Local Network Drives"
}


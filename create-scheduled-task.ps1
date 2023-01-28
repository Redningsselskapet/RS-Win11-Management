$scriptUrl = "https://raw.githubusercontent.com/Redningsselskapet/RS-Win11-Management/master/login.ps1"
$scriptPath = "c:\login.ps1"

$scriptExist = Test-Path -Path $scriptPath -PathType Leaf
Invoke-RestMethod $scriptUrl -OutFile $scriptPath

$taskPath = "\Redningsselskapet\"
$taskName = "Map Network Drives"
$delay = New-TimeSpan -Seconds 30
$trigger = New-ScheduledTaskTrigger -AtLogon -RandomDelay $delay 
$trigger.Delay = "PT30S"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass $scriptPath"
$task = Get-ScheduledTask -TaskName $taskName -TaskPath $taskPath -ErrorAction SilentlyContinue -OutVariable task
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Brukere"

if (-not($task)) {
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath $taskPath -TaskName $taskName -Description "Maps Local Network Drives" -Settings $settings -Principal $principal
}


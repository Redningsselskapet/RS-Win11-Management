"Removing Personal Teams..." >> c:\intune.log
If ($null -eq (Get-AppxPackage -Name MicrosoftTeams -AllUsers)) {
    Write-Output “Microsoft Teams Personal App not present” >> c:\intune.log
}
Else {
    Try {
        Write-Output “Removing Microsoft Teams Personal App”
        If (Get-Process msteams -ErrorAction SilentlyContinue) {
            Try {
                Write-Output “Stopping Microsoft Teams Personal app process” >> c:\intune.log
                Stop-Process msteams -Force
                Write-Output “Stopped” >> c:\intune.log
            }
            catch {
                Write-Output “Unable to stop process, trying to remove anyway” >> c:\intune.log
            }
           
        }
        Get-AppxPackage -Name MicrosoftTeams -AllUsers | Remove-AppPackage -AllUsers
        Write-Output “Microsoft Teams Personal App removed successfully” >> c:\intune.log
    }
    catch {
        Write-Error “Error removing Microsoft Teams Personal App” >> c:\intune.log
    }
}

" - Done." >> c:\intune.log
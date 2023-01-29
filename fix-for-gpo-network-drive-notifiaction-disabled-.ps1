# Fix: Disabling the user notification for drive connection failures
# In my experience of testing this I have seen the notification appear even when this setting is disabled, it does not appear to be that consistent.
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\NetworkProvider -Name RestoreConnection -PropertyType DWord -Value 0 -Force


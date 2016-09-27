# ps-pomodoro
Simple Pomodoro in PowerShell

### During execution:

![Running script](https://raw.githubusercontent.com/maxlorenz/ps-pomodoro/master/Screenshots/running.PNG)

### Notification:

![Notification](https://raw.githubusercontent.com/maxlorenz/ps-pomodoro/master/Screenshots/notification.PNG)

## Usage
Simply use
```powershell
Start-Pomodoro
```
to start a timer for 25 minutes, or
```powershell
Start-Pomodoro -Minutes 5
```
to specify the time.

## Integrate into `Profile`
For convenience, add the `pm.ps1` content to your ```$PROFILE``` and add an alias.

```powershell
MyEditor $PROFILE
```
```powershell
# Microsoft.PowerShell_profile.ps1
Function Show-Notification
{
    ...
}

Function Start-Pomodoro
{
    ...
}

New-Alias -Name pm -Value Start-Pomodoro
```

From now on, you can start your pomodoros with

```powershell
pm
```

function Show-Notification {
    Param ( [string]$Message = "Notification", [string]$Title = "Title" )

    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")     
    Remove-Event BalloonClicked_event -ea SilentlyContinue
    Unregister-Event -SourceIdentifier BalloonClicked_event -ea silentlycontinue
    Remove-Event BalloonClosed_event -ea SilentlyContinue
    Unregister-Event -SourceIdentifier BalloonClosed_event -ea silentlycontinue

    $notification = New-Object System.Windows.Forms.NotifyIcon
    $notification.Icon = [System.Drawing.SystemIcons]::Information
    $notification.BalloonTipIcon = "Info"
    $notification.BalloonTipTitle = $Title
    $notification.BalloonTipText = $Message
    $notification.Visible = $True

    $notification.ShowBalloonTip(600) 
}

Function Start-Pomodoro {
    <#
        .SYNOPSIS
        Simple Pomodoro Timer
        .EXAMPLE
        Start-Pomodoro
        .EXAMPLE
        Start-Pomodoro 5
        .PARAMETER Minutes
        Time in Minutes. Default is 25
    #>

    Param (
        [int]$Minutes = 25
    )
 
    $seconds = $Minutes * 60
 
    for($i = $seconds; $i -gt 0; $i = $i - 1)
    {
        $percentComplete = 100 - (($i/$seconds) * 100)

        Write-Progress -SecondsRemaining $i `
                       -Activity "Timer" `
                       -Status "Time remaining:" `
                       -PercentComplete $percentComplete
                       
        Start-Sleep -Seconds 1
    }

    Show-Notification -Message "$Minutes minutes passed" -Title "Timer finished"
 }
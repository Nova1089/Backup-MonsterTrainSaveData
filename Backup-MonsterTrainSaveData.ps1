<#
Version 1.0

Backs up a folder to another folder. Can be scheduled with Windows task scheduler.
#> 

param (
    # Path to Monster Train app data folder. (C:\Users\Username\AppData\LocalLow\Shiny Shoe\MonsterTrain)
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$originfolder,
    # Path to backup folder (i.e., C:\Users\Username\Desktop\Games\Monster Train\Save Backups)
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$backupFolder
)

Write-Host "Backing up Monster Train save data..." -ForegroundColor "DarkCyan"
$timestamp = Get-Date -Format "yyyy-MM-dd-hh-mmtt"
$backupFolder = $backupFolder.TrimEnd('\', '/')
$destFolder = $backupFolder + "\$timeStamp\Monster Train"
Copy-Item -Path $originFolder -Destination $destFolder -Recurse
Write-Host "Finished!" -ForegroundColor "Green"
Start-Sleep -Seconds 3
Exit
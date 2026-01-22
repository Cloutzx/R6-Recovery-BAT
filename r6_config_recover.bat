@echo off
title R6 GameSettings.ini Recovery

echo Locating Rainbow Six Siege config folder...
set "R6DIR=%USERPROFILE%\Documents\My Games\Rainbow Six - Siege"

if not exist "%R6DIR%" (
    echo ERROR: R6 folder not found.
    pause
    exit
)

for /d %%G in ("%R6DIR%\*") do (
    set "CFGDIR=%%G"
)

set "BACKUPDIR=%USERPROFILE%\Documents\Siege Settings Recover"

if not exist "%BACKUPDIR%\GameSettings_backup.ini" (
    echo ❌ No backup found in "%BACKUPDIR%"
    pause
    exit
)

echo Restoring backup...
copy /Y "%BACKUPDIR%\GameSettings_backup.ini" "%CFGDIR%\GameSettings.ini"

echo ✅ Backup restored successfully!
pause
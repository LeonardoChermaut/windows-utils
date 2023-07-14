@echo off
echo Cleaning up junk system files, please wait...

REM Check if running with administrator privileges
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    GOTO :AdminMode
) ELSE (
    echo This script requires administrator privileges. Please provide your credentials.
    pause
    sudo "%~dp0%~nx0"
    exit /B
)

:AdminMode
set "folders=%systemdrive% %windir% %userprofile%"

for %%f in (%folders%) do (
    del /f /s /q "%%f\*.tmp"
    del /f /s /q "%%f\*._mp"
    del /f /s /q "%%f\*.log"
    del /f /s /q "%%f\*.gid"
    del /f /s /q "%%f\*.chk"
    del /f /s /q "%%f\*.old"
    del /f /s /q "%%f\recycled\*.*"
    del /f /s /q "%%f\*.bak"
    del /f /s /q "%%f\prefetch\*.*"
    rd /s /q "%%f\temp" & md "%%f\temp"
    del /f /q "%%f\cookies\*.*"
    del /f /q "%%f\recent\*.*"
    del /f /s /q "%%f\Local Settings\Temporary Internet Files\*.*"
    del /f /s /q "%%f\Local Settings\Temp\*.*"
    del /f /s /q "%%f\recent\*.*"
)

echo System junk cleaned up successfully!
echo. & pause
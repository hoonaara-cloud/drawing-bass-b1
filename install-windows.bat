@echo off
:: Installs the built VST3. Run as Administrator (right-click -> Run as administrator).
setlocal
set SRC=%~dp0build\DrawingBass_artefacts\Release\VST3\Drawing Bass.vst3
set DST=%COMMONPROGRAMFILES%\VST3\Drawing Bass.vst3

if not exist "%SRC%" (
    echo [ERROR] Build output not found:
    echo   %SRC%
    echo Run build-windows.bat first.
    exit /b 1
)

if exist "%DST%" rmdir /s /q "%DST%"
xcopy "%SRC%" "%DST%\" /E /I /Y >nul
if errorlevel 1 (
    echo [ERROR] Copy failed. Are you running as Administrator?
    exit /b 1
)

echo Installed to %DST%
echo Rescan plugins in your DAW and look for "Drawing Bass" by Hoonaar Audio.
endlocal

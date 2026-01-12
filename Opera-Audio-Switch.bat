@echo off
setlocal

::vars
set "TOOL_PATH=C:\svcl\svcl.exe"
set "APP_NAME=opera.exe"

set "SPEAKERS=Sound BlasterX Katana"
set "HEADPHONES=SteelSeries Arctis 1 Wireless"

set "STATE_FILE=%TEMP%\audio_toggle_flag.txt"

::check if flag file exists to determine current state of audio output
if exist "%STATE_FILE%" (
	goto :SwitchToHeadphones
) else (
	goto :SwitchToSpeakers
)

:SwitchToSpeakers
:: Switch to Device A (Speakers)
"%TOOL_PATH%" /SetAppDefault "%SPEAKERS%" all "%APP_NAME%"
echo Switched %APP_NAME% to use %SPEAKERS% for audio
:: Create temporary file so the script knows which device the audio is currently routing through
type nul > "%STATE_FILE%"
goto :End

:SwitchToHeadphones
:: Switch to Device B (Headphones)
"%TOOL_PATH%" /SetAppDefault "%HEADPHONES%" all "%APP_NAME%"
echo Switched %APP_NAME% to use %HEADPHONES% for audio
:: Delete temporary state file so the script knows which device the audio is currently routing through
del /F /Q "%STATE_FILE%"
goto :End

:End
:: Timeout (to see result before closing)
timeout /t 2 >nul
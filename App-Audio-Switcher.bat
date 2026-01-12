@echo off
setlocal

:: -- CONFIGURATION (DON'T SKIP THIS OR IT WILL NOT WORK) --

:: -- Path to your svcl executable file (svcl.exe) --
set "TOOL_PATH=C:\svcl\svcl.exe"

:: -- Filename of the app you want to switch the audio on (such as Chrome, Firefox, or perhaps a video game) --
set "APP_NAME=firefox.exe"


:: -- Exact names of your audio devices --
:: Find these by right clicking the speaker icon in your task tray and clicking "Open volume mixer".
:: You will see a list of devices such as "(Speakers) SteelSeries Arctis 1 Wireless".
:: Your device name is this but with the part in parentheses omitted. (e.g. "SteelSeries Arctis 1 Wireless")
set "SPEAKERS=Sound BlasterX Katana"
set "HEADPHONES=SteelSeries Arctis 1 Wireless"


:: -- Temporary file needed for the script to work (DON'T CHANGE THIS PART) -- 
set "STATE_FILE=%TEMP%\audio_toggle_flag.txt"

:: ------------
:: -- SCRIPT --

:: Check if flag file exists to determine current state of audio output
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
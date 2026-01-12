# Windows App Audio Switcher

A lightweight Windows batch script that creates a "one-click" toggle to switch audio output devices for specific applications.

Windows 10/11 allows you to set specific output devices for individual apps, but changing them requires navigating deep into the "App volume and device preferences" settings menu. I found the amount of clicks and switching to different windows to be very annoying, so I created this tool. This script automates the process, allowing you to switch a browser (or game) from Speakers to Headphones instantly.

## 🚀 Features

- **One-Click Toggling:** Switches between two defined audio devices instantly.
- **State Memory:** Uses a temporary flag file to remember which device was last active.
- **Permission Safe:** utilizing the `%TEMP%` directory ensures **no admin rights are needed to run the script**.
- **Customizable:** Easily adaptable for any application (Chrome, Spotify, Discord) or audio device.


## 🛠️ Prerequisites

This script relies on **Sound Volume Command Line (svcl)** by NirSoft, a lightweight console tool for controlling audio settings.

1. Download **Sound Volume Command Line** from [NirSoft](https://www.nirsoft.net/utils/sound_volume_command_line.html).
2. Extract the files to a permanent location (e.g., `C:\svcl\` or `C:\Tools\svcl\`).


## ⚙️ Configuration

Open the `.bat` file in any text editor (Notepad, VS Code) and update the configuration section at the top to match your system:

```batch
:: -- CONFIGURATION (DON'T SKIP THIS OR IT WILL NOT WORK) --

:: -- Path to your svcl executable file (svcl.exe) --
set "TOOL_PATH=C:\svcl\svcl.exe"

:: -- Filename of the app you want to switch the audio on. --
set "APP_NAME=opera.exe"


:: -- Exact names of your audio devices --
:: Find these by right clicking the speaker icon in your task tray and clicking "Open volume mixer".
:: You will see a list of devices such as "(Speakers) SteelSeries Arctis 1 Wireless".
:: Your device name is this but with the part in parentheses omitted. (e.g. "SteelSeries Arctis 1 Wireless")
set "SPEAKERS=Sound BlasterX Katana"
set "HEADPHONES=SteelSeries Arctis 1 Wireless"
```


## 📝 How It Works

The script checks for the existence of a temporary file (audio_toggle_flag.txt) in the Windows Temp folder.

If the file exists, the script assumes audio is currently on Speakers -> switches audio to Headphones -> deletes the file.

If the file does not exist, the script switches audio to Speakers -> creates the file.


## 🔍 Troubleshooting

**Audio Not Switching?**
If for some reason the script does not appear to be working, you may have the wrong device name. Try opening a terminal in the same directory as svcl.exe and running `svcl.exe /scomma ""`. You will see a whole bunch of device names, and should be able to find the correct names of your devices listed in there.


📄 License
This project is open-source. Feel free to modify and use it as needed. Sound Volume Command Line is property of NirSoft.

@echo off
if not "%cd%"=="%temp%" (
	copy /y "%~0" "%temp%\updator.bat"
	cd %temp%
	"%temp%\updator.bat" "%cd%"
)
cls
if exist Friends-N-Such-Mods-main.zip del /f /q Friends-N-Such-Mods-main.zip
if exist "Friends-N-Such-Mods-main\" rmdir /s /q "Friends-N-Such-Mods-main"
echo Configuring unzip tool . . .
if not exist "7za.exe" curl -LJO https://github.com/ITCMD/ITCMD-STORAGE/raw/master/7za.exe
echo Downloading latest modpack . . .
curl -LJO https://github.com/ITCMD/Friends-N-Such-Mods/archive/refs/heads/main.zip >nul
echo Unzipping . . .
7za.exe x Friends-N-Such-Mods-main.zip
echo Copying Files to %~1 . . .
XCOPY "Friends-N-Such-Mods-main\*" "%~1" /s /i /y


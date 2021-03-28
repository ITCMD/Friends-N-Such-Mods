@echo off
set ver=1.1
if not "%cd%"=="%temp%" (
	copy /y "%~0" "%temp%\updator.bat"
)
set cdt=%cd%
C:
cd %temp%
if not "%~0"=="%temp%\updator.bat" "%temp%\updator.bat" "%cdt%"
ping google.com -n 1 >nul
if not %errorlevel%==0 (
	echo [91mERROR: No internet connection.[90m
	echo Could not reach google.com.[0m
	pause
	exit
)
if exist ver.txt del /f /q "ver.txt"
curl -LJO https://github.com/ITCMD/Friends-N-Such-Mods/raw/main/ver.txt >nul
find "[%ver%]" "ver.txt" >nul
set uptodate=%errorlevel%
if exist "PingTest" del /f /q "PingTest"
curl -LJO https://github.com/ITCMD/Friends-N-Such-Mods/raw/main/PingTest >nul
find "[Success]" "PingTest" >nul
if not %errorlevel%==0 (
	echo [91mERROR: Download Failed for unknown reason. Contact Lucas.[90m
	echo PingTest to local Github File Failed.[0m
	pause
	exit
)
if "%uptodate%"=="0" (
	echo Friends-N-Such is up to date.
	goto :launch
)
echo Update Available:
type "ver.txt"
if exist Friends-N-Such-Mods-main.zip del /f /q Friends-N-Such-Mods-main.zip
if exist "Friends-N-Such-Mods-main\" rmdir /s /q "Friends-N-Such-Mods-main"
echo [96mConfiguring Unzip Tool . . .
if not exist "7za.exe" curl -LJO https://github.com/ITCMD/ITCMD-STORAGE/raw/master/7za.exe
echo [96mDownloading latest modpack . . .
curl -LJO https://github.com/ITCMD/Friends-N-Such-Mods/archive/refs/heads/main.zip >nul
echo [96mUnzipping . . .
7za.exe x Friends-N-Such-Mods-main.zip >nul
echo [96mCopying Files to %~1 . . .
XCOPY "Friends-N-Such-Mods-main\*" "%~1" /s /i /y
echo [96mCleaning up . . .
if exist Friends-N-Such-Mods-main.zip del /f /q Friends-N-Such-Mods-main.zip
if exist "Friends-N-Such-Mods-main\" rmdir /s /q "Friends-N-Such-Mods-main"
echo [92mDone!
:launch
del /f /q "ver.txt"
timeout /t 5 /nobreak
if exist "%~1\..\..\..\MultiMC.exe" (
	echo Launching . . .
	"%~1\..\..\..\MultiMC.exe" -l "Friends N Such"
	exit
)
echo You may now close this and launch Friends N Such!
pause
exit

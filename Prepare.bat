@echo off
echo Removing old mods from %~1\mods\
if exist "%~1\mods\*.jar" (
	echo Deleting old version of mods . . .
	del /f /q "%~1\mods\*.jar"
)
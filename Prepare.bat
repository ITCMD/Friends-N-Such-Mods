@echo off
if exist "mods\*.jar" (
	echo Deleting old version of optifine . . .
	del /f /q "mods\*.jar"
)
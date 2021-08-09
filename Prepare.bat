@echo off
if exist "mods\OptiFine_1.16.4*.jar" (
	echo Deleting old version of optifine . . .
	del /f /q "mods\OptiFine_1.16.4*.jar"
)
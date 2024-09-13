@echo off
set APP=RELOLADER
set AUTHOR=POMBO
set AVATAR=\Õ/
set MADE_BY=MADE BY:
set SPACE= 
set KEY=@2024
echo %APP%%SPACE%%MADE_BY%%SPACE%%SPACE%%AUTHOR%%SPACE%%SPACE%%AVATAR%%SPACE%%KEY%

echo.
echo: ******************** RELOLADER PBE ********************

echo.
echo Attention! This script only works for conventional installation of League of Legends in "C:\Riot Games\Riot Client\". If your Client is installed in another path or this path was changed in future updates, this script will not work correctly.

echo.
echo Attempting to close League of Legends PBE...

taskkill /f /im RiotClientServices.exe /t
if %errorlevel% neq 0 (
    echo Error
)

taskkill /f /im LeagueClient.exe /t
if %errorlevel% neq 0 (
    echo Error
)

echo.
echo Waiting to validate if League of Legends PBE has ended...

timeout /t 5 /nobreak

echo.
echo Searching for remaining executable processes...

taskkill /f /im RiotClientServices.exe /t
if %errorlevel% neq 0 (
    echo Error
)

taskkill /f /im LeagueClient.exe /t
if %errorlevel% neq 0 (
    echo Error
)

echo.
echo PBE has been closed!

echo.
echo Attempting to start League of Legends in PBE patchline...

cd "C:\Riot Games\Riot Client\"
if %errorlevel% neq 0 (
cls
color color 0C
echo Error: Unable to access the Riot Games client directory
pause
exit /b %errorlevel%
)

start RiotClientServices.exe --launch-product=league_of_legends --launch-patchline=pbe
if %errorlevel% neq 0 (
cls
color color 0C
echo Error: Failed to start RiotClientServices.exe
pause
exit /b %errorlevel%
)

echo.
echo Done!

exit

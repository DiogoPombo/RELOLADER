@echo off
set APP=RELOLADER
set AUTHOR=POMBO
set AVATAR=\Õ/
set MADE_BY=MADE BY:
set SPACE= 
set KEY=@2024
echo %APP%%SPACE%%MADE_BY%%SPACE%%SPACE%%AUTHOR%%SPACE%%SPACE%%AVATAR%%SPACE%%KEY%

echo.
echo: ******************** RELOLADER ********************

echo.
echo Attention! This script only works for conventional installation of League of Legends on disk C:/

echo.
echo Attempt to close League of Legends...

taskkill /f /im RiotClientServices.exe /t

echo.
echo Waiting to validate if League of Legends has ended...

timeout /t 5 /nobreak

echo.
echo Searching for remaining executable processes...

taskkill /f /im RiotClientServices.exe /t

taskkill /f /im LeagueClient.exe /t

echo.
echo League of Legends has been closed!

echo.
echo Waiting for system...
timeout /t 5 /nobreak

echo.
echo Starting League of Legends...

cd "C:\Riot Games\Riot Client\"
start RiotClientServices.exe --launch-product=league_of_legends --launch-patchline=live

exit

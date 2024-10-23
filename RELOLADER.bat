@echo off
@title RELOLADER

set APP=RELOLADER
set AUTHOR=POMBO
set AVATAR=\Õ/
set MADE_BY=MADE BY:
set SPACE= 
set KEY=@2024
echo %APP%%SPACE%%MADE_BY%%SPACE%%SPACE%%AUTHOR%%SPACE%%SPACE%%AVATAR%%SPACE%%KEY%

COLOR 0F

echo.
echo: ******************** RELOLADER ********************

echo.
echo RELOLADER is a script that restart your League of Legends if it's crashed, does not affect Vanguard!
echo.
echo.
echo Attention! This script only works for conventional installation of League of Legends in "C:\Riot Games\Riot Client", if your client is installed in another path or this path was changed in future updates, this will not work!
timeout /t 2 /nobreak >nul

echo.
echo Attempting to close League of Legends. . .

taskkill /f /im RiotClientServices.exe /t
if %errorlevel% neq 0 (
COLOR 0C
echo Error: Processes not found!
)

taskkill /f /im LeagueClient.exe /t
if %errorlevel% neq 0 (
echo.
echo Predicted error: Processes not found!
timeout /t 2 /nobreak >nul
)

cls
COLOR 0F
echo.
echo Waiting to validate if League of Legends has ended. . .
timeout /t 2 /nobreak >nul
echo.
echo Searching for remaining executable processes. . .
timeout /t 2 /nobreak >nul

taskkill /f /im LeagueClient.exe /t
if %errorlevel% neq 0 (
echo.
echo Predicted error: Processes not found!
timeout /t 2 /nobreak >nul
)

timeout /t 2 /nobreak >nul

taskkill /f /im RiotClientServices.exe /t
if %errorlevel% neq 0 (
echo.
echo Predicted error: Processes not found!
timeout /t 2 /nobreak >nul
cls
COLOR 0B
echo.
echo Success: No additional processes detected!
echo.
echo Success: League of Legends has been closed!
timeout /t 2 /nobreak >nul
)

cls
COLOR 0F
echo.
echo Attempting to start League of Legends in live server patchline. . .

cd "C:\Riot Games\Riot Client\"
if %errorlevel% neq 0 (
COLOR 0C
echo Error: Unable to access the Riot Games client directory at "C:\Riot Games\Riot Client\"
echo.
echo Error: Can't open League of Legends!
echo.
echo Press any key to exit!
pause >nul
exit /b %errorlevel%
)

timeout /t 2 /nobreak >nul

start RiotClientServices.exe --launch-product=league_of_legends --launch-patchline=live
if %errorlevel% neq 0 (
COLOR 0C
echo Error: Failed to start "RiotClientServices.exe"
echo.
echo Error: Can't open League of Legends!
echo.
echo Press any key to exit!
pause >nul
exit /b %errorlevel%
)

echo.
echo Loading. . .
timeout /t 15 /nobreak >nul

cls
COLOR 0B
echo.
echo Done!

timeout /t 2 /nobreak >nul

exit
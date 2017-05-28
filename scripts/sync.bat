@echo off
set SOURCE=./Server
set DESTINATION=./Desktop

REM jeder Computer legt seine eigene Log-Datei an
set ME=%COMPUTERNAME%
set LOG=%SOURCE%/%ME%.log

REM zusammengehörige Ausgaben werden über diesen Zeitstempel erkannt
set START_TIME=%date% %time%

echo %START_TIME% starte script >> %LOG%

set cnt=0
dir /b /S "%DESTINATION%" | find ".pdf" /C /I > tmp && set /p cnt=<tmp && del tmp
echo %START_TIME% Dateien davor : %cnt% >> %LOG%

REM
REM *.pdf  - nur PDF-Dateien werden beim Kopieren beachtet
REM /PURGE - lässt in DESTINATION nur Dateien übrig die es auch in SOURCE gibt
REM /S     - Unterverzeichnisse einbeziehen
REM
robocopy %SOURCE% %DESTINATION% *.pdf /PURGE /S

set cnt=0
dir /b /S "%DESTINATION%" | find ".pdf" /C /I > tmp && set /p cnt=<tmp && del tmp
echo %START_TIME% Dateien danach: %cnt% >> %LOG%

echo %START_TIME% beende script >> %LOG%
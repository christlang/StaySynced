@echo off

set SOURCE=./Server
set BACKUP=./backup

set DAYS_BEFORE_BACKUP=3

REM
REM *.pdf     - nur PDF-Dateien werden beim Kopieren beachtet
REM /MOVe     - Dateien nach dem verschieben aus dem original löschen (wenn gleiche Datei in Backup schon vorhanden kein löschen)
REM /S        - Unterverzeichnisse einbeziehen
REM /MINAGE:x - nur verschieben, wenn mindestens x Tage alt
REM
robocopy %SOURCE% %BACKUP% *.pdf /MOVe /S /MINAGE:%DAYS_BEFORE_BACKUP%

echo %date% %time% Script gelaufen >> %BACKUP%\cleaner.log
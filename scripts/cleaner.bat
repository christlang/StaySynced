@echo off

set SOURCE=./Server
set BACKUP=./backup

set DAYS_BEFORE_BACKUP=1

robocopy %SOURCE% %BACKUP% *.pdf /MOVE /MINAGE:%DAYS_BEFORE_BACKUP%


@ECHO OFF
:choice
set /P c=Would you like to Delete your sevrer cache?[Y/N]?
if /I "%c%" EQU "Y" goto :somewhere
if /I "%c%" EQU "N" goto :somewhere_else
goto :choice
:somewhere
echo "Deleting server cache"
rd /s /q "C:\Users\Nemo\Desktop\vrp20\cache\"
echo -
echo FXServer
echo -
start C:\Users\Nemo\Desktop\vrp20\run.cmd +exec server.cfg
exit
:somewhere_else
echo
@echo off
echo -
echo FXServer
echo -
start CC:\Users\Nemo\Desktop\vrp20\run.cmd +exec server.cfg
exit
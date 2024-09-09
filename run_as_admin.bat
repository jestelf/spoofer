@echo off
setlocal
set script_path="F:\git\spoofer\1.py"
set python_path="F:\IT\Python\python.exe"

:checkPrivileges
net file 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "ELEV", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:gotPrivileges
if '%1'=='ELEV' (shift)
setlocal & pushd .

"%python_path%" "%script_path%"
pause

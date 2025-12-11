@echo off
echo Stopping Tomcat...
set CATALINA_HOME=C:\tomcat
call "%CATALINA_HOME%\bin\shutdown.bat"
echo.
echo Tomcat stopped.
pause


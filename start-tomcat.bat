@echo off
echo Starting Tomcat...
set CATALINA_HOME=C:\tomcat
start "" "%CATALINA_HOME%\bin\startup.bat"
echo.
echo Tomcat is starting. Please wait 10-15 seconds.
echo Application will be available at: http://localhost:8080/todo-list/
pause


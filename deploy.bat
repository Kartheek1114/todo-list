@echo off
echo Building the project...
call mvn clean package

if %ERRORLEVEL% NEQ 0 (
    echo Build failed!
    pause
    exit /b 1
)

echo.
echo Stopping Tomcat...
set CATALINA_HOME=C:\tomcat
call "%CATALINA_HOME%\bin\shutdown.bat"
timeout /t 3 /nobreak >nul

echo.
echo Removing old deployment...
if exist "%CATALINA_HOME%\webapps\todo-list" (
    rmdir /s /q "%CATALINA_HOME%\webapps\todo-list"
)
if exist "%CATALINA_HOME%\webapps\todo-list.war" (
    del /q "%CATALINA_HOME%\webapps\todo-list.war"
)

echo.
echo Copying new WAR file...
copy /y "target\todo-list.war" "%CATALINA_HOME%\webapps\todo-list.war"

echo.
echo Starting Tomcat...
start "" "%CATALINA_HOME%\bin\startup.bat"

echo.
echo ========================================
echo Deployment complete!
echo ========================================
echo Application will be available at:
echo http://localhost:8080/todo-list/
echo.
echo Please wait 10-15 seconds for Tomcat to start.
echo.
pause


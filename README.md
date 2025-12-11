# Todo List (JSP + Servlets)

A simple JSP/Servlet web app to add, list, complete, and delete tasks. Uses in-memory storage (no database).

## Requirements
- Java 11+
- Maven 3.6+
- Tomcat 9 (or any Servlet 4.0 compatible container)

## Quick Start (existing Tomcat)
```bash
# from project root
mvn clean package
copy target\todo-list.war C:\tomcat\webapps\
C:\tomcat\bin\startup.bat
```
App: http://localhost:8080/todo-list/

## One-click deployment (scripts)
```bash
deploy.bat        # build, stop tomcat, deploy WAR, start tomcat
start-tomcat.bat  # start tomcat only
stop-tomcat.bat   # stop tomcat only
```

## Endpoints
- Home: `/todo-list/`
- View tasks: `/todo-list/tasks`
- Add task (form): `/todo-list/add.jsp`
- Delete task: `/todo-list/delete?id={id}`
- Complete/Incomplete: `/todo-list/complete?id={id}`

## Development notes
- JSP updates usually just need a browser refresh.
- Java changes require rebuild + redeploy (`mvn clean package`, copy WAR).
- Tasks are stored in-memory; restarting Tomcat resets the list.

## Project structure
```
src/main/java/com/todo/   # Servlets and Task model
src/main/webapp/          # JSP views and css/style.css
src/main/webapp/WEB-INF/  # web.xml
```

## Git tips
- `.gitignore` excludes `target/` and IDE files.
- To remove already tracked `target/`:
  ```
  git rm -r --cached target/
  git commit -m "Remove target from tracking"
  git push
  ```


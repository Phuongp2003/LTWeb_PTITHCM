# Java Web Project with Tomcat and Maven(for build)

- This is a simple project to create a web project with java, tomcat and maven.
- Required: jdk1.8(for tomcat), java version >= 9(for rsp/Community Server Connectors), maven, tomcat, ms sql server with database name "WEB_SACH" and table "Book" with columns "id" and "name".

# HOW TO USE

1. Download Extension Pack for Java, Community Server Connectors in vscode market place.
2. Download maven.
3. Downlaod jdk1.8 (required).
4. In Explorer (Ctrl+Shift+E), look at tag "Server", add your tomcat server (use server on disk) or download a new server.
5. launch task "maven: clean install" by ctrl + shift p and choosing "Task: run task" to build a classes path.
6. Right click on the project (src/main/webapp) and choose "Run on server" to deploy the project on the server.

- Choose server -> your server
- Add params -> yes -> your project name (it will be your slug to view the project on the browser)
- Project name -> empty

5. Open your browser and go to http://localhost:8080/<your_project_name>

# Requirements configuration

## 1. Maven

- Install sqlldbc4: Terminal -> Run task -> maven: install sqlldbc4
  manual:

```
mvn install:install-file -Dfile=setup/sqljdbc4.jar -DgroupId=com.microsoft.sqlserver -DartifactId=sqljdbc4 -Dversion=4.0 -Dpackaging=jar
```

## 2. Tomcat

- Setup vm.install.path
  - With tomcat from disk: when install, i will show a window like this, just edit in field "vm.install.path" to your jdk path.
    ![alt text](setup/image.png)
  - With tomcat download from server: right click on your server -> Edit Server...
    It will open a file json, find "vm.install.path" and change it to your jdk path.

# NOTE

## 1. Change output port

- On tag Server, right click on your server and choose "Server Actions..."
- Choose "Edit Configuration File"
- Choose conf/server.xml
- Find "Connector port=" and change the port to your desired port.
- Restart/start your server.

## 2. Simple way to deploy with your project name

- When adding a project to the server, you keep param empty, your slug will be http://localhost:8080/webapp
- If you want to change the slug, you can change the webapp folder name to your desired name.

## 3. Builded folder of maven (target)

- You can run the project by right click on the .war and choose "Run on server" without building the project by yourself, but it's doesn't have hot reload.

- You can delete this folder, it will not affect your project.

## 4. Change webapp folder name / path

- You need to change the path of classes too
- Go to pom.xml, find "maven-compiler-plugin" and change the path of outputDirectory to your desired path.
- This project files tree:

```
|___src
|      |_main
|      |_java
|      |  |_<controller_package>
|      |
|      |_webapp
|           |_WEB-INF
|               |_classes
|               |_lib
|               |_web.xml
|               |_index.jsp
|               |_...
|
|___pom.xml
```

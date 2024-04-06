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

## 5. Bug with Community Server Connectors

- If you have a bug with Community Server Connectors, it may cause by your java version. You can change your java version to 9 or higher to fix this bug. Check JAVA_HOME in your system environment variables if it's installed.

## 6. Bug with Tomcat

- Server log maybe look like this:

```
java.lang.ExceptionInInitializerError: Exception java.lang.ExceptionInInitializerError [in thread "localhost-startStop-1"]
	org.springframework.cglib.core.KeyFactory$Generator.generateClass(KeyFactory.java:166)
	org.springframework.cglib.core.DefaultGeneratorStrategy.generate(DefaultGeneratorStrategy.java:25)
	org.springframework.cglib.core.AbstractClassGenerator.create(AbstractClassGenerator.java:216)
	org.springframework.cglib.core.KeyFactory$Generator.create(KeyFactory.java:144)
	org.springframework.cglib.core.KeyFactory.create(KeyFactory.java:116)
	org.springframework.cglib.core.KeyFactory.create(KeyFactory.java:108)
	org.springframework.cglib.core.KeyFactory.create(KeyFactory.java:104)
	org.springframework.cglib.proxy.Enhancer.<clinit>(Enhancer.java:69)
	org.springframework.aop.framework.CglibAopProxy.createEnhancer(CglibAopProxy.java:234)
	org.springframework.aop.framework.CglibAopProxy.getProxy(CglibAopProxy.java:177)
	org.springframework.aop.framework.ProxyFactory.getProxy(ProxyFactory.java:111)
	org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator.createProxy(AbstractAutoProxyCreator.java:490)
	org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator.wrapIfNecessary(AbstractAutoProxyCreator.java:375)
	org.springframework.aop.framework.autoproxy.AbstractAutoProxyCreator.postProcessAfterInitialization(AbstractAutoProxyCreator.java:335)
```

- This bug may cause by your jdk version setup in your server. You can change your jdk version to 1.8 to fix this bug. Check [this](#requirements-configuration##2-tomcat) to know how to change your jdk version.

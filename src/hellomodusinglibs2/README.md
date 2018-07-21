This modularized app uses the Log4J2 library for event logging.

The library consists of a two JAR files: one is fully modularized and one is not modularized.  

The JVM treats log4j-core.2.11.0.jar as an "automatic module", 
which grants it some of the benefits, and some of the restrictions of modularization,
without requiring it satisfy all of the requirements for modularization.

log4j-core.2.11.0.jar includes in its MANIFEST.MF the entry:
Automatic-Module-Name: org.apache.logging.log4j.core

This is the Module Name our modularized app must use in order to access this JAR.

The app is deployed in a JAR file.  
The log4j2.xml configuration file is included in that JAR.

To run properly, it requires the two Log4J JAR files as well.

To build and run this app:

- You must have the Java JDK 9 or greater installed
- You must have log4j-api.2.11.0.jar at LOG4J2_HOME
- You must have log4j-core.2.11.0.jar at LOG4J2_HOME

Download these JARs from:  
http://central.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.11.0/  
http://central.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.11.0/  

WARNING: Log4J2's version 2.10.0 DOES NOT WORK here.  
Specifically, it throws the exception:
```
java.lang.NoClassDefFoundError: Could not initialize class org.apache.logging.log4j.util.PropertiesUtil
```
1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, cd to your destination location
5. At the command line, execute: build.sh

The app should build.

6. At the command line, execute: run.sh

The console should display:

Hello Modularized Using a Partially Modularized Library!  
05:15:03.858 [main] INFO  kata.app.HelloModUsingLibs2 - This is an information entry  
05:15:03.891 [main] DEBUG kata.app.HelloModUsingLibs2 - This is a debugging entry  
05:15:03.891 [main] WARN  kata.app.HelloModUsingLibs2 - This is a warning entry  
05:15:03.892 [main] ERROR kata.app.HelloModUsingLibs2 - This is an error entry

To deploy and run this app on another computer:

- Your destination computer must have the Java 9 or later JRE installed.

1. Create a destination location directory on the destination computer
2. Copy to the destination location on the destination computer:  
  appmod.jar  
  log4j-api-2.11.0.jar  
  log4j-core-2.11.0.jar  
  run.sh
3. On the destination computer, open up a command line terminal
4. CD to the destination location
5. At the command line, execute: run.sh

The console should display as above. 

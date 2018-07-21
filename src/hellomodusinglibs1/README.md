This modularized app uses the Log4J2 library for event logging.

The library consists of a single JAR file and is itself fully modularized.  

Because we use only the log4j-api.2.11.0.jar, 
and not also the log4j-core.2.11.0.jar, 
we are limited to Log4J2's SimpleLogger.

This is because log4j-core.2.11.0.jar is not modularized.  
We want this Kata to be fully modularized, including its library.

The app is deployed in a JAR file.  
To run properly, it requires the Log4J JAR file as well.

To build and run this app:

- You must have the Java JDK 9 or greater installed
- You must have log4j-api.2.11.0.jar at LOG4J2_HOME

Download this JAR from:  
http://central.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.11.0/  

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

Hello Modularized Using a Fully Modularized Library!  
05:04:44.248 INFO HelloModUsingLibs1 This is an information entry  
05:04:44.271 DEBUG HelloModUsingLibs1 This is a debugging entry  
05:04:44.271 WARN HelloModUsingLibs1 This is a warning entry  
05:04:44.271 ERROR HelloModUsingLibs1 This is an error entry

To deploy and run this app on another computer:

- Your destination computer must have the Java 9 or later JRE installed.

1. Create a destination location directory on the destination computer
2. Copy to the destination location on the destination computer:  
  appmod.jar  
  log4j-api-2.11.0.jar  
  run.sh
3. On the destination computer, open up a command line terminal
4. CD to the destination location
5. At the command line, execute: run.sh

The console should display as above. 

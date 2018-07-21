This modularized app is a Custom Runtime Image that uses the Log4J2 library 
for event logging.

A Custom Runtime Image contains:
- A binary image named modules, that contains:  
Your app, as a module  
All required libraries, as modules  
- A JRE that contains only those modules required to run your app

It needs the Java 9 or later JDK on your build computer to build, 
but does ***not*** need Java installed on the destination computer to run.

It may be run only on computers using the same operating system, 
though not necessarily the same release, as the computer on which you built this app.

The library consists of a single JAR file and is itself fully modularized.  

Because we use only the log4j-api.2.11.0.jar, and not also the log4j-core.2.11.0.jar, 
we are limited to Log4J2's SimpleLogger.

This is because log4j-core.2.11.0.jar is an automatic module, 
and automatic modules can not be included in custom runtime images.

The app is deployed as a Custom Runtime Image directory tree.

Java 9 and later JRE's are modularized.  
Your app and all libraries it uses must be modularized.

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

The app should build an image directory tree, appmod-image, that contains:  
- A binary image named modules, that contains:  
Your app  
The Log4J2 library  
- The subset of the Java runtime environment necessary to run your app

6. At the command line, execute: run.sh

The console should display:

Hello Custom Runtime Image Using the Log4J2 Library!  
05:08:57.641 INFO HelloModImageUsingLib4 This is an information entry  
05:08:57.663 DEBUG HelloModImageUsingLib4 This is a debugging entry  
05:08:57.664 WARN HelloModImageUsingLib4 This is a warning entry  
05:08:57.664 ERROR HelloModImageUsingLib4 This is an error entry  

To deploy and run this app on another computer:

- Your destination computer must use the **same operating system** you used to build your app, for example:  MacOS
- The release version of that operating system should not matter, but YMMV
- It is not necessary to have Java installed on that computer
- Having Java installed on that computer should not affect this app

1. Create a destination location directory on the destination computer
2. Copy the appmod-image directory tree to the destination location on the destination computer
4. Copy run.sh to the destination location
5. On the destination computer, open up a command line terminal
6. CD to the destination location
7. At the command line, execute: run.sh

The console should display as above.

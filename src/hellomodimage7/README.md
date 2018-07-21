This modularized app is a Custom Runtime Image that uses 4 libraries to:

- Parse a CSV file - The Apache Commons CSVParser library
- Write JSON output - The Jackson JSON library
- Transmit data between the parsing and writing - The EventBus publish / subscribe library
- Log the events to the console - The Apache Log4J2 library

A Custom Runtime Image contains:
- A binary image named modules, that contains:  
Your app, as a module  
All required libraries, as modules  
- A JRE that contains only those modules required to run your app

It needs the Java 9 or later JDK on your build computer to build, 
but does  ***not***  need Java installed on the destination computer to run.

It may be run only on computers using the same operating system, 
though not necessarily the same release, as the computer on which you built this app.

All libraries used by a Custom Runtime Image must be fully modularized.  
Three of these libraries are shipped from their third-party developers 
as ***totally non-modularized***.

- The Apache CSVParser library consists of one JAR.  
  We use a HACK to modularize it by adding a module-info.class file to its JAR  
  
- The Jackson JSON library consists of three JARs.  
  We use the same HACK to modularize those JARs.
  
- The EventBus library consists of one JAR.  
  We use the same HACK to modularize that JAR.
 
- The Apache Log4J2 library normally consists of two JARs.

Both JAR's are multi-release, containing version directory trees for Java 9.
Both JAR's contain version directory trees for Java 9.

The log4j-api.2.11.0.jar is fully modularized.

The log4j-core.2.11.0.jar is an Automatic Module. 
It is so specified in its MANIFEST.MF file.

As such, it can ***not*** be used in a custom image.  
I tried for a week to apply the above hack to this JAR, unsuccessfully.  
Suspect the folks at Apache knew what they were doing by not modularizing it at this time.

However, Log4J2's Simple Logger will work with just the log4j-api.2.11.0.jar.  
Therefore, for this custom image modularized app, I use Log4J's SimpleLogger.

The app is deployed as a Custom Runtime Image directory tree.

Java 9 and later JRE's are modularized.  
Your app and all libraries it uses must be modularized.

To build and run this app:

- You must have Java JDK 9 or greater installed  

- You must have commons-csv-1.5.jar at CSV_HOME  
- You must have jackson-core.2.9.0.jar at JSON_HOME 
- You must have jackson-annotations.2.9.0.jar at JSON_HOME  
- You must have jackson-databind.2.9.0.jar at JSON_HOME 
- You must have eventbus-1.4.jar at EBUS_HOME. 
- You must have log4j-api.2.11.0.jar at LOG4J2_HOME  

Download CSVParser from: 
https://commons.apache.org/proper/commons-csv/download_csv.cgi

Download Jckson JSON from:  
http://central.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.0/  
http://central.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.9.0/  
http://central.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.9.0/  

Download eventbus from: 
https://mvnrepository.com/artifact/org.bushe/eventbus/1.4

Download Log4J2 from:   
http://central.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.11.0/  

WARNING: Log4J2's version 2.10.0 DOES NOT WORK here.  
Specifically, it throws the exception:
```
java.lang.NoClassDefFoundError: Could not initialize class org.apache.logging.log4j.util.PropertiesUtil
```
WARNING: Jackson's databind for versions 2.9.1 - 2.9.5 DO NOT WORK here.  
Specifically, Java can not find the jackson.databind module.  
So we use version 2.9.0.

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, cd to your destination location
5. At the command line, execute: build.sh

The app should build an image directory tree, appmod-image, that contains:  
- A binary image named modules, that contains:  
Your app
The HACKED eventbus library  
The HACKED CSVParser library  
The HACKED Jackson JSON library  
The Log4J2 library  
- The subset of the Java runtime environment necessary to run your app

6. At the command line, execute: run.sh

The console should display:

Hello Custom Runtime Image Using Multiple Libraries!  
05:19:34.806 INFO HelloModImageUsingLibs Reading CSV  
05:19:34.867 INFO JSONWriter {"first_name":"john","last_name":"bannick"}  
05:19:34.867 INFO JSONWriter {"first_name":"elmer","last_name":"fudd"}  
05:19:34.867 INFO JSONWriter {"first_name":"bugs","last_name":"bunny"}  
05:19:34.867 INFO HelloModImageUsingLibs Finished reading CSV  

The names.csv file is not in the custom runtime image.  
Go ahead and add your name.

To deploy and run this app on another computer:

- Your destination computer must use the **same operating system** you used to build your app, for example:  MacOS
- The release version of that operating system should not matter, but YMMV
- It is not necessary to have Java installed on that computer
- Having Java installed on that computer should not affect this app

1. Copy to the destination computer and directory:  
the appmod_image directory  
run.sh file  
names.csv file 
2. At the command line, cd to that location
2. At the command line, execute: run.sh

The console should display as above.

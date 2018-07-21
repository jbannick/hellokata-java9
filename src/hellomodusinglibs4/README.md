This modularized app uses 4 libraries:

1. The Apache CVSParser library reads and parses a CSV file
2. The EventBus library publishes those records to a subscriber
3. Which uses the Jackson JSON library to convert them into JSON
4. All of which is reported by the Apache Log4J2 library

Three of these libraries are totally ***non-modularized***.

- The CSVParser library consists of one JAR.    
- The Jackson JSON library consists of three JARs.    
- The EventBus library consists of one JAR.  
 
The Log4J2 library consists of a two JAR files: 
 one is fully modularized and one is not modularized.  
 
Here we put all of these libraries on the Module Path, thus using them as Automatic modules.
This grants them some of the benefits, and some of the restrictions of modularization,
without requiring they satisfy all of the requirements for modularization.

The CSVParser, JSON, and EventBus JARs do not include in their MANIFEST.MF files
the Automatic-Module-Name entry.  
Therefore Java derives the module names from the JAR names.

log4j-core.2.11.0.jar includes in its MANIFEST.MF the entry:
Automatic-Module-Name: org.apache.logging.log4j.core

This is the Module Name our modularized app must use in order to access this JAR.

WARNING: Log4J2's version 2.10.0 DOES NOT WORK here.  
Specifically, it throws the exception:
```
java.lang.NoClassDefFoundError: Could not initialize class org.apache.logging.log4j.util.PropertiesUtil
```

WARNING: Jackson's databind for versions 2.9.1 - 2.9.5 DO NOT WORK here.  
Specifically, Java can not find the jackson.databind module.  
So we use version 2.9.0.

The modularized app itself is deployed in a JAR.  
The log4j2.xml configuration file is included in that JAR.

The names.csv file is external to the JAR.  
(Go ahead and add your own name.)

To build and run this app:

- You must have any Java JDK release 9 or later installed
- You must have commons-csv-1.5.jar at CSV_HOME
- You must have jackson-core.2.9.0.jar at JSON_HOME
- You must have jackson-annotations.2.9.0.jar at JSON_HOME
- You must have jackson-databind.2.9.0.jar at JSON_HOME
- You must have eventbus-1.4.jar at EBUS_HOME
- You must have log4j-api.2.11.0.jar at LOG4J2_HOME  
- You must have log4j-core.2.11.0.jar at LOG4J2_HOME

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
http://central.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.11.0/  

1. Copy the src directory tree to your destination location
2. Copy names.csv to that location  
3. Copy build.sh to that location
4. Copy run.sh to that location
5. At the command line, cd to your destination location
6. At the command line, execute: build.sh

The app should build.

7. At the command line, execute: run.sh

The console should display:

Hello Modularized App Using Multiple Non-Modularized Libraries!  
05:09:27.501 [AWT-EventQueue-0] INFO  kata.app.HelloModUsingLibs - Reading CSV  
05:09:27.534 [AWT-EventQueue-0] INFO  kata.app.JSONWriter - {"first_name":"john","last_name":"bannick"}  
05:09:27.534 [AWT-EventQueue-0] INFO  kata.app.JSONWriter - {"first_name":"elmer","last_name":"fudd"}  
05:09:27.535 [AWT-EventQueue-0] INFO  kata.app.JSONWriter - {"first_name":"bugs","last_name":"bunny"}  
05:09:27.535 [AWT-EventQueue-0] INFO  kata.app.HelloModUsingLibs - Finished reading CSV  
   
A file named hellolog4j2.log should be written to your ./logs directory.  
Note that, by default, Log4J2 appends to existing log files.

Note that the Log4J2 configuration is defined in the log4j2.xml file,
which is located within the app module.

To deploy this app:

- You must have the Java JRE at or later than the release you used to build this installed on the destination computer

1. Copy to the destination computer and directory:  
appmod.jar  
commons-csv-1.5.jar  
eventbus-1.4.jar  
jackson-annotations-2.9.0.jar  
jackson-core-2.9.0.jar  
jackson-databind-2.9.0.jar  
log4j-api-2.11.0.jar  
log4j-core-2.11.0.jar
2. Copy the names.csv file, and run.sh file to the destination computer and directory
3. At the command line, cd to that location
4. At the command line, execute: run.sh

The console should display as above.

This modularized app uses 4 fully modularized libraries to:

- Parse a CSV file - The Apache Commons CSVParser library
- Write JSON output - The Jackson JSON library
- Transmit data between the parsing and writing - The EventBus publish / subscribe library
- Log the events to the console - The Apache Log4J2 library

Each library is deployed in one or more JAR files.  
The app itself is deployed in a JAR file.

The part of the Apache Log4J library that we use here is fully modularized.  
The other three libraries are distributed by their third-party sources as ***non-modularized***.

This Kata uses a HACK to modularize those libraries.
The HACK consists of:
1. Explode the library JAR into a work directory
2. Use the Java jdeps tool to generate a module-info.java file
3. Compile just that file
4. Re-JAR work, now including module-info.class
5. Use the HACKed JAR to build and run your app

To build and run this app:

- You must have Java JDK 9 or greater installed  
- You must have commons-csv-1.5.jar at CSV_HOME  
- You must have jackson-core.2.9.0.jar at JSON_HOME  
- You must have jackson-annotations.2.9.0.jar at JSON_HOME  
- You must have jackson-databind.2.9.0.jar at JSON_HOME  
- You must have eventbus-1.4.jar at EBUS_HOME  
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
2. Copy the names.csv file to that location
3. Copy to that location:  
  build.sh  
  build_lib1.sh  
  build_lib2.sh  
  build_lib3.sh  
  build_lib4.sh  
  build.app  
  run.sh
4. At the command line, cd to your destination location
5. At the command line, execute: build.sh

The app should build.

6. At the command line, execute: run.sh

The console should display:

Hello Modularized App using Libraries Modularized via a HACK!  
04:16:49.816 INFO HelloModUsingLib6 Reading CSV  
04:16:49.938 INFO JSONWriter {"first_name":"john","last_name":"bannick"}  
04:16:49.938 INFO JSONWriter {"first_name":"elmer","last_name":"fudd"}  
04:16:49.939 INFO JSONWriter {"first_name":"bugs","last_name":"bunny"}  
04:16:49.939 INFO HelloModUsingLib6 Finished reading CSV  

Go ahead and add your name to the names.csv file and re-run the app.

To deploy and run this app:

- You must have installed on the destination computer a Java JRE 
with a version that is at or later than the version of the JDK you used
to build this app

1. Copy to the destination computer:  
  your HACKED commons-csv-1.5.jar  
  your HACKED jackson-core.2.9.0.jar  
  your HACKED jackson-annotations.2.9.0.jar   
  your HACKED jackson-databind.2.9.0.jar  
  your HACKED eventbus-1.4.jar  
  log4j-api.2.11.0.jar   
2. Copy to the destination computer and directory:  
  run.sh  
  names.csv
3. At the command line, cd to that location
4. At the command line, execute: run.sh

The console should display as above.

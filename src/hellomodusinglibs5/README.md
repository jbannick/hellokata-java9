This modularized app uses the EventBus library to connect a Publisher and Subscriber.

The library consists of a single JAR file and is ***not*** modularized by its developer.  

This Kata uses a HACK to modularize eventbus library.  
The HACK consists of:
1. Explode the EventBus JAR into a work directory
2. Use the Java jdeps tool to generate a module-info.java file
3. Compile just that file
4. Re-JAR work, now including module-info.class
5. Use the HACKed JAR to build and run your app

CAVEAT: Delete the work directory before you build your app, 
else you get the error;
````
java.lang.module.FindException: Two versions of module eventbus found in . (work and eventbus-1.4.jar)
````

This app is deployed in a JAR file.
To run properly, it requires the HACKED eventbus JAR file as well.

To build and run this app:

- You must have Java JDK 9 or greater installed
- You must have eventbus-1.4.jar at EBUS_HOME

Download eventbus from: 
https://mvnrepository.com/artifact/org.bushe/eventbus/1.4/

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, cd to your destination location
5. At the command line, execute: build.sh

The app should build.

6. At the command line, execute: run.sh

The console should display:

Hello Modularized App Using a Library Modularized via a HACK!  
Publisher is instantiated  
Subscriber is instantiated  
Subscriber received a rumor: Pizza in the break room  

To deploy and run this app:

- You must have installed on the destination computer a Java JRE 
with a version that is at or later than the version of the JDK you used
to build this app

1. Copy to the destination computer and directory:  
  appmod.jar  
  eventbus-1.4.jar  
  run.sh
2. At the command line, cd to that location
2. At the command line, execute: run.sh

The console should display as above.

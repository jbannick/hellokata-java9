This is a simple modularized library, called by a non-modularized app.

The app is deployed in a JAR file.  
To run properly, it requires the library JAR file as well.

To build and run this library and the app that uses it:

- You must have the Java 9 JDK or later installed

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, execute: build.sh

The library and app should build.

5. At the command line, execute: run.sh

The app and library should display:

Hello Non-Modularized App Using a Modularized Library!  
Hello from a Modularized Library!

To deploy this library and app:

- You must have installed on the destination computer a Java JRE 
with a version that is at or later than the version of the JDK you used
to build this library and app

1. Copy to the destination computer and directory:  
libmod.jar  
app.jar  
run.sh
2. At the command line, cd to that location
2. At the command line, execute: run.sh

The app and library should display as above.

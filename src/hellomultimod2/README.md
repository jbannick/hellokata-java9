This is a simple multi-modularized app that uses a services architecture
to decouple implementation specifics from the consuming app.

It is implemented as 4 modules:

- An engine that processes vegetables by chopping
- Another engine that processes vegetables by pureeing
- The main app that calls those engines, via
- An API module

The app uses the Java ServiceLoader to discover and load its engines at runtime.  
This enables us to build and deploy additional engines without recompiling the app itself.

The modules are deployed as 4 JAR files.

To build and run this app:

- You must have the Java 9 JDK or later installed

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, execute: build.sh

The app should build.

5. At the command line, execute: run.sh

The app should display: 

Hello Mult-Module Services App!  
Chopping Carrots  
Pureeing Carrots

To deploy this app:

- You must have installed on the destination computer a Java JRE 
with a version that is at or later than the version of the JDK you used
to build this app

1. Copy the 4 JAR files and the run.sh file to the destination computer and directory
2. At the command line, cd to that location
2. At the command line, execute: run.sh

The app should display as above.

This simple modularized app consists of two modules, 
deployed as a Custom Runtime Image.

A Custom Runtime Image contains:
- A binary image named modules, that contains:  
Your app, as a module  
All required libraries, as modules  
- A JRE that contains only those modules required to run your app

It needs the Java 9 or later JDK on your build computer to build, 
but does  ***not***  need Java installed on the destination computer to run.

It may be run only on computers using the same operating system, 
though not necessarily the same release, as the computer on which you built this app.

The app is deployed as a Custom Runtime Image directory tree.

The app's 2 modules are:

- An engine that processes vegetables
- The main app that calls that engine

To build and run this app:

- You must have the Java 9 JDK or later installed

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, execute: build.sh

The app should build.

5. At the command line, execute: run.sh

The app should display: 

Hello Mult-Module App Custom Runtime Image!  
Processing Carrots

To deploy this app:

- You must have installed on the destination computer a Java JRE 
with a version that is at or later than the version of the JDK you used
to build this app

1. Copy the appmod-image directory and the run.sh file to the destination computer and directory
2. At the command line, cd to that location
2. At the command line, execute: run.sh

The app should display as above.

This simple HelloWorld app is a Custom Runtime Image.

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

Java 9 and later JRE's are modularized.  
Your app and all libraries it uses must be modularized.

To build and run this app:

- You must have the Java 9 or later JDK installed

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, execute: build.sh

The app should build an image directory tree, appmod-image, that contains:
- Your app, as part of a binary image named modules
- The subset of the Java runtime environment necessary to run that app  

5. At the command line, execute: run.sh

The app should display:  
Hello Custom Runtime Image!

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

The app should display as above.

This simple HelloWorld app is built as ***3 different*** Custom Runtime Images, 
enabling it to run on:

- MacOS
- Windows64
- Linux

A Custom Runtime Image contains:
- A binary image named modules, that contains:  
Your app, as a module  
All required libraries, as modules  
- A JRE that contains only those modules required to run your app

It needs the Java 9 or later JDK on your build computer to build.  
It also needs on your build computer the Java 9 or later JDKs 
for ***each*** of your other destination operating systems.

It does  ***not*** need Java installed on a destination computer to run.

The app is deployed as a Custom Runtime Image directory tree.

Java 9 and later JRE's are modularized.  
Your app and all libraries it uses must be modularized.

To build and run this app:

- You must have a Java 9 or later JDK for MacOS installed 
- You must have a Java 9 or later JDK for Windows64 installed
- You must have a Java 9 or later JDK for Linux installed

- You must have your JAVA_HOME environment variable pointing at the Java 9 or later JDK appropriate for your build computer
- You must have your JDK_MACOS_HOME environment variable pointing at your Java 9 or later JDK for MacOS
- You must have your JDK_WIN64_HOME environment variable pointing at your Java 9 or later JDK for Windows64
- You must have your JDK_LINUX_HOME environment variable pointing at your Java 9 or later JDK for Linux

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run.sh to that location
4. At the command line, execute: build.sh

The app should build:

- An image directory tree, appmod-image-linux, that contains:  
 Your app, as part of a binary image named module  
 The subset of the Java runtime environment necessary to run that app on Linux

- An image directory tree, appmod-image-macos, that contains:  
 Your app, as part of a binary image named module   
 The subset of the Java runtime environment necessary to run that app
 on a Mac
 
- An image directory tree, appmod-image-win64, that contains:  
 Your app, as part of a binary image named modules   
 The subset of the Java runtime environment necessary to run that app on Windows

5. At the command line, execute: run.sh

If you built on a Mac, the app should display something like:  

Hello Custom Runtime Images!
I am running on Mac OS X 10.13.5

To deploy and run this app on another computer:

- Your destination computer can run either MacOS, Linux, or Windows
- The release version of that operating system should not matter, but YMMV
- It is not necessary to have Java installed on that computer
- Having Java installed on that computer should not affect this app

1. Create a destination location directory on the destination computer
2. Copy as appropriate, to the destination location:  
The appmod-image-linux directory tree or  
The appmod-image-macos directory tree or  
The appmod-image-win64 directory tree  
3. Copy as appropriate, to the destination location:  
run_linux.sh, or  
run_macos.sh, or  
run_win64.bat, 
4. On the destination computer, open up a command line terminal
5. CD to the destination location
6. At the command line, execute as appropriate:  
run_linux.sh, or  
run_macos.sh, or  
run_win64.bat

The app should display something like:   

Hello Custom Images!
I am running on Mac OS X 10.13.5

or

Hello Custom Images!
I am running on Windows 10 10.0

or

Hello Custom Images!
I am running on Linux 3.13.0-24-generic

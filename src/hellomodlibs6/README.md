This is a Multi-release library, 
called by a modularized app, all within a variety of Java Custom Runtime Images. 

##### Multi-release Library

A Multi-release library contains:  
- Base code for one Java release, compiled by that release
- Also code for one or more other Java releases, compiled by each of those releases

The JVM decides at runtime which to use.  

A Multi-release JAR can be used by:

- Non-modularized (classpathed) apps
- Modularized apps
- Custom Runtime Images

The contents of Multi-release JARs are embedded in Custom Runtime Images.

The library we build here has code for:

- Java 7
- Java 9
- Java 10

The Java 7 version of the library uses the Java 7 Thread way of determining the current stack.  
The Java 9 version of the library uses the Java 9 and later StackWalker way.  
The Java 10 version of the library uses Java 10 Local-Variable Type Inference (var's) to build the Map of comics.

When the library is called from an app running under Java 7, 
the library's Java 7 code is used.  

When the library is called from an app running under Java 9, 
either as an independent app or as part of a Custom Runtime Image,
the library's Java 9 code is used, where it supercedes Java 7 code.

When the library is called from an app running under Java 10, 
either as an independent app or as part of a Custom Runtime Image,
the library's Java 10 code is used, where it supercedes Java 7 and Java 9 code.

Note:

Within the library, the versioned code must have for each version, identical:

- Package names
- Class names
- Method signatures

Within the library, versioned modularized code must have for each version, identical:
- Module names

##### Custom Runtime Image

A Custom Runtime Image contains:
- A binary image named modules, that contains:  
Your app, as a module  
All required libraries, as modules  
- A JRE that contains only those modules required to run your app

It needs the Java 9 or later JDK to be on your build computer to build.  

It also needs on your build computer the Java 9 or later JDKs 
for ***each*** of your other destination operating systems.

It does not need Java installed on a destination computer to run.  
It is not affected by any Java installed on a destination computer.  
It does not affect any other Java installed on a destination computer.  
It does not affect any other Java app run on a destination computer.

##### To Build and Run

The library for this Kata contains Java 7, 9. and 10 code.

The Java 7, classpathed, app runs on MacOS, Windows64, and Linux.  
The MacOS Java 9 and Java 10 Custom Runtime Images run only on MacOS.  
The Windows64 Java 10 Custom Runtime Image runs only on Windows 64.  
The Linux Java 10 Custom Runtime Image runs only on Linux.

To build and run this library and the three apps that use it:

- You must have the MacOS Java 7 JDK installed
- You must have the MacOS Java 9 JDK installed
- You must have the MacOS Java 10 JDK installed
- You must have the Windows64 Java 10 JDK installed
- You must have the Linux Java 10 JDK installed

On a Mac:
1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy to that location:   
    run7.sh  
    run7.bat  
    run9image-macos.sh  
    run10image-macos.sh  
    run10image-win64.bat  
    run10image-linux.sh
4. At the command line, execute: build.sh

The library, Java 7 app, and both Custom Runtime Images should build.

5. At the command line, execute: run7.sh

The Java 7 app should display:  
````
Hello Java 7 App!  
This app is running under Java version 1.7.0_80  
on Mac OS X 10.13.5

Hello Library - Java 7 code!  
The library is running under Java version 1.7.0_80  

The stack is:  
java.lang.Thread.getStackTrace(Thread.java:1589)  
kata.lib.HelloLib.doSomething(HelloLib.java:15)  
kata.app7.HelloApp7.main(HelloApp7.java:15)

Comics are:  
[Moe, Larry, Curly]  
[Laurel, Hardy]
````
6. At the command line, execute: run9image-macos.sh

The Java 9 app should display:

````
Hello Modularized Java 9 App!  
This app is running under Java version 9.0.4  
on Mac OS X 10.13.5

Hello Library - Java 9 code!  
The library is running under Java version 9.0.4

The stack is:  
libmod/kata.lib.HelloLib.doSomething(HelloLib.java:14)  
app9mod/kata.app9mod.HelloApp9Mod.main(HelloApp9Mod.java:15)

Comics are:  
[Moe, Larry, Curly]  
[Laurel, Hardy]
````

7. At the command line, execute: run10image-macos.sh

The Java 10 app should display:
````
Hello Modularized Java 10 App!  
This app is running under Java version 10  
on Mac OS X 10.13.5

Hello Library - Java 10 code!  
The library is running under Java version 10

The stack is:  
libmod/kata.lib.HelloLib.doSomething(HelloLib.java:15)  
app10mod/kata.app10mod.HelloApp10Mod.main(HelloApp10Mod.java:15)

Comics are:  
[Moe, Larry, Curly]  
[Laurel, Hardy]
````
8. Or, on a Mac, you can simply execute: run.sh

All of the apps should display as above.

##### Deploying and Running on Windows

1. Copy to the destination computer and directory:  
    lib.jar  
    the app10mod-image_win64 directory tree  
    run10image-win64.bat  
2. At the command line, cd to that location
3. At the command line, execute: run10image-win64

The Java 10 app should display:

````
Hello Modularized Java 10 App!
This app is running under Java version 10
on Windows 10 10.0

Hello Library - Java 10 code!
The library is running under Java version 10

The stack is:
libmod/kata.lib.HelloLib.doSomething(HelloLib.java:15)
app10mod/kata.app10mod.HelloApp10Mod.main(HelloApp10Mod.java:18)

Comics are:
[Moe, Larry, Curly]
[Laurel, Hardy]
````

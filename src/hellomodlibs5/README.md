This is a Multi-release library 
called by a Java 7 app and by modularized Java 9 and Java 10 apps.

A Multi-release library contains:  
- Base code for one Java release, compiled by that release
- Also code for one or more other Java releases, compiled by each of those releases

The JVM decides at runtime which to use.  

Multi-release libraries are deployed as JAR files.

A Multi-release JAR can be used by:

- Non-modularized (classpathed) apps
- Modularized apps

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
the library's Java 9 code is used.

When the library is called from an app running under Java 10, 
the library's Java 10 code is used.

Within the library, the Java 7 code is ***not*** modularized.  
The Java 9 and 10 code ***is*** modularized

Note:

Within the library, the versioned code must have for each version, identical:

- Package names
- Class names
- Method signatures

Within the library, versioned modularized code must have for each version, identical:
- Module names

To build and run this library and the two apps that use it:

- You must have the Java 10 JDK installed
- You must have the Java 9 JDK installed
- You must have the Java 7 JDK installed

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy to that location:  
    run.sh  
    run7.sh  
    run9.sh  
    run10.sh  
    run7from9.sh  
    run7from10.sh  
    run9from10.sh
4. At the command line, execute: build.sh

The library and all three apps should build.

5. At the command line, to run ***all*** the apps in sequence, execute: run.sh

The Java 7 app  running under Java 7 should display:  
````
Hello Java 7 App!  
This app is running under Java version 1.7.0_80  

Hello Library - Java 7 code!  
The library is running under Java version 1.7.0_80

The stack is:  
java.lang.Thread.getStackTrace(Thread.java:1589)  
kata.lib.HelloLib.doSomething(HelloLib.java:16)  
kata.app7.HelloApp7.main(HelloApp7.java:13)  

Comics are:  
[Moe, Larry, Curly]  
[Laurel, Hardy]
````

The Java 7 app running under Java 9 should display:

````
Hello Java 7 App!  
This app is running under Java version 9.0.4  

Hello Library - Java 9 code!  
The library is running under Java version 9.0.4  

The stack is:  
kata.lib.HelloLib.doSomething(HelloLib.java:12)  
kata.app7.HelloApp7.main(HelloApp7.java:13)  
````

The Java 7 app running under Java 10 should display:

````
Hello Java 7 App!  
This app is running under Java version 10  

Hello Library - Java 10 code!  
The library is running under Java version 10  

The stack is:  
kata.lib.HelloLib.doSomething(HelloLib.java:13)  
kata.app7.HelloApp7.main(HelloApp7.java:13)  
````

The Java 9 app running under Java 9 should display:

````
Hello Modularized Java 9 App!  
This app is running under Java version 9.0.4

Hello Library - Java 9 code!  
The library is running under Java version 9.0.4

The stack is:  
javaNine/kata.lib.HelloLib.doSomething(HelloLib.java:12)  
app9mod/kata.app9mod.HelloApp9Mod.main(HelloApp9Mod.java:13)  

Comics are:  
[Moe, Larry, Curly]  
[Laurel, Hardy]
````

The Java 9 app running under Java 10 should display:
````
Hello Modularized Java 9 App!
This app is running under Java version 10

Hello Library - Java 10 code!
The library is running under Java version 10

The stack is:
libmod/kata.lib.HelloLib.doSomething(HelloLib.java:13)
app9mod/kata.app9mod.HelloApp9Mod.main(HelloApp9Mod.java:13)

Comics are:
[Moe, Larry, Curly]
[Laurel, Hardy]
To deploy this library and apps:
````

The Java 10 app running under Java 10 should display:
````
Hello Modularized Java 10 App!  
This app is running under Java version 10

Hello Library - Java 10 code!  
The library is running under Java version 10

The stack is:  
javaTen/kata.lib.HelloLib.doSomething(HelloLib.java:13)  
app10mod/kata.app10mod.HelloApp10Mod.main(HelloApp10Mod.java:13)

Comics are:  
[Moe, Larry, Curly]  
[Laurel, Hardy]
````

- To run all of these examples, you must have installed on your destination computer:  
    - JRE 7
    - JRE 9
    - JRE 10

1. Copy to the destination computer and directory:  
    lib.jar  
    app7.jar  
    appmod9.jar  
    appmod10.jar  
    run.sh  
    run7.sh  
    run9.sh  
    run10.sh  
    run7from9.sh  
    run7from10.sh  
    run9from10.sh
2. At the command line, cd to that location
3. At the command line, to run ***all*** the apps in sequence, execute: run.sh

The results should display as above.

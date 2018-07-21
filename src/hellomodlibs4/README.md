This is a Multi-release library 
called by a Java 7 app and by a non-modularized Java 9 app.

A Multi-release library contains:  
- Base code for one Java release, compiled by that release
- Also code for one or more other Java releases, compiled by each of those releases

The JVM decides at runtime which to use.  

The library we build here has code for:

- Java 7
- Java 9

The Java 7 version of the library uses the old Thread way of determining the current stack.  
The Java 9 version of the library uses the current StackWalker way.

When the library is called from an app running under Java 7, 
the library's Java 7 code is used.  
When the library is called from an app running under Java 9, 
the library's Java 9 code is used.

***The Java 9 library code is modularized***, 
but this is not necessary for calling it from a non-modularized Java 9 app, 
just from modularized apps.

I do it here to demonstrate that modularizing this code has no ill effects
when called from a non-modularized Java 9 app.

To build and run this library and the two apps that use it:

- You must have the Java 9 JDK or later installed
- You must have the Java 7 JDK installed

1. Copy the src directory tree to your destination location
2. Copy build.sh to that location
3. Copy run7.sh and run9.sh to that location
4. At the command line, execute: build.sh

The library and both apps should build.

5. At the command line, execute: run7.sh

The Java 7 app and library should display:
````
Hello Java 7 App Using a Java 7 and 9 Versioned Library!  
This app is running under Java version 1.7.0_80  
Hello Library - Java 7!  
The library is running under Java version 1.7.0_80  
The stack is:  
java.lang.Thread.getStackTrace(Thread.java:1589)  
kata.lib.HelloLib.doSomething(HelloLib.java:9)  
kata.app7.HelloApp7.main(HelloApp7.java:12)  
````
6. At the command line, execute: run9.sh

The Java 9 app and library should display:
````
Hello Non-Modularized Java 9 App Using a Java 7 and 9 Versioned Library!  
This app is running under Java version 9.0.4  
Hello Library - Java 9!  
The library is running under Java version 9.0.4  
The stack is:  
kata.lib.HelloLib.doSomething(HelloLib.java:9)  
kata.app9.HelloApp9.main(HelloApp9.java:12) 
````
To deploy this library and apps:

- You must have installed on the destination computer a Java JRE version 9 or later.

1. Copy to the destination computer and directory  
lib.jar  
app7.jar  
app9.jar  
run7.sh  
run9.sh  
run.sh

2. At the command line, cd to that location
3. At the command line, execute: run7.sh

The Java 7 app and library should display as above.

4. At the command line, execute: run9.sh

The Java 9 app and library should display as above.

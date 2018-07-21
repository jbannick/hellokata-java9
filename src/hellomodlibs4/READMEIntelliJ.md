This describes how to build this Multi-release library using IntelliJ.

It's based on:
https://blog.jetbrains.com/idea/2017/10/creating-multi-release-jar-files-in-intellij-idea/

The key operational elements are:

- The term "module" is overloaded here
    - IntelliJ modules are separately executable collections of code
    - Java modules are collections of Java packages
- This project uses one IntelliJ module for each of the four executable elements
- There are separate JDK settings for:
    - Your IntelliJ installation
    - This project
    - Each of this project's four IntelliJ modules
- The IntelliJ java9 (library) module compile outputs to the root (library) META-INF/versions/9 directory
    
The rest of this description consists of pictures.

#### Project Structure:

![Project Structure](images/LIB4ProjectStructure.png)

#### JDK Settings:

###### IntelliJ Installation Java Compiler

![IntelliJ Java Compiler](images/IntelliJJavaCompiler.png)

##### Project JDK

![Library Project JDK](images/LIB4ProjectJDK.png)

###### Library Root Version

![Library Root Version Sources](images/LIB4RootLibSrcs.png)

![Library Root Version Paths](images/LIB4RootLibPaths.png)

![Library Root Version Dependencies](images/LIB4RootLibDeps.png)

###### Library Java 9 Version

![Library Java 9 Version Sources](images/LIB4Java9LibSrcs2.png)

![Library Java 9 Version Paths](images/LIB4Java9LibPaths.png)

![Library Java 9 Version Dependencies](images/LIB4Java9LibDeps.png)

###### Java 7 App

![Java 7 App Sources](images/LIB4App7Srcs.png)

![Java 7 App Paths](images/LIB4App7Paths.png)

![Java 7 App Dependencies](images/LIB4App7Deps.png)

###### Java 9 App

![Java 9 App Sources](images/LIB4App9Srcs.png)

![Java 9 App Paths](images/LIB4App9Paths.png)

![Java 9 App Dependencies](images/LIB4App9Deps.png)

##### JAR Files

###### App7 JAR

![App7 JAR](images/LIB4App7JAR.png)

###### App9 JAR

![App7 JAR](images/LIB4App9JAR.png)

###### Library JAR

![App7 JAR](images/LIB4LibJAR.png)

#!/usr/bin/env bash
rm -rf out
rm -rf mods
rm -rf lib
rm -rf *.jar
rm -rf app10mod-image-linux
rm -rf app10mod-image-win64
rm -rf app10mod-image-macos
rm -rf app9mod-image-macos

mkdir -p out/lib
mkdir -p out/app7
mkdir -p out/app9mod
mkdir -p out/app10mod

#####################################
# Build the Library
#####################################

# Compile the library's Java 7 code

$JDK7_HOME/bin/javac -d out/lib \
    src/lib_root/kata/lib/HelloLibIF.java \
    src/lib_root/kata/lib/HelloLib.java

cp -r src/lib_root/META-INF out/lib

# Compile the library's Java 9 code

$JDK9_HOME/bin/javac -d out/lib/META-INF/versions/9 \
    src/lib_java9/kata/lib/HelloLibIF.java \
    src/lib_java9/kata/lib/HelloLib.java \
    src/lib_java9/module-info.java

# Compile the library's Java 10 code

$JDK10_HOME/bin/javac -d out/lib/META-INF/versions/10 \
    src/lib_java10/kata/lib/HelloLibIF.java \
    src/lib_java10/kata/lib/HelloLib.java \
    src/lib_java10/module-info.java

# JAR-up the library

jar -cfm lib.jar src/lib_root/META-INF/MANIFEST.MF -C out/lib .

#####################################
# Build the Apps
#####################################

# Compile the Java 7 app and JAR it

$JDK7_HOME/bin/javac -cp lib.jar -d out/app7 \
    src/app7/kata/app7/HelloApp7.java

jar -cfm app7.jar src/app7/META-INF/MANIFEST.MF -C out/app7 .

# Compile the Java 9 app and JAR it

$JDK9_HOME/bin/javac -p . -d out/app9mod \
    src/app9mod/kata/app9mod/HelloApp9Mod.java \
    src/app9mod/module-info.java

jar -cfe appmod9.jar kata.app9mod.HelloApp9Mod -C out/app9mod .

# Compile the Java 10 app and JAR it

$JDK10_HOME/bin/javac -p . -d out/app10mod \
    src/app10mod/kata/app10mod/HelloApp10Mod.java \
    src/app10mod/module-info.java

jar -cfe appmod10.jar kata.app10mod.HelloApp10Mod -C out/app10mod .

#########################################
# Build the Java 9 Custom Image for MacOS
#########################################

$JDK9_HOME/bin/jlink \
--module-path ./:$JDK9_MACOS_HOME/jmods \
--add-modules app9mod \
--add-modules libmod \
--launcher app9mod=app9mod \
--output app9mod-image-macos

##########################################
# Build the Java 10 Custom Image for MacOS
##########################################

$JDK10_HOME/bin/jlink \
--module-path ./:$JDK10_MACOS_HOME/jmods \
--add-modules app10mod \
--add-modules libmod \
--launcher app10mod=app10mod \
--output app10mod-image-macos

##########################################
# Build the Java 10 Custom Image for Win64
##########################################

$JDK10_HOME/bin/jlink \
--module-path ./:$JDK10_WIN64_HOME/jmods \
--add-modules app10mod \
--add-modules libmod \
--launcher app10mod=app10mod \
--output app10mod-image-win64

##########################################
# Build the Java 10 Custom Image for Linux
##########################################

$JDK10_HOME/bin/jlink \
--module-path ./:$JDK10_LINUX_HOME/jmods \
--add-modules app10mod \
--add-modules libmod \
--launcher app10mod=app10mod \
--output app10mod-image-linux

#!/usr/bin/env bash
mkdir -p out/lib
mkdir -p out/app

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

# JAR-up the library

jar -cfm lib.jar src/lib_root/META-INF/MANIFEST.MF -C out/lib .

# Compile the Java 7 app and JAR it

$JDK7_HOME/bin/javac -cp lib.jar -d out/app \
    src/app7/kata/app7/HelloApp7.java

jar -cfm app7.jar src/app7/META-INF/MANIFEST.MF -C out/app .

# Compile the Java 9 app and JAR it

$JDK9_HOME/bin/javac -cp lib.jar -d out/app \
    src/app9/kata/app9/HelloApp9.java

jar -cfm app9.jar src/app9/META-INF/MANIFEST.MF -C out/app .

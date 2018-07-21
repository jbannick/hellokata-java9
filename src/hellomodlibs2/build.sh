#!/usr/bin/env bash
rm -rf out
rm -rf *.jar

mkdir -p out

# Build the modularized lib
javac -d out/libmod \
    src/libmod/kata/lib/HelloModLibSimplest.java \
    src/libmod/module-info.java

jar -cf libmod.jar -C out/libmod .

# Build the modularized app
javac -d out/appmod \
    -p libmod.jar \
    src/appmod/kata/app/HelloModLibAppSimplest2.java \
    src/appmod/module-info.java

jar -cfe appmod.jar kata.app.HelloModLibAppSimplest2 -C out/appmod .

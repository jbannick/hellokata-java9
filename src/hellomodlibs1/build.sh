#!/usr/bin/env bash
rm -rf out
rm -rf *.jar

mkdir -p out

# Build the modularized lib
javac -d out/libmod \
    src/libmod/kata/lib/HelloModLibSimplest.java \
    src/libmod/module-info.java

jar -cf libmod.jar -C out/libmod .

# Build the non-modularized app
javac -d out/app \
    -cp libmod.jar \
    src/app/kata/app/HelloModLibAppSimplest1.java

jar -cfm app.jar src/app/META-INF/MANIFEST.MF -C out/app .

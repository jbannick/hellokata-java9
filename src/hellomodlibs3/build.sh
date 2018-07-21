#!/usr/bin/env bash
mkdir -p out
mkdir -p mods

rm -rf appmod-image

# Build the modularized lib
javac -d out/libmod \
    src/libmod/kata/lib/HelloModLibSimplest.java \
    src/libmod/module-info.java

jar -cf mods/libmod.jar -C out/libmod .

# Build the modularized app
javac --module-path mods -d out/appmod \
    src/appmod/kata/app/HelloModLibAppSimplest3.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar kata.app.HelloModLibAppSimplest3 -C out/appmod .

$JAVA_HOME/bin/jlink \
--module-path mods/:$JAVA_HOME/jmods \
--add-modules appmod \
--add-modules libmod \
--launcher appmod=appmod \
--output appmod-image

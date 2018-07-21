#!/usr/bin/env bash
rm -rf out
rm -rf mods
rm -rf appmod-image

mkdir -p out
mkdir -p mods

# Build engine module
javac -d out/engmod \
    src/engmod/kata/eng/Engine.java \
    src/engmod/module-info.java

jar -cfe mods/engmod.jar \
    kata.eng.Engine \
    -C out/engmod .

# Build app module
javac -d out/appmod \
    --module-path mods \
    src/appmod/kata/app/HelloMultiModAppImage.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar \
    kata.app.HelloMultiModAppImage \
    -C out/appmod .

# Build the custom runtime image

$JAVA_HOME/bin/jlink \
--module-path mods/:$JAVA_HOME/jmods \
--add-modules appmod \
--add-modules engmod \
--launcher appmod=appmod \
--output appmod-image

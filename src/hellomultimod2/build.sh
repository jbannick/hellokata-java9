#!/usr/bin/env bash
rm -rf out
rm -rf *.jar

rm -rf out
mkdir -p out

# Build api module
javac -d out/apimod \
src/apimod/kata/api/Engine.java \
src/apimod/module-info.java

jar -cfe apimod.jar \
kata.api.Engine \
-C out/apimod .

# Build engine 1 module
javac --module-path . \
    -d out/eng1mod \
    src/eng1mod/kata/eng1/Engine1.java \
    src/eng1mod/module-info.java

jar -cfe eng1mod.jar \
    kata.eng1.Engine1 \
    -C out/eng1mod .

# Build engine 2 module
javac --module-path . \
    -d out/eng2mod \
    src/eng2mod/kata/eng2/Engine2.java \
    src/eng2mod/module-info.java

jar -cfe eng2mod.jar \
    kata.eng2.Engine2 \
    -C out/eng2mod .

# Build app module
javac -d out/appmod \
    --module-path . \
    src/appmod/kata/app/HelloMultiModSvcsApp.java \
    src/appmod/module-info.java

jar -cfe appmod.jar \
    kata.app.HelloMultiModSvcsApp \
    -C out/appmod .

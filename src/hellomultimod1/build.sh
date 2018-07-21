#!/usr/bin/env bash
rm -rf out
rm -rf *.jar

rm -rf out
mkdir -p out

# Build engine module
javac -d out/engmod \
    src/engmod/kata/eng/Engine.java \
    src/engmod/module-info.java

jar -cfe engmod.jar \
    kata.eng.Engine \
    -C out/engmod .

# Build app module
javac -d out/appmod \
    --module-path . \
    src/appmod/kata/app/HelloMultiModApp1.java \
    src/appmod/module-info.java

jar -cfe appmod.jar \
    kata.app.HelloMultiModApp1 \
    -C out/appmod .

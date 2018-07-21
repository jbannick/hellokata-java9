#!/usr/bin/env bash
rm -rf out
rm -rf mods
rm -rf appmod-image

mkdir -p out
mkdir -p mods

javac -d out \
    src/appmod/kata/app/HelloModulesImage.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar kata.app.HelloModulesImage -C out .

$JAVA_HOME/bin/jlink \
--module-path mods/:$JAVA_HOME/jmods \
--add-modules appmod \
--launcher appmod=appmod \
--output appmod-image

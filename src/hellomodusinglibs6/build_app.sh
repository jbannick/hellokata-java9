#!/usr/bin/env bash
rm -rf out
rm -rf work

javac --module-path mods -d out \
    src/appmod/kata/app/HelloModUsingLibs6.java \
    src/appmod/kata/app/CSVReader.java \
    src/appmod/kata/app/JSONWriter.java \
    src/appmod/kata/app/Person.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar kata.app.HelloModUsingLibs6 -C out .


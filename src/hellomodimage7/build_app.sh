#!/usr/bin/env bash

javac --module-path mods -d out \
    src/appmod/kata/app/HelloModImageUsingLibs.java \
    src/appmod/kata/app/CSVReader.java \
    src/appmod/kata/app/JSONWriter.java \
    src/appmod/kata/app/Person.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar kata.app.HelloModImageUsingLibs -C out .

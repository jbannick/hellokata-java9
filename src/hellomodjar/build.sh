#!/usr/bin/env bash
rm -f *.jar
rm -rf out

mkdir -p out

javac --module-path . -d out --module-source-path src -m appmod\
    src/appmod/kata/app/HelloModJAR.java \
    src/appmod/module-info.java

jar -cfe appmod.jar kata.app.HelloModJAR -C out/appmod .

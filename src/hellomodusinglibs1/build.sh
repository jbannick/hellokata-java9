#!/usr/bin/env bash
rm -f *.jar
rm -rf out
mkdir -p out

cp $LOG4J2_HOME/log4j-api-2.11.0.jar .

javac --module-path . -d out --module-source-path src -m appmod

jar -cfe appmod.jar kata.app.HelloModUsingLibs1 -C out/appmod .

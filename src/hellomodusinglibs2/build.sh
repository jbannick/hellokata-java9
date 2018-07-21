#!/usr/bin/env bash
rm -f *.jar
rm -rf out
mkdir -p out/appmod

cp $LOG4J2_HOME/log4j-api-2.11.0.jar .
cp $LOG4J2_HOME/log4j-core-2.11.0.jar .

cp src/log4j2.xml out/appmod

javac --module-path . -d out --module-source-path src -m appmod

jar -cfe appmod.jar kata.app.HelloModUsingLibs2 -C out/appmod .

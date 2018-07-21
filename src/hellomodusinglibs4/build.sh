#!/usr/bin/env bash
rm -f *.jar
rm -rf out
mkdir -p out

cp $LOG4J2_HOME/log4j-api-2.11.0.jar .
cp $LOG4J2_HOME/log4j-core-2.11.0.jar .

cp $EBUS_HOME/eventbus-1.4.jar .

cp $CSV_HOME/commons-csv-1.5.jar .

cp $JSON_HOME/jackson-core-2.9.0.jar .
cp $JSON_HOME/jackson-annotations-2.9.0.jar .

cp $JSON_HOME/jackson-databind-2.9.0.jar .

javac --module-path . -d out --module-source-path src -m appmod

cp log4j2.xml out/appmod

jar -cfe appmod.jar kata.app.HelloModUsingLibs4 -C out/appmod .

#!/usr/bin/env bash
rm -rf out
rm -rf mods
rm -rf lib
rm -rf *.jar
rm -rf work
rm -rf appmod-image
rm -rf commons.csv

mkdir -p out
mkdir -p mods
mkdir -p work
rm -rf appmod-image

cp $CSV_HOME/commons-csv-1.5.jar work

cd work

jar -xf commons-csv-1.5.jar

cd ..

$JAVA_HOME/bin/jdeps --generate-module-info . work/commons-csv-1.5.jar

javac commons.csv/module-info.java -d work

cd work

jar -uf commons-csv-1.5.jar module-info.class

cp commons-csv-1.5.jar ../mods

cd ..

javac --module-path mods -d out \
    src/appmod/kata/app/HelloModImageUsingLib2.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar kata.app.HelloModImageUsingLib2 -C out .

$JAVA_HOME/bin/jlink \
--module-path mods/:$JAVA_HOME/jmods \
--add-modules appmod \
--add-modules commons.csv \
--launcher appmod=appmod \
--output appmod-image

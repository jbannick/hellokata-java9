#!/usr/bin/env bash

cd $ROOT_DIR

rm -rf out
rm -rf work

mkdir -p out
mkdir -p work

rm -rf $ROOT_DIR/mods/commons-csv-1.5.jar

cp $CSV_HOME/commons-csv-1.5.jar work

cd work

jar -xf commons-csv-1.5.jar

cd $ROOT_DIR

$JAVA_HOME/bin/jdeps --generate-module-info . work/commons-csv-1.5.jar

javac commons.csv/module-info.java -d work

cd work

jar -uf commons-csv-1.5.jar module-info.class

cp commons-csv-1.5.jar ../mods

cd $ROOT_DIR

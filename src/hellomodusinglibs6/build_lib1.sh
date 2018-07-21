#!/usr/bin/env bash

cd $ROOT_DIR

rm -rf out
rm -rf work

mkdir -p out
mkdir -p work

cp $EBUS_HOME/eventbus-1.4.jar work

cd work

jar -xf eventbus-1.4.jar

cd $ROOT_DIR

rm -rf $ROOT_DIR/mods/eventbus-1.4.jar

$JAVA_HOME/bin/jdeps --generate-module-info . work/eventbus-1.4.jar

javac eventbus/module-info.java -d work

cd work

jar -uf eventbus-1.4.jar module-info.class

cp eventbus-1.4.jar ../mods

cd $ROOT_DIR

#!/usr/bin/env bash

cd $ROOT_DIR

rm -rf out
rm -rf work

mkdir -p out
mkdir -p work

cp $JSON_HOME/jackson-annotations-2.9.0.jar libs
cp $JSON_HOME/jackson-core-2.9.0.jar libs
cp $JSON_HOME/jackson-databind-2.9.0.jar libs

# ------------------------------------------
# create jackson-annotations modularized jar

rm -rf $ROOT_DIR/mods/jackson.annotations.jar

$JAVA_HOME/bin/jdeps --generate-module-info $ROOT_DIR/work $ROOT_DIR/libs/jackson-annotations-2.9.0.jar

cp $ROOT_DIR/libs/jackson-annotations-2.9.0.jar $ROOT_DIR/mods/jackson.annotations.jar

rm -rf classes
mkdir classes
cd $ROOT_DIR/classes
jar -xf $ROOT_DIR/libs/jackson-annotations-2.9.0.jar

cd $ROOT_DIR/work/jackson.annotations
javac -p jackson.annotations -d $ROOT_DIR/classes module-info.java

jar -uf $ROOT_DIR/mods/jackson.annotations.jar -C $ROOT_DIR/classes module-info.class

cd $ROOT_DIR

# -----------------------------------
# create jackson-core modularized jar

rm -rf $ROOT_DIR/mods/jackson.core.jar

$JAVA_HOME/bin/jdeps --generate-module-info $ROOT_DIR/work $ROOT_DIR/libs/jackson-core-2.9.0.jar

cp $ROOT_DIR/libs/jackson-core-2.9.0.jar $ROOT_DIR/mods/jackson.core.jar

rm -rf classes
mkdir classes
cd $ROOT_DIR/classes
jar -xf $ROOT_DIR/libs/jackson-core-2.9.0.jar

cd $ROOT_DIR/work/jackson.core
javac -p jackson.core -d $ROOT_DIR/classes module-info.java

jar -uf $ROOT_DIR/mods/jackson.core.jar -C $ROOT_DIR/classes module-info.class

cd $ROOT_DIR

# ---------------------------------------
# create jackson-databind modularized jar

rm -rf $ROOT_DIR/mods/jackson.databind.jar

jdeps --module-path $ROOT_DIR/mods --add-modules jackson.annotations,jackson.core --generate-module-info work $ROOT_DIR/libs/jackson-databind-2.9.0.jar

cp $ROOT_DIR/libs/jackson-databind-2.9.0.jar $ROOT_DIR/mods/jackson.databind.jar

rm -rf classes
mkdir classes
cd $ROOT_DIR/classes
jar -xf $ROOT_DIR/libs/jackson-databind-2.9.0.jar

cd $ROOT_DIR/work/jackson.databind
javac --module-path $ROOT_DIR/mods --add-modules jackson.annotations,jackson.core -d $ROOT_DIR/classes module-info.java

jar -uf $ROOT_DIR/mods/jackson.databind.jar -C $ROOT_DIR/classes module-info.class

cd $ROOT_DIR

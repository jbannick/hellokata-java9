#!/usr/bin/env bash
rm -rf out
rm -rf libs
rm -rf *.jar
rm -rf appmod-image
rm -rf classes
rm -rf work
rm -rf mods

mkdir -p out
mkdir -p mods
mkdir -p libs
mkdir -p work
rm -rf appmod-image

ROOT_DIR=$PWD

cp $JSON_HOME/jackson-annotations-2.9.0.jar libs
cp $JSON_HOME/jackson-core-2.9.0.jar libs
cp $JSON_HOME/jackson-databind-2.9.0.jar libs

# ------------------------------------------
# create jackson-annotations modularized jar

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

# --------------------------------------
# create jackson-databind modularied jar

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

javac --module-path mods -d out \
    src/appmod/kata/app/HelloModImageUsingLib3.java \
    src/appmod/kata/app/Person.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar kata.app.HelloModImageUsingLib3 -C out .

$JAVA_HOME/bin/jlink \
    --module-path mods/:$JAVA_HOME/jmods \
    --add-modules appmod \
    --add-modules jackson.databind \
    --add-modules jackson.core \
    --add-modules jackson.annotations \
    --launcher appmod=appmod \
    --output appmod-image

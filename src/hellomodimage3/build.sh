#!/usr/bin/env bash
rm -rf out
rm -rf mods
rm -rf work
rm -rf eventbus
rm -rf appmod-image*

mkdir -p out
mkdir -p mods
mkdir -p work
rm -rf appmod-image

cp $EBUS_HOME/eventbus-1.4.jar work

cd work

jar -xf eventbus-1.4.jar

cd ..

$JAVA_HOME/bin/jdeps --generate-module-info . work/eventbus-1.4.jar

javac eventbus/module-info.java -d work

cd work

jar -uf eventbus-1.4.jar module-info.class

cp eventbus-1.4.jar ../mods

cd ..

javac --module-path mods -d out \
    src/appmod/kata/app/HelloModImageUsingLib1.java \
    src/appmod/kata/app/Publisher.java \
    src/appmod/kata/app/Subscriber.java \
    src/appmod/module-info.java

jar -cfe mods/appmod.jar kata.app.HelloModImageUsingLib1 -C out .

$JAVA_HOME/bin/jlink \
--module-path mods/:$JAVA_HOME/jmods \
--add-modules appmod \
--add-modules eventbus \
--launcher appmod=appmod \
--output appmod-image

#!/usr/bin/env bash
rm -rf out
rm -rf work
rm -f *.jar

mkdir -p out
mkdir -p work

# This is the hack
cp $EBUS_HOME/eventbus-1.4.jar work

cd work
jar -xf eventbus-1.4.jar
cd ..

$JAVA_HOME/bin/jdeps --generate-module-info . work/eventbus-1.4.jar

javac eventbus/module-info.java -d work

cd work
jar -uf eventbus-1.4.jar module-info.class
cp eventbus-1.4.jar ..
cd ..

# End of HACK

javac --module-path . -d out --module-source-path src -m appmod\
    src/appmod/kata/app/HelloModUsingLibs5.java \
    src/appmod/kata/app/Publisher.java \
    src/appmod/kata/app/Subscriber.java \
    src/appmod/module-info.java

jar -cfe appmod.jar kata.app.HelloModUsingLibs5 -C out/appmod .

rm -rf work

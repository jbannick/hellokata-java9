#!/usr/bin/env bash
rm -f *.jar
rm -rf out
mkdir -p out

cp $EBUS_HOME/eventbus-1.4.jar .

javac --module-path . -d out --module-source-path src -m appmod\
    src/appmod/kata/app/HelloModUsingLib3.java \
    src/appmod/kata/app/Publisher.java \
    src/appmod/kata/app/Subscriber.java \
    src/appmod/module-info.java

jar -cfe appmod.jar kata.app.HelloModUsingLib3 -C out/appmod .

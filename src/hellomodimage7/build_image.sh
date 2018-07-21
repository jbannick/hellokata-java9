#!/usr/bin/env bash

$JAVA_HOME/bin/jlink \
    --module-path mods/:$JAVA_HOME/jmods \
    --add-modules appmod \
    --add-modules eventbus \
    --add-modules commons.csv \
    --add-modules jackson.databind \
    --add-modules jackson.core \
    --add-modules jackson.annotations \
    --add-modules org.apache.logging.log4j \
    --launcher appmod=appmod \
    --output appmod-image

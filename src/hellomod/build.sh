#!/usr/bin/env bash
rm -rf out
mkdir -p out

javac -d out --module-source-path src -m appmod

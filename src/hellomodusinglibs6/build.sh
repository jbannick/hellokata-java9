#!/usr/bin/env bash

rm -rf out
rm -rf mods
rm -rf libs
rm -rf work
rm -rf classes

mkdir -p out
mkdir -p mods
mkdir -p libs
mkdir -p work

ROOT_DIR=$PWD

. build_lib1.sh
. build_lib2.sh
. build_lib3.sh
. build_lib4.sh
. build_app.sh

cp mods/*.jar .

rm -rf out
rm -rf libs
rm -rf work
rm -rf classes



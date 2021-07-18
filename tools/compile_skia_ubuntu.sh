#!/bin/bash

# expects an environment variable SKIA_BUILD_DIR, code will be cloned into there and artifacts will be there
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

apt-get install -y ninja-build build-essential freeglut3-dev libfontconfig-dev libfreetype6-dev libgif-dev libgl1-mesa-dev libglu1-mesa-dev libharfbuzz-dev libicu-dev libjpeg-dev libpng-dev libwebp-dev

git clone https://github.com/UnGast/skia.git $SKIA_BUILD_DIR

cd $SKIA_BUILD_DIR

python2 tools/git-sync-deps

rm /usr/bin/python
ln -s /usr/bin/python2.7 /usr/bin/python

bin/gn gen out/Static

cp $SCRIPT_DIR/ubuntu_build_args out/Static/args.gn

ninja -C out/Static
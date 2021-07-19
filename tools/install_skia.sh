#!/bin/bash
# argument 1: version
# argument 2: platform
echo $1
echo $2

if [ -z $1 ]
then
echo "first argument 'version' missing"
exit 1
fi

if [ -z $2 ]
then
echo "second argument 'platform' missing"
exit 1
fi

wget https://github.com/UnGast/SkiaKit/releases/download/$1/libskia_$2.a -o libskia_skiakit.a
cp libskia_skiakit.a /usr/local/lib/libskia_skiakit.a
rm libskia_skiakit.a
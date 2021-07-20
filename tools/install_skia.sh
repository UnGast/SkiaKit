#!/bin/bash
# argument 1: platform
# argument 2: version
echo $1
echo $2

if [ -z $1 ]
then
echo "first argument 'platform' missing"
exit 1
fi

if [ -z $2 ]
then
echo "second argument 'version' missing"
exit 1
fi

DOWNLOAD_URL=https://github.com/UnGast/SkiaKit/releases/download/$2/libskia_$1.a
curl -L $DOWNLOAD_URL --output libskia_skiakit.a
cp libskia_skiakit.a /usr/lib/libskia_skiakit.a
rm libskia_skiakit.a
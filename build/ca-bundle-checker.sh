#!/usr/bin/env bash

echo
echo "Fetching latest ca-bundle.crt ..."
curl -o resources/config/ca-bundle.crt https://curl.haxx.se/ca/cacert.pem

echo
files=`git diff --name-only`
for file in $files
do
    echo "CA bundle is not up to date."
    echo "Please run: bash build/ca-bundle-checker.sh"
    echo "And commit the result"
    exit 1
done

echo "CA bundle is up to date."
exit 0

#!/usr/bin/env bash

curl -L "https://storage.googleapis.com/dart-archive/channels/stable/release/3.13.5/sdk/dartsdk-linux-x64-release.zip" -o dart.zip

unzip dart.zip
rm dart.zip

cp -r dart-sdk/* .
rm -rf dart-sdk

chmod -R +rx bin
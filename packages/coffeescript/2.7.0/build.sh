#!/bin/bash

# Download and install NodeJS
curl "https://nodejs.org/dist/v26.12.0/node-v26.12.0-linux-x64.tar.xz" -o node.tar.xz
tar xf node.tar.xz --strip-components=1
rm node.tar.xz
export PATH=$PWD/bin:$PATH

# Install CoffeeScript via npm and done
npm install --global coffeescript@2.7.0

#!/usr/bin/env bash

# Download and extract JDK 25 (LTS)
curl -L "https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.4.1%2B1/OpenJDK25U-jdk_x64_linux_hotspot_25.0.4.1_1.tar.gz" -o jdk.tar.gz
tar xzf jdk.tar.gz --strip-components=1
rm jdk.tar.gz

# Download and extract Scala 3
curl -L "https://github.com/lampepfl/dotty/releases/download/3.10.0/scala3-3.10.0.tar.gz" -o scala.tar.gz
tar -xzf scala.tar.gz --strip-components=1
rm scala.tar.gz
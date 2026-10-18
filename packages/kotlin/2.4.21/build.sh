#!/usr/bin/env bash

# Download and extract JDK 25 (LTS)
curl -L "https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.4.1%2B1/OpenJDK25U-jdk_x64_linux_hotspot_25.0.4.1_1.tar.gz" -o jdk.tar.gz
tar xzf jdk.tar.gz --strip-components=1
rm jdk.tar.gz

# Download and extract Kotlin
curl -L "https://github.com/JetBrains/kotlin/releases/download/v2.4.21/kotlin-compiler-2.4.21.zip" -o kotlin.zip
unzip kotlin.zip
rm kotlin.zip
cp -r kotlinc/* .
rm -rf kotlinc
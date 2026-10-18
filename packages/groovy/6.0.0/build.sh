#!/bin/bash

# Groovy depends on JDK8+
mkdir -p java
cd java
curl -L "https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.4.1%2B1/OpenJDK25U-jdk_x64_linux_hotspot_25.0.4.1_1.tar.gz" -o java.tar.gz
tar xzf java.tar.gz --strip-components=1
rm java.tar.gz
cd ..

# Download Groovy binaries
curl -L "https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-6.0.0.zip" -o groovy.zip
unzip -q groovy.zip
rm groovy.zip

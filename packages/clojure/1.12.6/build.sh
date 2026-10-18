#!/usr/bin/env bash

# Installation location
PREFIX=$(realpath $(dirname $0))

# Clojure depends on Java (build and runtime)
mkdir -p java
cd java
curl -L "https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.4.1%2B1/OpenJDK25U-jdk_x64_linux_hotspot_25.0.4.1_1.tar.gz" -o java.tar.gz
tar xzf java.tar.gz --strip-components=1
rm java.tar.gz
cd ..

# Clojure depends on Maven (build)
mkdir -p maven
cd maven
curl "https://repo1.maven.org/maven2/org/apache/maven/apache-maven/3.9.11/apache-maven-3.9.11-bin.tar.gz" -o maven.tar.gz
tar xzf maven.tar.gz --strip-components=1
rm maven.tar.gz
cd ..

# Adding java and maven to the path for building
export PATH=$PWD/java/bin:$PWD/maven/bin:$PATH
export JAVA_HOME=$PWD/java

# Clojure source
mkdir -p build
cd build
curl -L "https://github.com/clojure/clojure/archive/refs/tags/clojure-1.12.6.tar.gz" -o clojure.tar.gz
tar xzf clojure.tar.gz --strip-components=1
rm clojure.tar.gz

# Build using maven
mvn -Plocal -Dmaven.test.skip=true package

# Move the jar and its runtime dependencies for easier reference
cd ../
mkdir -p bin
mv build/clojure.jar bin
curl -L "https://repo1.maven.org/maven2/org/clojure/spec.alpha/0.5.238/spec.alpha-0.5.238.jar" -o bin/spec.alpha.jar
curl -L "https://repo1.maven.org/maven2/org/clojure/core.specs.alpha/0.4.74/core.specs.alpha-0.4.74.jar" -o bin/core.specs.alpha.jar
rm -rf ~/.m2 maven build

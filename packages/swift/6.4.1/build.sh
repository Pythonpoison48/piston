#!/usr/bin/env bash

# Binary install
curl -L "https://download.swift.org/swift-6.4.1-release/ubuntu2404/swift-6.4.1-RELEASE/swift-6.4.1-RELEASE-ubuntu24.04.tar.gz" -o swift.tar.gz
tar xzf swift.tar.gz --strip-components=2
rm swift.tar.gz

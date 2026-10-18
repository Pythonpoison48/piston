#!/usr/bin/env bash

curl "https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.402/dotnet-sdk-10.0.402-linux-x64.tar.gz" -Lo dotnet.tar.gz
tar xzf dotnet.tar.gz --strip-components=1
rm dotnet.tar.gz

# Cache nuget packages
export DOTNET_CLI_HOME=$PWD
# The build image does not ship libicu; the runtime image does.
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
./dotnet new console -o cache_application
./dotnet new console -lang F# -o fs_cache_application
./dotnet new console -lang VB -o vb_cache_application
# This calls a restore on the global-packages index ($DOTNET_CLI_HOME/.nuget/packages)
# If we want to allow more packages, we could add them to this cache_application

rm -rf cache_application fs_cache_application vb_cache_application
# Get rid of it, we don't actually need the application - just the restore

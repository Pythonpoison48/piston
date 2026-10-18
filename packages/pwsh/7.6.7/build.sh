#!/bin/bash
curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.6.7/powershell-7.6.7-linux-x64.tar.gz -o powershell.tar.gz
tar zxf powershell.tar.gz
rm powershell.tar.gz

chmod +x pwsh

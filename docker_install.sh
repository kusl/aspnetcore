#!/bin/bash
# We need to install dependencies only for Docker
[[ ! -e /.dockerenv ]] && [[ ! -e /.dockerinit ]] && exit 0
set -xe
apt-get update -yqq
apt-get upgrade -yqq
apt-get install git -yqq
#install dotnet 
apt-get install curl libunwind8 gettext -yqq
curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=835021
mkdir -p /opt/dotnet && tar zxf dotnet.tar.gz -C /opt/dotnet
find /opt/dotnet -name '*.so' -type f -print | xargs ldd | grep 'not found'
sh -c 'echo "deb http://llvm.org/apt/jessie/ llvm-toolchain-jessie-3.6 main" > /etc/apt/sources.list.d/llvm-toolchain.list'
sh -c 'echo "deb-src http://llvm.org/apt/jessie/ llvm-toolchain-jessie-3.6 main" > /etc/apt/sources.list.d/llvm-toolchain.list'
apt-get update && apt-get install liblldb-3.6
sh -c 'echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
apt-get update
apt-get install dotnet=1.0.0.001598-1
ln -s /opt/dotnet/dotnet /usr/local/bin
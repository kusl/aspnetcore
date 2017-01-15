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
ln -s /opt/dotnet/dotnet /usr/local/bin
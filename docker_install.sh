#!/bin/bash
# We need to install dependencies only for Docker
[[ ! -e /.dockerenv ]] && [[ ! -e /.dockerinit ]] && exit 0
set -xe
apt-get update -yqq
apt-get upgrade -yqq
apt-get install git -yqq
#install dotnet 
apt-get install curl libunwind8 gettext
curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=835021
sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
sudo ln -s /opt/dotnet/dotnet /usr/local/bin
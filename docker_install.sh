#!/bin/bash
# We need to install dependencies only for Docker
[[ ! -e /.dockerenv ]] && [[ ! -e /.dockerinit ]] && exit 0
set -xe
apt-get update -yqq
apt-get upgrade -yqq
apt-get install git -yqq
#install dotnet 
sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
apt-get install apt-transport-https -yqq
apt-get update -yqq
apt-get install dotnet-dev-1.0.0-preview2.1-003177 -yqq
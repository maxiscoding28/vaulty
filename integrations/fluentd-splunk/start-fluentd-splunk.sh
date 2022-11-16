#!/bin/bash
Blue='\033[0;34m'
Green='\033[0;32m' 
Color_Off='\033[0m'

echo -e ${Blue}Starting fluentd${Color_Off}
docker-compose -p fluentd-splunk -f /Users/maxwinslow/dev/docker-k8s/vaulty/fluentd-splunk/docker-compose.yml up -d


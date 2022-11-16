#!/bin/bash
Blue='\033[0;34m'
Green='\033[0;32m' 
Color_Off='\033[0m'

docker-compose -p agent -f /Users/maxwinslow/dev/docker-k8s/vaulty/agent/docker-compose.yml up -d
echo -e ${Blue}Vault agent started${Color_Off}
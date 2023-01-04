#!/bin/bash
Red='\033[1;31m'
Color_Off='\033[0m'

docker-compose -p fluentd-splunk down
echo -e ${Red}Stopped fluentd-splunk${Color_Off}


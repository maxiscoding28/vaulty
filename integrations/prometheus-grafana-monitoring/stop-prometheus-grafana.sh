#!/bin/bash
Red='\033[1;31m'
Color_Off='\033[0m'

docker-compose -p prometheus-grafana down
echo -e ${Red}Stopped prometheus-grafana${Color_Off}
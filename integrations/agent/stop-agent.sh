#!/bin/bash
Red='\033[1;31m'
Color_Off='\033[0m'

docker-compose -p agent down 
echo -e ${Red}Stopped vault agent${Color_Off}
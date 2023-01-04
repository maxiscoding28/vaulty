#!/bin/bash
Red='\033[1;31m'
Color_Off='\033[0m'

docker-compose -p mysql down 
echo -e ${Red}Stopped Mysql${Color_Off}
#!/bin/bash
Red='\033[0;31m' 
Yellow='\033[1;33m'
Color_Off='\033[0m'

docker-compose -p dr down -v
rm -f ./init.json
rm -rf data/data0/* data/data1/* data/data2/*
> logs/vault.log
echo -e ${Yellow}Removing files${Color_Off}
echo -e ${Red}Stopped dr cluster${Color_Off}
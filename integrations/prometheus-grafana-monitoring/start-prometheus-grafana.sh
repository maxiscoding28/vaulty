#!/bin/bash
Blue='\033[0;34m'
Green='\033[0;32m' 
Color_Off='\033[0m'

echo -e ${Blue}Starting prometheus-grafana${Color_Off}
docker-compose -p prometheus-grafana -f /Users/maxwinslow/dev/repros/vaulty/integrations/prometheus-grafana-monitoring/docker-compose.yml up -d


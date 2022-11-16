#!/bin/bash
Green='\033[0;32m' 
Yellow='\033[1;33m'
Red='\033[0;31m' 
Color_Off='\033[0m'

docker network inspect vaulty-net > /dev/null
NETWORK_CHECK_EXIT_CODE=$?
if [[ "$NETWORK_CHECK_EXIT_CODE" == 1 ]]
then
    echo -e ${Red}You must create the vaulty-network first. Refer to the readme in the root project directory.${Color_Off}
else
    docker-compose -p pr up -d
    echo -e ${Yellow}Initializing pr cluster${Color_Off}
    sleep 2
    VAULT_ADDR=http://127.0.0.1:8212 vault operator init -format=json -key-shares=1 -key-threshold=1 | jq -r > ./init.json
    echo -e ${Green}Cluster initialized. Init output saved to ./init.json${Color_Off}
    echo -e ${Yellow}Unsealing vault.${Color_Off}
    VAULT_ADDR=http://127.0.0.1:8212 vault operator unseal $(cat ./init.json| jq -r '.unseal_keys_b64[]')
    echo -e ${Green}Cluster unsealed.${Color_Off}
    echo -e ${Yellow}Logging in with root token.${Color_Off}
    VAULT_ADDR=http://127.0.0.1:8212 vault login $(cat ./init.json| jq -r '.root_token')
    echo -e ${Yellow}Unsealing standby nodes${Color_Off}
    sleep 2
    VAULT_ADDR=http://127.0.0.1:8214 vault operator unseal $(cat ./init.json| jq -r '.unseal_keys_b64[]')
    VAULT_ADDR=http://127.0.0.1:8216 vault operator unseal $(cat ./init.json| jq -r '.unseal_keys_b64[]')
    watch VAULT_ADDR=http://127.0.0.1:8212 vault operator members
fi
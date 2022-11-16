Blue='\033[0;34m'
Green='\033[0;32m' 
Color_Off='\033[0m'

echo ${Blue}Starting Mysql${Color_Off}
docker-compose -p mysql -f /Users/maxwinslow/dev/docker-k8s/vaulty/mysql/docker-compose.yml up -d
echo ${Blue}Seeding Mysql${Color_Off}
sleep 10
mysql --host=127.0.0.1 --user=root --password=root < /Users/maxwinslow/dev/docker-k8s/vaulty/mysql/seed.sql
echo ${Green}Mysql is ready${Color_Off}

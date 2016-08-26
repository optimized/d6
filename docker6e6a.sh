docker exec $(docker ps -aqf "name=$(docker-compose ps | awk '{print $1}'|grep "db")") bash "/yourcommand/something.sh"

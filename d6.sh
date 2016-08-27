#docker exec $(docker ps -aqf "name=$(docker-compose ps | awk '{print $1}'|grep "db")") bash "/yourcommand/something.sh"
d6(){
  case "$1" in
        stopall)
            docker stop $(docker ps -q)
            ;;
        *)
            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
            exit 1
  esac
}
alias d6=d6

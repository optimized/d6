#!/bin/sh
d6(){
  case "$1" in
  
        stopall)
            docker stop $(docker ps -q)
            ;;
  
	rebuildall)
		docker-compose rm --all && docker-compose pull && docker-compose build --no-cache && docker-compose up -d --force-recreate
		;;	

      *)
            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
            exit 1
  esac
}
alias d6=d6

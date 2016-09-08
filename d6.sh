#!/bin/sh
d6(){
  case "$1" in
  
        stopall)
            docker stop $(docker ps -q)
            ;;
  
	rebuildall)
		docker-compose rm --all && docker-compose pull && docker-compose build --no-cache && docker-compose up -d --force-recreate
		;;
	removeuntagged)
		docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
		;;	

	shellcontainer)
		docker exec -it noeljacksoncom_wordpress_1 bash
		;;
	backup)
		docker run --rm   --volumes-from ddc1a7eae4f1   -v $(pwd):/backup  boombatower/docker-backup
		;;
	findvolumes)
		docker inspect -f {{.Volumes}}
		;;
	removewithvolumes)
		docker rm -v $2
		;;

      *)
            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
            exit 1
  esac
}
alias d6=d6

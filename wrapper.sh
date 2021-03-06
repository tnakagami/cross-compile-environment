#!/bin/bash

function Usage() {
    echo "$0 [ps|logs|start|stop|restart|down|build|armf|arm64]"
    exit 0
}

function create_envfile() {
    {
        echo NODE_UID=$(id -u ${USER})
        echo NODE_GID=$(id -g ${USER})
    } > envfile
}

while [ -n "$1" ]; do
    case "$1" in
        ps )
            docker-compose ps
            shift
            ;;

        logs )
            docker-compose logs -t | sort -t "|" -k 1,+2d
            shift
            ;;

        start )
            create_envfile
            docker-compose up -d
            shift
            ;;

        stop | restart | down )
            cmd="$1"
            docker-compose ${cmd}
            shift
            ;;

        build )
            docker-compose build
            docker images | grep "none" | awk '{print $3;}' | xargs -I{} docker rmi {}
            shift
            ;;

        armf )
            create_envfile
            docker-compose up -d
            docker exec -it -u armer armf bash
            shift
            ;;

        --help | -h )
            Usage
            shift
            ;;

        * )
            shift
            ;;
    esac
done

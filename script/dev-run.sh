#!/usr/bin/env bash

set -e

[[ ! -d .git ]] && (>&2 echo "ERROR Please run this script from the root" && exit 1)
[[ -f "./web/.docker.pid" ]]  && (>&2 echo "ERROR the dev webserver is already running, try killing the container and running rm -f ./web/.docker.pid" && exit 1)
trap ./script/dev-clean.sh SIGINT SIGTERM
(
    cd web && \
    source ./.envapp && \
    echo $GIT_SHA > app/gitsha.txt && \
    docker run -d -p $PORT:$PORT -v $(pwd)/app:/opt/carbonchat --env-file ./.env $DOCKER_REGISTRY/$REPO_PATH/web:latest > ./.docker.pid
    export dpid=$?
) & 
wait $dpid
open http://localhost:5000
docker logs -f $(cat ./web/.docker.pid)
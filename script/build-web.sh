#!/usr/bin/env bash

set -e 

[[ ! -d .git ]] && (>&2 echo "ERROR Please run this script from the root" && exit 1)

source './web/.envapp'

docker build -t "${DOCKER_REGISTRY}/${REPO_PATH}/web:latest" \
             --build-arg GIT_SHA=$GIT_SHA \
             -f web/Dockerfile ./web
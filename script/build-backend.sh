#!/usr/bin/env bash

set -e 

[[ ! -d .git ]] && (>&2 echo "ERROR Please run this script from the root" && exit 1)

source './backend/.env'

docker build -t "${DOCKER_REGISTRY}/${REPO_PATH}/backend:latest" \
             -f backend/Dockerfile ./backend
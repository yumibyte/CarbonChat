#!/usr/bin/env bash

set -e

[[ ! -d .git ]] && (>&2 echo "ERROR Please run this script from the root" && exit 1)
if [ -f "./web/.docker.pid" ]; then
   docker kill $(cat "./web/.docker.pid")
   rm -f "./web/.docker.pid"
fi

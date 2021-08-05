#!/bin/sh

set -o allexport
source ./.env
set +o allexport

if [ -n 1 ]; then
    COMPOSE_PROJECT_NAME=$1
fi

docker-compose --env-file ./config/envs/$COMPOSE_PROJECT_NAME.env down
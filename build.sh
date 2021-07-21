#!/bin/sh

set -o allexport
source ./.env
set +o allexport

PROJECT_ENV_FILE=../$COMPOSE_PROJECT_NAME/docker/.env

if [ -f "$PROJECT_ENV_FILE" ]; then
    # Merge docker and project env files together
    sort -u -t '=' -k 1,1 ./.env $PROJECT_ENV_FILE | grep -v '^$\|^\s*\#' > ./config/envs/$COMPOSE_PROJECT_NAME.env
else
    sort -u -t '=' -k 1,1 ./.env | grep -v '^$\|^\s*\#' > ./config/envs/$COMPOSE_PROJECT_NAME.env
fi

docker compose --env-file ./config/envs/$COMPOSE_PROJECT_NAME.env build
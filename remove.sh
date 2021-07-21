#!/bin/sh

set -o allexport
source ./.env
set +o allexport

docker compose --env-file ./config/envs/$COMPOSE_PROJECT_NAME.env down
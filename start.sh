#!/bin/sh

if [ -n "$1" ]; then
    COMPOSE_PROJECT_NAME=$1
fi

# Check if project name is set
if [ -z "$COMPOSE_PROJECT_NAME" ]; then
    echo "ERROR: Project name argument not given"
    exit 1
fi

PROJECT_FOLDER=../$COMPOSE_PROJECT_NAME

# Check if project folder exists
if [ ! -d "$PROJECT_FOLDER" ]; then
    echo "ERROR: Project folder not found"
    exit 1
fi

SS_PROJECT_ENV_FILE=../$COMPOSE_PROJECT_NAME/docker/.env
WP_PROJECT_ENV_FILE=../$COMPOSE_PROJECT_NAME/wp-content/themes/$COMPOSE_PROJECT_NAME/docker/.env

PROJECT_ENV_FILE=$SS_PROJECT_ENV_FILE

if [ ! -f "$PROJECT_ENV_FILE" ]; then

    PROJECT_ENV_FILE=$WP_PROJECT_ENV_FILE

    if [ ! -f "$PROJECT_ENV_FILE" ]; then

        echo "ERROR: .env file not found in project directory"
        exit 1
    fi
fi

# Check if /docker/.env exists in project folder
if [ -f "$PROJECT_ENV_FILE" ]; then
    echo "NOTICE: .env file found in project directory"
    # Merge docker and project env files together
    sort -u -t '=' -k 1,1 $PROJECT_ENV_FILE ./.env | grep -v '^$\|^\s*\#' > ./config/envs/$COMPOSE_PROJECT_NAME.env
fi

docker-compose --env-file ./config/envs/$COMPOSE_PROJECT_NAME.env up -d

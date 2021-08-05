# TZO Docker

Standalone Docker set up for Silverstripe and WordPress

## Getting Started

- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Clone this repo into your projects folder
- Create a copy of the `sample.env` file and rename it `.env`
- Edit the variables in `.env` to match your set up
- run `./start.sh` in your terminal (Windows users should use Git Bash)
- Your site should appear at `localhost:80`

## Shell scripts

A number of shell scripts have been included to make using common docker commands easier.

These use the `COMPOSE_PROJECT_NAME` environment variable to determine what containers to effect.

- `build.sh` - Builds images
- `remove.sh` - Completely removes containers
- `start.sh` - Starts containers, (builds images if they don't exist)
- `stop.sh` - Stops containers (doesn't remove them)

*You can override the `COMPOSE_PROJECT_NAME` by adding an argument after the shell script.*

```shell
build.sh ssboilerplate
```

## Accessing the site

[localhost](localhost:80) should be mapped to `${COMPOSE_PROJECT_NAME}.tzo`

The API site will be accessed if you use HTTPS instead of HTTP to access the site or at [localhost:443](localhost:443)

PHPMyAdmin can be accessed via [localhost:8080](localhost:8080)

## Using XDebug in VSCode

A `.vscode/launch.json` is provided in the repo to make this easier.

This will need to be copied to your VSCode settings.

## Feedback

Please provide feedback and issues via the issues on the repo in GitLab

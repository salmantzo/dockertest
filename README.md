# TZO Docker

Standalone Docker set up for Silverstripe and WordPress

## Getting Started

- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Clone this repo into your projects folder
- Create a copy of the `sample.env` file and rename it `.env`
- Edit the variables in `.env` to match your set up
- Move the project variables to the */docker/.env* file in your project directory
- Run `./start.sh {$COMPOSE_PROJECT_NAME}` in your terminal (Windows users should use Git Bash)
- Your site should appear at `localhost:80`

## Shell scripts

A number of shell scripts have been included to make using common docker commands easier.

- `build.sh` - Builds images
- `remove.sh` - Completely removes containers
- `start.sh` - Starts containers, (builds images if they don't exist)
- `stop.sh` - Stops containers (doesn't remove them)

**You have to specify the `COMPOSE_PROJECT_NAME` by adding an argument after the shell script.**

```shell
build.sh ssboilerplate
```

## Importing SQL Dumps

Add a MySQL dump to your `$MYSQL_DUMPS_DIR` then open the *mysqldb*
container in a CLI and run the command below, substituting the names of the file to match your needs.

```shell
mysql -u root -p {$COMPOSE_PROJECT_NAME} < /uploadSQL/{$MYSQL_DUMP_NAME}.sql;
```

## Accessing the Main Site

[localhost](localhost:80) should be mapped to `${COMPOSE_PROJECT_NAME}.tzo`

If you add a entry to your hosts file to point `${COMPOSE_PROJECT_NAME}.tzo` to `127.0.0.1` you can access the currently running site via that host.

*Subsite hosts can be added the exact same way with no additional configuration.*

PHPMyAdmin can be accessed via [localhost:8080](localhost:8080)

## Accessing a Dottie Site

By adding `dottie` to `COMPOSE_PROFILES` in your project's */docker/.env* file you can run an API site at the same time as your main site.

The API site will be accessed if you use HTTPS instead of HTTP to access the site or at [localhost:443](localhost:443)

This will work for accessing the dashboard but the *silverstripe* container won't be able to access the *api* container via this URL.

To allow the containers to access each other via the docker network:

- Set an entry in your hosts file pointing `api` to `127.0.0.1`
- Set the `dottie_endpoint` in your project's *dottie.yml* to `https://api/graphql`

## Using XDebug in VSCode

A `.vscode/launch.json` is provided in the repo to make this easier.

This will need to be copied to your VSCode settings.

## Feedback

Please provide feedback and issues via the issues on the repo in GitLab

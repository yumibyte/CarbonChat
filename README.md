## CarbonChat

This is the home for [our teams](https://2020.spaceappschallenge.org/challenges/inform/carbon-footprint/teams/carbon-chat/stream) project.

We are working on the [NASA International Space Apps Challenge](https://2020.spaceappschallenge.org/) :tada:

# Backend

This is our backend app deployed to heroku

## Local Dev

### Build
1. Install docker
1. Navigate to the source of the repo
1. Run : `script/build-web.sh`

### Run it locally

1. First build it, open a shell and navigate to the source of the repo
1. Change folders : `cd ./web`
1. Source the .env file : `source ./.envapp`
1. Run : `docker run -it -p $PORT:$PORT --env-file ./.env $DOCKER_REGISTRY/$REPO_PATH/web:latest`
1. Open a browser to the ping endpoint: `open http://0.0.0.0:$PORT/ping` 
## CarbonChat

This is the home for [our teams](https://2020.spaceappschallenge.org/challenges/inform/carbon-footprint/teams/carbon-chat/stream) project.

We are working on the [NASA International Space Apps Challenge](https://2020.spaceappschallenge.org/) :tada:

# Backend

This is our backend app deployed to heroku

## Local Dev

### Build
1. Install docker
1. Navigate to the source of the repo
1. Run : `script/build-backend.sh`

### Run it locally

1. First build it, open a shell and navigate to the source of the repo
1. Source the .env file : `source ./backend/.env`
1. Run : `docker run -it -p $PORT:$PORT --env-file ./backend/.env $DOCKER_REGISTRY/$REPO_PATH/backend:latest`
1. Open a browser to the ping endpoint: `open http://0.0.0.0:5000/ping` 
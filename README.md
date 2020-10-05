## CarbonChat

This is the home for [our teams](https://2020.spaceappschallenge.org/challenges/inform/carbon-footprint/teams/carbon-chat/stream) project.

We are working on the [NASA International Space Apps Challenge](https://2020.spaceappschallenge.org/) :tada:


See the predicted CO2 level for your [current time and our api](https://carbonchat.herokuapp.com/polymodel)

![image](https://user-images.githubusercontent.com/1907138/95049090-f41b6400-069d-11eb-9df9-c5e9d62417dc.png)

The Polynomial regression model plus the linear regression model analsysis we can display the correlation between the year and CO2 increase:

![image](https://user-images.githubusercontent.com/1907138/95049177-1d3bf480-069e-11eb-9c66-36574d6c12ea.png)


At the tip of your fingers:

![image](https://user-images.githubusercontent.com/1907138/95049579-e1edf580-069e-11eb-8210-6e8ad454cf01.png)


### Datasets Used
State CO2 Emissions from Fossil Fuel Combustion --> https://www.epa.gov/statelocalenergy/state-co2-emissions-fossil-fuel-combustion

Data on CO2 and Greenhouse Gas Emissions by Our World in Data -->
https://github.com/owid/co2-data

## Backend

This is our backend app deployed to heroku

### Local Dev

#### Build
1. Install docker
1. Navigate to the source of the repo
1. Run : `script/build-web.sh`

#### Run it locally

1. First build it, open a shell and navigate to the source of the repo
1. Run : `./script/dev-run.sh`

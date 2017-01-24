#!/bin/bash

# Retrieve the JSON if it's not already downloaded.
API_KEY=""
LOCATION="zmw:00000.1.71639"
JSON=~/.aether.json
WUNDERGROUND="http://api.wunderground.com/api/"$API_KEY"/conditions/q/"$LOCATION".json"
curl -L ${WUNDERGROUND} > $JSON

# Check if it is cold
ISCOLD=`jq '.forecast.simpleforecast.forecastday | map(.low.celsius | tonumber) | add / length < 5' $JSON`

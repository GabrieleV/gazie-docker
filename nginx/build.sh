#!/bin/bash

GAZIE_VERSION=$1

APP_NAME=gazie-nginx:${GAZIE_VERSION}

docker build -t $APP_NAME .



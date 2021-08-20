#!/bin/bash
docker stop content-api && docker container rm content-api
docker build -t mywth.azurecr.io/content-api:latest .
# docker network create wth-net
docker run -d -p 3001:3001 --net wth-net --name content-api  mywth.azurecr.io/content-api:latest
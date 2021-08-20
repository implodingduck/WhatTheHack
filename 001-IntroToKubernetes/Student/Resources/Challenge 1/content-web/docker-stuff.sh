#!/bin/bash
docker stop content-web && docker container rm content-web
docker build -t mywth.azurecr.io/content-web:latest .
docker run -d -e CONTENT_API_URL=http://content-api:3001 -p 3000:3000 --net wth-net --name content-web mywth.azurecr.io/content-web:latest
FROM node:16-alpine3.11

COPY package.json /opt/app/
WORKDIR /opt/app/
RUN npm install
COPY . /opt/app/

EXPOSE 3000
ENTRYPOINT ["node", "./server.js"]

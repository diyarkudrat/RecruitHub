# Node base docker image
FROM node:14

RUN apt update && apt install -y netcat

# Directory to put code in app folder
WORKDIR /app

# Add package.json file into app directory
COPY package.json /app

# install dependencies
RUN npm install

# Copy code into app directory
COPY . /app

# command to run node app
CMD ./wait-for.sh db:27017 && npm start server.js

# Application's default port
EXPOSE 5000

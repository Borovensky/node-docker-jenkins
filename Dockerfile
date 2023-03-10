FROM node:16

#Create app directory
WORKDIR /usr/src/app

#Install app dependencies
COPY package*.json ./
RUN npm install

#Bundle app source
COPY server.js ./
COPY server.test.js ./

EXPOSE 8090
CMD ["node", "server.js"]


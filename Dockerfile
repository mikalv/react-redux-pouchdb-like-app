# todo's
# - use npm-shrinkwrap.json
# - Clear / and /client unused node_modules after build


FROM node:8.5.0
MAINTAINER Rodrigo Cipriani da Rosa

# home app dir
ARG HOME=/home/app
ARG CLIENT=/home/app/client
ARG SERVER=/home/app/server
#ENV HOME=${HOME}

RUN useradd --user-group --create-home --shell /bin/false app

RUN mkdir -p ${HOME}
COPY . ${HOME}
RUN chown -R app:app ${HOME}/*

USER app

WORKDIR ${HOME}
RUN npm install && npm cache clean --force

WORKDIR ${SERVER}
RUN npm install && npm cache clean --force

WORKDIR ${CLIENT}
RUN npm install && npm cache clean --force && npm run build

WORKDIR ${HOME}
ENTRYPOINT npm start

EXPOSE 3000

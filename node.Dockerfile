FROM node:lts-alpine

WORKDIR /usr/bin

COPY ./docker-19.03.5 ./docker
RUN chmod +x docker
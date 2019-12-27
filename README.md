# Docker Cli in Docker

## build image

```bash
docker build -t node-dcind:lts-alpine -f ./node/Dockerfile .
```

## use as base

```Dockerfile
FROM node-dcind:lts-plpine
```

build image:

```bash
docker build -t <your_app:latest> .
```

## mount socket

For docker run:

```bash
docker run -v /var/run/docker.sock:/var/run/docker.sock -it <your_app:latest> sh
```

For stack or compose:

Create docker-compose.yml:

```yml
version: '3'
service:
  your_service:
    image: your_app:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

run:

```bash
docker stack deploy -c docker-compose.yml <your_stack>
```

## For more client version:

Get the newest docker binary package from [here](https://download.docker.com/linux/static/stable/)  
Unzip and copy the file 'docker' to current dir  
Update the Dockerfile, replace the docker version in COPY command to your version

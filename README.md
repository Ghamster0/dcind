# Docker Cli in Docker

For those programs running in a docker container, and want to run docker command to communicate with the docker-deamon running on the host machine.

## build image

```bash
docker build -t node-dcind:lts-alpine -f node.Dockerfile .
```

## how to use

The docker image can be use directly or act as a base image.  
Ensure mount the docker.sock on host machine to your container correctly.  

### case 'docker run'

```bash
docker run -v /var/run/docker.sock:/var/run/docker.sock -it node-dcind:lts-alpine sh
```

### case 'docker stack' or 'docker-compose'

Create docker-compose.yml:

```yml
version: '3'
service:
  <service_name>:
    image: node-dcind:lts-alpine
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

run:

```bash
docker stack deploy -c docker-compose.yml <your_stack>
```

## For more client version

Get the newest docker binary package from [here](https://download.docker.com/linux/static/stable/)  

Unzip and copy the file 'docker' to here  

Update the Dockerfile, replace the docker version in COPY command to your version

# idig

Docker configuration for the iDig application.

## Pre-requisites

You need to add the server files from the [iDig repository](https://github.com/ascsadl/idig-server) as a submodule.

```
git submodule init
git submodule update
```

## Running iDig Server with Docker

### Docker installation

A working [Docker](https://docs.docker.com/engine/install/) installation is mandatory.

### Installation & configuration

To start iDig server with Docker, you need to use the `docker-compose up` command from the project root directory (add `-d` if you want to run in the background and silence the logs). This command will automatically build the docker image, and start the iDig server, the root directory will be mapped to the `server-data` folder.

Once the server is running, you can access it at `http://localhost:9000`.

### Server configuration

You can use the [configuration](#configuration) commands when you're connected to the idig-server container.

```
# Connect to the running container
docker exec -it idig-server bash

# Create a project named Agora in the data folder
idig-server create data/Agora

# Add a user to the Agora project
idig-server adduser data/Agora bruce myPassw0rd

...
```

### Server updates

To update the server with the latest code changes, you should first pull the latest changes from the [iDig repository](https://github.com/ascsadl/idig-server).

`git submodule update --remote idig-server`

Then, you can use the following commands to update the server (projects data will be persisted through the `server-data` folder).

```
docker-compose down
docker-compose build
docker-compose up -d
```

# iDig

Docker configuration for the iDig application.

## Server files

If the server files are needed, you should add them from the [iDig repository](https://github.com/ascsadl/idig-server) as a submodule.

```
git submodule init
git submodule update
```

## Running iDig server with Docker

### Docker installation

A working [Docker](https://docs.docker.com/engine/install/) installation is mandatory.

### Starting the server

To start iDig server with Docker, you need to use the `docker-compose up` command from the project root directory (add `-d` if you want to run in the background and silence the logs). This command will automatically download the latest docker image, and start the iDig server, the root directory will be mapped to the `server-data` folder.

Once the server is running, you can access it at `http://localhost:9000`.

### Server configuration

You can use the configuration commands when you're connected to the **idig-server** container.

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

The server files are needed, you should initialize the submodule if it's not already done (see [Server files](#server-files)).

To update the server with the latest code changes, you should first pull the latest changes from the [iDig repository](https://github.com/ascsadl/idig-server).

`git submodule update --remote idig-server`

Then, you can use the following commands to update the server (projects data will be persisted through the `server-data` folder).

```
docker-compose down
docker-compose build
docker-compose up -d
```

Test the server, then commit and push the changes. The updated image will be automatically created on [Docker Hub](https://hub.docker.com/repository/docker/unillett/idig/general).

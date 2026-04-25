# Node.js on Docker

[![MIT License](https://img.shields.io/github/license/lentiancn/docker-gentkit-node.svg?style=flat-square&label=license)](LICENSE)
[![GitHub Release](https://img.shields.io/github/tag/lentiancn/docker-gentkit-node.svg?style=flat-square&label=release)](https://github.com/lentiancn/docker-gentkit-node/releases)

A project for building Docker image for the Node.js environment .

## Tag naming convention

### Node.js from https://nodejs.org/

| Image        | Tag             | Description                                                  |
|--------------|-----------------|--------------------------------------------------------------|
| gentkit/node | latest          | Same with **gentkit/node:latest-alpine**                     |
| gentkit/node | latest-alpine   | Node.js vX.Y.Z(LTS/non-LTS) based on the latest Alpine Linux |
| gentkit/node | ltsX-alpine     | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux         |
| gentkit/node | ltsX.Y.Z-alpine | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux         |
| gentkit/node | X-alpine        | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux     |
| gentkit/node | X.Y.Z-alpine    | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux     |

### Unofficial Node.js from https://unofficial-builds.nodejs.org/

| Image        | Tag                   | Description                                                  |
|--------------|-----------------------|--------------------------------------------------------------|
| gentkit/node | unoff-latest          | Same with **gentkit/node:unoff-latest-alpine**               |
| gentkit/node | unoff-lts-alpine      | Node.js vX.Y.Z(LTS/non-LTS) based on the latest Alpine Linux |
| gentkit/node | unoff-ltsX-alpine     | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux         |
| gentkit/node | unoff-ltsX.Y.Z-alpine | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux         |
| gentkit/node | unoff-alpine          | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux     |
| gentkit/node | unoff-X-alpine        | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux     |
| gentkit/node | unoff-X.Y.Z-alpine    | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux     |

## Pull and run into a new container

```shell
docker run -it \
--name <your_container_name> \
gentkit/node:latest
```

## Exec into your running container

```shell
docker exec -it \
<your_container_name_or_id> \
/bin/sh
```

**NOTE** : Check status and start it using :
**docker ps -a --filter "name=<your_container_name>"** and
**docker start <your_container_name_or_id>**

## License

**gentkit/node** is licensed under
the [MIT License](LICENSE) .

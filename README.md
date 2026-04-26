# Node.js on Docker

[![MIT License](https://img.shields.io/github/license/lentiancn/docker-gentkit-node.svg?style=flat-square&label=license)](LICENSE)
[![GitHub Release](https://img.shields.io/github/tag/lentiancn/docker-gentkit-node.svg?style=flat-square&label=release)](https://github.com/lentiancn/docker-gentkit-node/releases)

A project for building Docker image for the Node.js environment .

## Tag naming convention

### Node.js from https://nodejs.org/

[Dockerfile](/blob/alpine)

| Image        | Tag             | Description                                              |
|--------------|-----------------|----------------------------------------------------------|
| gentkit/node | lts-alpine      | Node.js latest LTS based on the latest Alpine Linux      |
| gentkit/node | ltsX-alpine     | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux     |
| gentkit/node | ltsX.Y.Z-alpine | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux     |
| gentkit/node | alpine          | Node.js latest non-LTS based on the latest Alpine Linux  |
| gentkit/node | X-alpine        | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux |
| gentkit/node | X.Y.Z-alpine    | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux |

### Unofficial Node.js from https://unofficial-builds.nodejs.org/

| Image        | Tag                   | Description                                              |
|--------------|-----------------------|----------------------------------------------------------|
| gentkit/node | unoff-lts-alpine      | Node.js latest LTS based on the latest Alpine Linux      |
| gentkit/node | unoff-ltsX-alpine     | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux     |
| gentkit/node | unoff-ltsX.Y.Z-alpine | Node.js vX.Y.Z(LTS) based on the latest Alpine Linux     |
| gentkit/node | unoff-alpine          | Node.js latest non-LTS based on the latest Alpine Linux  |
| gentkit/node | unoff-X-alpine        | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux |
| gentkit/node | unoff-X.Y.Z-alpine    | Node.js vX.Y.Z(non-LTS) based on the latest Alpine Linux |

## Pull and run into a new container

```shell
docker run -it \
--name <CONTAINER_NAME> \
gentkit/node:<TAG>
```

## Exec into your running container

```shell
docker exec -it \
<CONTAINER_NAME_OR_ID> \
/bin/sh
```

**NOTE** : Check status and start it using :
**docker ps -a --filter "name=<CONTAINER_NAME>"** and
**docker start <CONTAINER_NAME_OR_ID>**

## License

**gentkit/node** is licensed under
the [MIT License](LICENSE) .

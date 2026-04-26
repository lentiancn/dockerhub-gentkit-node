# Node.js on Docker

[![MIT License](https://img.shields.io/github/license/lentiancn/docker-gentkit-node.svg?style=flat-square&label=license)](LICENSE)
[![GitHub Release](https://img.shields.io/github/tag/lentiancn/docker-gentkit-node.svg?style=flat-square&label=release)](https://github.com/lentiancn/docker-gentkit-node/releases)

A project for building Docker image for the Node.js environment .

## Tag naming standard

### Node.js from https://nodejs.org/

| Tag for gentkit/node | Description                                        |
|----------------------|----------------------------------------------------|
| lts-alpine           | Node.js LTS (Current) on Alpine Linux (Current)    |
| ltsX-alpine          | Node.js LTS vX (Current) on Alpine Linux (Current) |
| ltsX.Y.Z-alpine      | Node.js LTS vX.Y.Z on Alpine Linux (Current)       |
| alpine               | Node.js (Current) on Alpine Linux (Current)        |
| X-alpine             | Node.js vX (Current) on Alpine Linux (Current)     |
| X.Y.Z-alpine         | Node.js vX.Y.Z on Alpine Linux (Current)           |

### Unofficial Node.js from https://unofficial-builds.nodejs.org/

| Tag for gentkit/node  | Description                                        |
|-----------------------|----------------------------------------------------|
| unoff-lts-alpine      | Node.js LTS (Current) on Alpine Linux (Current)    |
| unoff-ltsX-alpine     | Node.js LTS vX (Current) on Alpine Linux (Current) |
| unoff-ltsX.Y.Z-alpine | Node.js LTS vX.Y.Z on Alpine Linux (Current)       |
| unoff-alpine          | Node.js (Current) on Alpine Linux (Current)        |
| unoff-X-alpine        | Node.js vX (Current) on Alpine Linux (Current)     |
| unoff-X.Y.Z-alpine    | Node.js vX.Y.Z on Alpine Linux (Current)           |

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

# Node.js on Docker

[![MIT License](https://img.shields.io/github/license/lentiancn/docker-gentkit-node.svg?style=flat-square&label=license)](LICENSE)
[![GitHub Release](https://img.shields.io/github/tag/lentiancn/docker-gentkit-node.svg?style=flat-square&label=release)](https://github.com/lentiancn/docker-gentkit-node/releases)

A project for building Docker image for the Node.js environment .

## Platform supported

| Tag                               | Description             |
|-----------------------------------|-------------------------|
| [Alpine Linux](../../tree/alpine) | Node.js on Alpine Linux |

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

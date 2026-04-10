# Node.js on Docker

[![MIT License](https://img.shields.io/github/license/lentiancn/dockerhub-gentkit-node?style=flat-square)](LICENSE)
[![GitHub Release](https://img.shields.io/github/tag/lentiancn/dockerhub-gentkit-node.svg?label=release)](https://github.com/lentiancn/dockerhub-gentkit-node/releases)

A project for building Docker image for the Node.js environment.

## Pull and run a new container

```shell
$ sudo docker run -d \
--restart unless-stopped \
--name <your_container_name> \
gentkit/node:latest
```

## Exec into the container

```shell
# View container status
$ sudo docker ps -a --filter "name=<your_container_name>"

$ sudo docker exec -it <your_container_name or your_container_id> /bin/sh
```

## License

**gentkit/node** is licensed under
the [MIT License](https://raw.githubusercontent.com/lentiancn/dockerhub-gentkit-node/refs/heads/main/LICENSE) .

## Appendix

### Source

https://github.com/lentiancn/dockerhub-gentkit-node (**on** GitHub)

https://gitee.com/lentiancn/dockerhub-gentkit-node (**on** Gitee)

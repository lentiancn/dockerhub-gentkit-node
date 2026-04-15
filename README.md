# Node.js on Docker

[![MIT License](https://img.shields.io/github/license/lentiancn/docker-gentkit-node?style=flat-square)](LICENSE)
[![GitHub Release](https://img.shields.io/github/tag/lentiancn/docker-gentkit-node.svg?style=flat-square&sort=date&label=Release)](https://github.com/lentiancn/docker-gentkit-node/releases)

A project for building Docker image for the Node.js environment.

## Pull and run a new container

```shell
$ sudo docker run -it \
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
the [MIT License](LICENSE) .

## Appendix

### Source

https://github.com/lentiancn/docker-gentkit-node (**on** GitHub)

https://gitee.com/lentiancn/docker-gentkit-node (**on** Gitee)

# Minecraft Docker

**I never got around to playing Minecraft. Therefore, I'm archiving the repository as I have no clue if it's still working.**

Run a [Minecraft](https://www.minecraft.net/) dedicated server using Docker. There are plenty of other solutions out there that has way more features than this. I wanted a bare minimum setup.

## Installation

The image can be found at:

```sh
docker pull ghcr.io/ekman/minecraft:1
```

## Configuration

View the [example `docker-compose.yml` file](docker-compose.yml) for indications on how to install, configure and run this.

### Ports

Open TCP ports `25565` on your router and forward them to the hosting server/computer.

### Volumes

Mount all these volumes to your host.

| Directory inside container | Description |
| --- | --- |
| `/home/minecraft/config` | Contains all configuiration data. |

### Configuration

Start the server once. It will generate an `eula.txt` and `server.properties` file inside your mounted configuration directory. Accept the EULA and configure the server accordingly.

## Versioning

This project complies with [Semantic Versioning](https://semver.org/).

## Changelog

For a complete list of changes, and how to migrate between major versions, see [releases page](https://github.com/Ekman/minecraft-docker/releases).

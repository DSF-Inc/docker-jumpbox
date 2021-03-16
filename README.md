# [drseussfreak/jumpbox](https://hub.docker.com/r/drseussfreak/jumpbox)

Started from this [monsoft](https://github.com/monsoft/ssh-docker-jumpbox) image, will try to maintain this image for myself, but am happy to share it out as well.

## Contents
- [Introduction](#introduction)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
  - [Authorized Keys](#keys)

# Introduction

Simple ssh jumpbox, just ensure you have your "authorized-keys" file and "/home" volumes set, you should be all set.

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/drseussfreak/jumpbox) and is the recommended method of installation.

## Keys
Each user is authenticated by ssh key during login, and to be able to do it, specially 'crafted' file is required. It's like normal authorized_keys file but with username at the beginning. General file format is:
```
username:ssh_public_key
```

## Quickstart

Docker Run:

```bash
docker run --name jumpbox -d --restart=always \
  -p serverip:9922:22 \
  -v /path/to/authorized_keys:/etc/authorized_keys:ro -v /path/to/home:/home \
  -e TZ="America/Chicago" -e USERS="user1 user2 user3" \
  drseussfreak/jumpbox
```

OR

Docker Compose

```
    bind:
        container_name: jumpbox
        hostname: jumpbox
        image: drseussfreak/jumpbox
        restart: unless-stopped
        ports:
            - serverip:9922:22
        volumes:
            - /path/to/authorized_keys:/etc/authorized_keys:ro
            - /path/to/home:/home
        environment:
            - TZ=America/Chicago
            - USERS=user1 user2 user3
```

### - Parameters

Container images are configured using parameters passed at runtime (such as those above). 

| Parameter | Function |
| :----: | --- |
| `-p serverip:9922:22` | SSH port|
| `-e TZ=America/Chicago` | Specify a timezone to use e.g. America/Chicago |
| `-e USERS=user 1 user2` | add the users you wish to connect with. |
| `-v /path/to/authorized_keys:/etc/authorized_keys:ro` | Mount authorized_keys file for persistent config  |
| `-v /path/to/home:/home` | Mount home directory for persistent config  |
| `-e TZ=America/Chicago` | Specify a timezone to use e.g. America/Chicago |

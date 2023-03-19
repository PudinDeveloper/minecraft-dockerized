![server-icon.png](./img/server-icon.png "server-icon.png")
# Minecraft Server Container
## Introduction
Hello, this is my own creation of a Minecraft server that automatically starts when executing the Docker Run command.

By default this server runs with the next configuration:
- 1 GB of RAM.
- Server MOTD: Dockerized Minecraft.
- Default max players: 100.
- Server Icon: https://www.iconarchive.com/download/i106016/papirus-team/papirus-apps/minecraft.64.png.
- Eula already accepted (you should read it before running the server anyways).

And that's it, there is no modified image in this container, just simple vanilla experience.
## Usage
### Create a new server
To start using this container you can use the basics commands of Docker.
For example, to create a new server you can use the following command:
1. `docker run --name minecraft-server -d -p 25565:25565 dagp/minecraft-server`
2. This will start the creation of the Minecraft Server, no world is previously generated so every time you create a server there will be a different world. **Keep in mind that the command will generate the latest version of Minecraft.**

### Using an specific version of Minecraft
In the #Tags section in this document you will find the tags to generate an specific version of Minecraft.
For example if you want to create a server in 1.19.3 version you can use:

`docker run --name minecraft-server -d -p 25565:25565 dagp/minecraft-server:1.19.3`

### Starting and stoping the server
`docker start minecraft-server`
`docker stop minecraft-server`

Remember that "**minecraft-server**" can be also the container ID or a custom name that you can specify when generating the container.

To check the containers IDs you can use this command: `docker ps -a`

## Future of this project
I will continue to add more versions of Minecraft and also making possible to customize RAM, max players and MOTD when generating the container. I will also try to add Bukkit/Spigot images but keep in mind that every single version need to be tested manually so it will take a while.

You can also find the Dockerfile if you want to generate an specific server in the following repository: https://github.com/dagp-ucol/minecraft-dockerized

## Tags
`latest` `1.19.4`

# Uses the Amazon Corretto 17 image that contains the Java 17 JDK
FROM amazoncorretto:17

# Set the working directory to /games/minecraft-server
WORKDIR /games/minecraft-server

# Installs wget and nano to manage the server easily
RUN yum install -y wget && yum install -y nano

# Download the server from Mojang Official Website
RUN wget https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar

# Generates the server properties and the eula to configure the server
RUN java -Xmx256M -Xms256M -jar server.jar

# Change the server max players to 100
RUN sed -i -e 's/max-players=20/max-players=100/g' server.properties

# Change the server name to Dockerized Minecraft
RUN sed -i -e 's/motd=A Minecraft Server/motd=Dockerized Minecraft/g' server.properties

# Download the server icon that will be displayed in the server list
RUN wget -O server-icon.png https://www.iconarchive.com/download/i106016/papirus-team/papirus-apps/minecraft.64.png

# Accepts the EULA, you should read it before running the server
RUN echo "eula=true" > eula.txt

# Runs the server in the background
CMD java -Xmx1024M -Xms256M -jar server.jar nogui

# Exposes the port 25565 to the host
# Remember to use -p 25565:25565 when running
# the container in order to expose the port
EXPOSE 25565

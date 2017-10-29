FROM debian:buster

LABEL Maintainer="Falco Prescher"
LABEL Github="https://github.com/falcoprescher$STARBOUND_FOLDER-Docker"

ENV DEBIAN_FRONTEND noninteractive

ENV STREAM_USERNAME "anonymous"
ENV STREAM_PASSWORD ""
ENV STARBOUND_FOLDER "/starbound"

ENV LANG de_DE.UTF-8

# Package cleanup and language setup
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y locales && \
    echo "de_DE.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen de_DE.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=$LANG 

ENV LANGUAGE de_DE.UTF-8
ENV LC_ALL de_DE.UTF-8

# Libraries and programs
RUN apt-get install curl tar zip lib32stdc++6 -y && \
    dpkg --add-architecture i386 && \
    apt-get install lib32gcc1 -y

RUN mkdir -p $STARBOUND_FOLDER
RUN mkdir -p /opt/steamcmd

# Stream CMD download and setup Starbound server
WORKDIR /opt/steamcmd
RUN curl -s http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar xzvf -

RUN chmod +x ./steamcmd.sh
RUN ./steamcmd.sh \
    +@NoPromptForPassword 1 \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +force_install_dir $STARBOUND_FOLDER \
    +app_update 211820 validate \
    +quit

# User Management
RUN useradd --disabled-password --gecos '' starbound
RUN chown -R starbound $STARBOUND_FOLDER

USER starbound
WORKDIR $STARBOUND_FOLDER

# Grant execution rights for script
ADD ./scripts/start.sh ./scripts.sh
RUN chmod +x ./start.sh

# Ports
EXPOSE 21025
EXPOSE 21026

# Volume
VOLUME $STARBOUND_FOLDER

# Start scripts
CMD ["./start.sh"]
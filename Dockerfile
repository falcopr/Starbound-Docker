FROM debian:buster

LABEL Maintainer="Falco Prescher"
LABEL Github="https://github.com/falcoprescher$STARBOUND_FOLDER-Docker"

ENV DEBIAN_FRONTEND noninteractive

ENV STEAM_USERNAME "anonymous"
ENV STEAM_PASSWORD ""
ENV STARBOUND_FOLDER "/starbound"
ENV STARBOUND_DATAFOLDER "${STARBOUND_FOLDER}/data"
ENV STARBOUND_SCRIPTSFOLDER "${STARBOUND_FOLDER}/scripts"
# ENV STARBOUND_LOCALE "de_DE"

# ENV LANG ${STARBOUND_LOCALE}.UTF-8

# Package cleanup and language setup
RUN apt-get clean && \
    apt-get update
    # apt-get update && \
    # apt-get install -y locales && \
    # echo "${STARBOUND_LOCALE}.UTF-8 UTF-8" > /etc/locale.gen && \
    # locale-gen ${STARBOUND_LOCALE}.UTF-8 && \
    # dpkg-reconfigure locales && \
    # /usr/sbin/update-locale LANG=$LANG 

# ENV LANGUAGE ${STARBOUND_LOCALE}.UTF-8
# ENV LC_ALL ${STARBOUND_LOCALE}.UTF-8

# Libraries and programs
RUN apt-get install curl tar zip lib32stdc++6 -y && \
    dpkg --add-architecture i386 && \
    apt-get install lib32gcc1 libvorbisfile3 -y

RUN mkdir -p $STARBOUND_DATAFOLDER
RUN mkdir -p $STARBOUND_SCRIPTSFOLDER
RUN mkdir -p /opt/steamcmd

# Steam CMD download and setup Starbound server
WORKDIR /opt/steamcmd
RUN curl -s http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar xzvf -

RUN chmod +x ./steamcmd.sh

# User Management
RUN adduser --disabled-password --gecos '' starbound
RUN chown -R starbound:starbound $STARBOUND_FOLDER
RUN chown -R starbound:starbound /opt/steamcmd

# Grant execution rights for script
COPY .${STARBOUND_SCRIPTSFOLDER}/start.sh ${STARBOUND_SCRIPTSFOLDER}/start.sh
RUN chmod +x ${STARBOUND_SCRIPTSFOLDER}/start.sh

USER starbound
WORKDIR $STARBOUND_FOLDER

# Ports
EXPOSE 21025
EXPOSE 21026

# Volume
VOLUME $STARBOUND_DATAFOLDER

# Start scripts
ENTRYPOINT ["./scripts/start.sh"]

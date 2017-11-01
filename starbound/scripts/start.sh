#!/bin/bash
/opt/steamcmd/steamcmd.sh \
    +@NoPromptForPassword 1 \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +force_install_dir $STARBOUND_DATAFOLDER \
    +app_update 211820 validate \
    +quit

/bin/cp -rf $STARBOUND_CONFIGFOLDER/starbound_server.config ${STARBOUND_DATAFOLDER}/storage/starbound_server.config

cd ${STARBOUND_DATAFOLDER}/linux
./starbound_server

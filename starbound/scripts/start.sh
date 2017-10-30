#!/bin/bash
/opt/steamcmd/steamcmd.sh \
    +@NoPromptForPassword 1 \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +force_install_dir $STARBOUND_DATAFOLDER \
    +app_update 211820 validate \
    +quit

cd ${STARBOUND_DATAFOLDER}/linux64

./starbound_server

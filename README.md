# Starbound-Docker

## Get started
1. ./build.sh
2. ./install.sh
3. ./run.sh

## Installing FrackingUniverse Mod (Server)
1. docker run -it --rm -v starbound:/starbound --entrypoint /bin/bash falcoprescher/starbound:1.0
2. cd mods
3. git clone https://github.com/sayterdarkwynd/FrackinUniverse.git
4. git checkout tags/5.4.878
5. git clone https://github.com/sayterdarkwynd/FrackinRaces.git
6. git checkout tags/4.283
7. Execute the script below for getting all the custom races
/opt/steamcmd/steamcmd.sh \
    +@NoPromptForPassword 1 \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +force_install_dir $STARBOUND_DATAFOLDER \
    +workshop_download_item 211820 740694177 \
    +workshop_download_item 211820 729558042 \
    +workshop_download_item 211820 732452461 \
    +workshop_download_item 211820 774083065 \
    +workshop_download_item 211820 850109963 \
    +workshop_download_item 211820 729597107 \
    +workshop_download_item 211820 729429063 \
    +workshop_download_item 211820 779096734 \
    +workshop_download_item 211820 730529826 \
    +workshop_download_item 211820 739436205 \
    +workshop_download_item 211820 729622432 \
    +workshop_download_item 211820 739676461 \
    +workshop_download_item 211820 741550312 \
    +workshop_download_item 211820 729432341 \
    +workshop_download_item 211820 732276079 \
    +workshop_download_item 211820 731106237 \
    +quit
8. Replace /starbound/linux/sbinit.config with the ./starbound/config/sbinit.config
9. exit
10. ./run.sh

## Installing FrackingUniverse Mod (Client)
1. In-game options check: 'Allow Assets Mismatch'
2. Steam Workshop install 'Xbawks Character Extender', 'Frackin' Universe', 'Frackin' Races', 'Frackin' Music'
3. Steam Workshop install any races 'Frackin' Universe supports
4. Alternatively use this link to install the mods all at once: http://steamcommunity.com/sharedfiles/filedetails/?id=1188014302

## Backup world files
1. ./backup.sh

## Restore world files
1. Change file in restore.sh to the backup you want to restore
2. ./restore.sh

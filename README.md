# Starbound-Docker

## Get started
1. ./build.sh
2. ./run.sh

## Installing FrackingUniverse Mod (Server)
1. docker run -it --rm -v starbound:/starbound --entrypoint /bin/bash falcoprescher/starbound:1.0
2. git clone https://github.com/sayterdarkwynd/FrackinUniverse.git
3. git checkout tags/5.4.878
4. git clone https://github.com/sayterdarkwynd/FrackinRaces.git
5. git checkout tags/4.283
6. Execute the script below for getting all the custom races
workshop_item_ids=(740694177 729558042 732452461 774083065 850109963 729597107 729429063 779096734 730529826 739436205 729622432 739676461 741550312 729432341 732276079 731106237)
for workshop_item_id in "${workshop_item_ids[@]}"
do
    /opt/steamcmd/steamcmd.sh \
        +@NoPromptForPassword 1 \
        +login $STEAM_USERNAME $STEAM_PASSWORD \
        +force_install_dir $STARBOUND_DATAFOLDER \
        +workshop_download_item 211820 $workshop_item_id \
        +quit
done
7. exit
8. ./start.sh

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

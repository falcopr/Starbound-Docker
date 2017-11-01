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
7. execute /starbound/scripts/install_fur.sh
8. exit
9. ./install.sh
10. docker run -it --rm -v starbound:/starbound --entrypoint /bin/bash falcoprescher/starbound:1.0
11. rm /starbound/linux/sbinit.config
12. curl https://raw.githubusercontent.com/falcoprescher/Starbound-Docker/master/starbound/config/sbinit.config --output /starbound/linux/sbinit.config
13. exit
14. ./run.sh

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

#!/bin/bash
cd data/mods
git clone https://github.com/sayterdarkwynd/FrackinUniverse.git
cd FrackinUniverse
frackinUniverseLatestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $frackinUniverseLatestTag
../FrackinRaces
git clone https://github.com/sayterdarkwynd/FrackinRaces.git
frackinRacesLatestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $frackinRacesLatestTag
cd ../..
./scripts/update_fur_chars.sh

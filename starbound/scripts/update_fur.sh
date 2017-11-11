#!/bin/bash
cd data
cd mods
cd FrackinUniverse
frackinUniverseLatestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $frackinUniverseLatestTag
../FrackinRaces
git fetch
frackinRacesLatestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $frackinRacesLatestTag
cd ../..
./scripts/update_fur_chars.sh

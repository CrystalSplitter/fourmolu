#!/usr/bin/env bash
set -eo pipefail
ORMOLU_LIVE=$(nix-build -A ormoluLive.website -j 1)
netlify deploy --alias=$(git log -1 --format="%H") -d $ORMOLU_LIVE
netlify deploy --prod -d $ORMOLU_LIVE

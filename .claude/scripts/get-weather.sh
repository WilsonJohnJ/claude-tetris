#!/bin/bash

CACHE_DIR="${HOME}/.cache/claude-weather"
CACHE_FILE="${CACHE_DIR}/weather.json"
CACHE_DURATION=900

mkdir -p "$CACHE_DIR"

LOCATION="${1:-Santa Cruz, Bolivia}"
ENCODED_LOCATION=$(echo "$LOCATION" | sed 's/ /%20/g')

# Fetch from wttr.in and format nicely
curl -s "https://wttr.in/${ENCODED_LOCATION}" 2>/dev/null

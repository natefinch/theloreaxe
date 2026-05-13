#!/bin/bash
# fetch-deck.sh — Fetches a Moxfield deck and saves it as Hugo data
#
# Usage: ./fetch-deck.sh <moxfield-url-or-deck-id>
# Example: ./fetch-deck.sh https://moxfield.com/decks/tUf66lw9ik6boigQH_d4Qw
# Example: ./fetch-deck.sh tUf66lw9ik6boigQH_d4Qw
#
# If Moxfield's API blocks the request (Cloudflare), you can manually
# fetch it from your browser:
#   1. Open your browser's Dev Tools (F12)
#   2. Go to the Console tab
#   3. Paste this (replace DECK_ID with your actual deck ID):
#
#      fetch('https://api2.moxfield.com/v3/decks/all/DECK_ID')
#        .then(r => r.json())
#        .then(d => {
#          const a = document.createElement('a');
#          a.href = URL.createObjectURL(new Blob([JSON.stringify(d)], {type:'application/json'}));
#          a.download = 'DECK_ID.json';
#          a.click();
#        });
#
#   4. Move the downloaded file to data/decks/DECK_ID.json in this repo

set -euo pipefail

INPUT="${1:?Usage: $0 <moxfield-url-or-deck-id>}"

# Extract deck ID from URL or use as-is
DECK_ID=$(echo "$INPUT" | grep -oE '[A-Za-z0-9_-]{20,}' | tail -1)
if [ -z "$DECK_ID" ]; then
  echo "Error: Could not extract deck ID from: $INPUT"
  exit 1
fi

OUTFILE="static/decks/${DECK_ID}.json"
API_URL="https://api2.moxfield.com/v3/decks/all/${DECK_ID}"

echo "Fetching deck ${DECK_ID}..."
echo "API URL: ${API_URL}"

HTTP_CODE=$(curl -s -o "$OUTFILE" -w '%{http_code}' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36' \
  "$API_URL")

if [ "$HTTP_CODE" != "200" ]; then
  rm -f "$OUTFILE"
  echo ""
  echo "Error: API returned HTTP ${HTTP_CODE} (likely Cloudflare block)"
  echo ""
  echo "To fetch manually from your browser:"
  echo "  1. Open https://moxfield.com/decks/${DECK_ID} in your browser"
  echo "  2. Open Dev Tools (F12) → Console"
  echo "  3. Run:"
  echo ""
  echo "     fetch('${API_URL}')"
  echo "       .then(r => r.json())"
  echo "       .then(d => {"
  echo "         const a = document.createElement('a');"
  echo "         a.href = URL.createObjectURL(new Blob([JSON.stringify(d)], {type:'application/json'}));"
  echo "         a.download = '${DECK_ID}.json';"
  echo "         a.click();"
  echo "       });"
  echo ""
  echo "  4. Move the downloaded file to: static/decks/${DECK_ID}.json in this repo"
  exit 1
fi

echo "Saved to ${OUTFILE}"
echo "Reference this deck in your post's front matter:"
echo "  decklist: \"https://moxfield.com/decks/${DECK_ID}\""

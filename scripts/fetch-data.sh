#!/bin/bash
# Fetch latest stake pool data from SOFZP repo
set -e

MANIFEST_URL="https://raw.githubusercontent.com/SOFZP/Solana-Stake-Pools-Research/main/stakepool-data/mainnet-beta/manifest.json"
DATA_DIR="$(dirname "$0")/../data"

echo "Fetching manifest..."
curl -s "$MANIFEST_URL" > "$DATA_DIR/manifest.json"

LATEST_URL=$(jq -r '.latest_data_url' "$DATA_DIR/manifest.json")
echo "Latest data: $LATEST_URL"

curl -s "$LATEST_URL" > "$DATA_DIR/latest.json"

# Extract key metrics
EPOCH=$(jq '.metadata.epoch' "$DATA_DIR/latest.json")
TIMESTAMP=$(jq -r '.metadata.timestamp_utc' "$DATA_DIR/latest.json")
POOLS=$(jq '.pool_definitions | length' "$DATA_DIR/latest.json")
VALIDATORS=$(jq '.validators | length' "$DATA_DIR/latest.json")

echo "Epoch: $EPOCH | Time: $TIMESTAMP | Pools: $POOLS | Validators: $VALIDATORS"
echo "{\"epoch\":$EPOCH,\"timestamp\":\"$TIMESTAMP\",\"pools\":$POOLS,\"validators\":$VALIDATORS,\"updated\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}" > "$DATA_DIR/status.json"

# Also fetch the last 5 historic snapshots for trend data
echo "Fetching historic data..."
jq -r '.historic_data_urls[-5:][]' "$DATA_DIR/manifest.json" | while read url; do
  FNAME=$(basename "$url")
  if [ ! -f "$DATA_DIR/historic/$FNAME" ]; then
    mkdir -p "$DATA_DIR/historic"
    curl -s "$url" > "$DATA_DIR/historic/$FNAME"
    echo "  Downloaded: $FNAME"
  fi
done

echo "Done!"

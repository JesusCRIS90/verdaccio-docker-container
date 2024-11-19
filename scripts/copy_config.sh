#!/bin/bash
TEMPLATE_FILE="./config.verdaccio.template.yaml"
DEST_FILE="./verdaccio/config/config.yaml"

if [ -f "$TEMPLATE_FILE" ]; then
  cp "$TEMPLATE_FILE" "$DEST_FILE"
  echo "Copied and moved template config to: $DEST_FILE"
else
  echo "Template config file not found: $TEMPLATE_FILE"
  exit 1
fi

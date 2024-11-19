#!/bin/bash

# Define the base directory for Verdaccio
BASE_DIR="./verdaccio"

# List of subdirectories to create
SUBDIRS=("config" "plugins" "storage")

# Check if the base directory already exists
if [ -d "$BASE_DIR" ]; then
  echo "The directory '$BASE_DIR' already exists."
else
  # Create the base directory
  mkdir -p "$BASE_DIR"
  echo "Created base directory: $BASE_DIR"
fi

# Loop through the subdirectories and create them
for DIR in "${SUBDIRS[@]}"; do
  FULL_PATH="$BASE_DIR/$DIR"
  if [ ! -d "$FULL_PATH" ]; then
    mkdir -p "$FULL_PATH"
    echo "Created directory: $FULL_PATH"
  else
    echo "The directory '$FULL_PATH' already exists."
  fi
done

echo "Verdaccio folder structure is ready."

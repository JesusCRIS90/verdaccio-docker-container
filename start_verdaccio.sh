#!/bin/bash
set -e

# Step 1: Load environment variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo ".env file not found. Exiting."
  exit 1
fi

# Step 2: Stopping and Removing Verdaccio Container
echo "Stopping and Deleting Verdaccio Container with Docker Compose..."
docker-compose down

# Step 3: Ensure scripts have executable permissions
echo "Ensuring all scripts have executable permissions..."
chmod +x ./scripts/create_verdaccio_struct.sh
chmod +x ./scripts/copy_config.sh
chmod +x ./scripts/create_default_user.sh

# Step 4: Create the Verdaccio folder structure
echo "Creating Verdaccio folder structure..."
./scripts/create_verdaccio_struct.sh

# Step 5: Copy and move the configuration file
echo "Copying and moving the config file..."
./scripts/copy_config.sh

# Step 6: Start the Verdaccio container
echo "Starting Verdaccio container with Docker Compose..."
docker-compose up -d

# Step 7: Optionally create a default user inside the running container
if [ "$CREATE_DEFAULT_USER" = "TRUE" ]; then
  echo "Creating default user inside the container..."
  docker exec verdaccio /scripts/create_default_user.sh
else
  echo "Skipping default user creation."
fi

echo "Verdaccio setup is complete. Access it at http://localhost:${HOST_PORT:-4873}"




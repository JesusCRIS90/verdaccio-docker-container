#!/bin/sh
set -e

# Start Verdaccio in the background
verdaccio &

# Wait for Verdaccio to be up and running
while ! wget -q --spider http://localhost:4873/; do
    echo "Waiting for Verdaccio to start..."
    sleep 5
done

# Check if default user environment variables are set
if [ ! -z "$VERDACCIO_DEFAULT_USER_NAME" ] && [ ! -z "$VERDACCIO_DEFAULT_USER_PASSWORD" ] && [ ! -z "$VERDACCIO_DEFAULT_USER_EMAIL" ]; then
    echo "Creating default user: $VERDACCIO_DEFAULT_USER_NAME"
    npm adduser \
        --registry http://localhost:4873 \
        --username "$VERDACCIO_DEFAULT_USER_NAME" \
        --password "$VERDACCIO_DEFAULT_USER_PASSWORD" \
        --email "$VERDACCIO_DEFAULT_USER_EMAIL"
fi

# Wait for Verdaccio to keep running
wait
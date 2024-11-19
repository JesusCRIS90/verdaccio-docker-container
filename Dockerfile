FROM verdaccio/verdaccio:latest

# Switch to root user to install curl
USER root

# Install curl
RUN apk add --no-cache curl

# Switch back to the non-root Verdaccio user
USER verdaccio

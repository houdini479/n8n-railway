# Use a more recent version of Node (check n8n's compatibility)
FROM node:18-alpine

ARG N8N_VERSION=1.58.2

# Install required system packages and n8n
RUN apk add --update graphicsmagick tzdata

# Switch to root user
USER root

# Install build dependencies, n8n, and then clean up
RUN apk --update add --virtual build-dependencies python3 build-base && \
    npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
    apk del build-dependencies

# Set the working directory
WORKDIR /data

# Expose the port (environment variable defined at runtime)
EXPOSE $PORT

# Set the environment variable to run n8n as root user
ENV N8N_USER_ID=root

# Start n8n
CMD export N8N_PORT=$PORT && n8n start

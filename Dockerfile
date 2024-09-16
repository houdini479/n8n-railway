# Base image with specific n8n version
FROM n8nio/n8n:0.228.2

# Install required system packages and dependencies in one layer
RUN apk add --update graphicsmagick tzdata && \
    npm install --location=global cheerio && \
    rm -rf /var/cache/apk/*

# Set the working directory
WORKDIR /data

# Expose the default n8n port (5678) or use environment variable PORT
EXPOSE 5678

# Set environment variable to run n8n as root user
ENV N8N_USER_ID=root

# Start n8n
CMD ["n8n", "start"]

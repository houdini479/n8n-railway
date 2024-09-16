# Use the specified version of n8n, defaulting to 'latest' if not provided
FROM n8nio/n8n:${N8N_VERSION:-latest}

# Set the working directory
WORKDIR /data

# Expose the default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]

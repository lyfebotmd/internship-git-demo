
FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy local index.html into Nginx web directory
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx when container starts
CMD ["nginx", "-g", "daemon off;"]

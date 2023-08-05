FROM debian:bullseye

# Install Nginx
RUN apt update && apt-get install -y nginx openssl && apt clean && rm -rf /var/lib/apt/lists/*

# Create SSL directory
RUN mkdir /etc/nginx/certs

# Expose the port 443 for access
EXPOSE 443/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
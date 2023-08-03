FROM debian:bullseye

# Install Nginx
RUN apt update && apt-get install -y nginx openssl

# Clear cache
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Copy the Nginx config
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Create SSL directory
RUN mkdir /etc/nginx/certs

# Expose the port 443 for access
EXPOSE 443/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
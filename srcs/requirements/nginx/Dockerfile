FROM debian:bullseye

# Install Nginx
RUN apt-update -y && apt install nginx -y

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the Nginx config
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose the port 443 for access
EXPOSE 443/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
FROM alpine:3.17

# Install Nginx and OpenSSL
RUN apk update && apk --no-cache add nginx openssl && rm -rf /var/cache/apk/*

# Expose port 443 for access
EXPOSE 443/tcp

# Run the Nginx server
CMD ["nginx", "-g", "daemon off;"]
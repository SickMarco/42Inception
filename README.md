# 42Inception
Docker Compose infrastructure with : NGINX, WordPress, MariaDB, and more

This project consists in having you set up a small infrastructure composed of different
services under specific rules. Each service has to run in a dedicated container. You also have to write your own Dockerfiles, one per service. The Dockerfiles must
be called in your docker-compose.yml by your Makefile.
It means you have to build yourself the Docker images of your project.

First of all, run:
```
./install.sh
```
in order to generate the SSL certificates for https connection and to create the folders that will be used to mount the volumes (for Wordpress and MariaDB) from the host to the container.


You can build and launch containers with:
```
make build && make up
```

Now you can open your browser and type one of the following URLs into the search bar so you can access the service of your choice (you can find and edit all credentials in srcs/.env).

|  URL  |   SERVICE   |
|-------|-------------|
|https://localhost | Wordpress |
|http://localhost | Static Website |
|http://localhost:8080 | Adminer |
|http://localhost:9042 | Portainer |
#
In order to use ftp you must first get the ip address of the container where vsftpd is installed:
```
docker exec -it srcs-ftp-1 sh  #Open shell in the container
ip addr  #show network interfaces
```
Copy the ip address in eth0 (not LOOPBACK). Open a new terminal and run:
```
ftp container_ip_addr 21
```
and insert login credentials. You can now use all the ftp commands.








# Xen Orchestra Docker Image
Docker image for Xen Orchestra, a global orchestration solution to manage and backup XCP-ng and XenServer.  
  
Original project link: https://github.com/vatesfr/xen-orchestra  
Original setup guide: https://xen-orchestra.com/docs/installation.html#from-the-sources
***
**Disclaimer:** Xen Orchestra persistance is not guaranteed. Use at your own risk.
***
## Build Prerequisites:  
1. The `xo_setup.sh` file should be in the same directory as the `Dockerfile`

## Build Instructions:  
Obtain and modify the build files as required. Use the following command to build the image (change the image name and tag as you please):  
`docker build . -t local/xo:5.93.1`
***
## Docker Compose Prerequisites:  
1. Create and place the `config.toml` in the same directory as the `docker-compose.yml`
***
**Note:** Unmodified, the container will run on port 80. Although this port is not exposed in the docker image or the in compose file, I would highly recommend placing this container behind a proxy. Also note that modifications need to be made to create an image that uses a non-root user.  

default credentials:  
user: admin@admin.net  
password: admin

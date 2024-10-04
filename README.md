# Xen Orchestra Docker Image
Docker image for Xen Orchestra, a global orchestration solution to manage and backup XCP-ng and XenServer.  
  
Original project link: https://github.com/vatesfr/xen-orchestra  
Original setup guide: https://xen-orchestra.com/docs/installation.html#from-the-sources
***
**Disclaimer:** Xen Orchestra persistance is not guaranteed. Use at your own risk.
**Issues:**  
- No known issues right now

**Note:** If you use SMB shares, make sure your NAS allows SMB3_00 as this is the highest SMB version supported by xcp-ng
***

## Build Instructions:  
1. Download/clone the repository.
2. Use the following command to build the image (change the image name and tag as you please):
`docker build . -t local/xo:5.93.1`

***
## Docker Compose Instructions:  
1. Modify the compose file as you please but note that the redis server name in `/etc/xo-server/config.toml` is defined as `xo-redis`
*** 

default credentials:  
user: admin@admin.net  
password: admin

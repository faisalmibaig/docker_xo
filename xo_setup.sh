#!/bin/bash

# base docker image is node:20.14.0-bookworm
# yarn is already installed on the base image

apt-get update && apt-get -y upgrade

#installation of dependencies
apt-get install -y build-essential libpng-dev git python3-minimal libvhdi-utils lvm2 cifs-utils nfs-common ntfs-3g

# redis running on redis:7.4.0-bookworm

#cloning the git repository for xen orchestra
git -C / clone -b master https://github.com/vatesfr/xen-orchestra

#install dependencies via yarn
yarn --cwd /xen-orchestra

#build xen orchesta via yarn
yarn --cwd /xen-orchestra build

#create folder for the config
mkdir /etc/xo-server

# copy server config
cp /xen-orchestra/packages/xo-server/sample.config.toml /etc/xo-server/config.toml

# define uri to redis
sed -i "s_#uri = 'redis://redis.company.lan/42'_uri = 'redis://xo-redis:6379/0'_" /etc/xo-server/config.toml

# enable forward headers
sed -i "s_#useForwardedHeaders = true_useForwardedHeaders = true_ /etc/xo-server/config.toml"

#sym link plugins to "/usr/local/lib/node_modules"
ln -s /xen-orchestra/packages/xo-server-audit /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-auth-github /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-auth-google /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-auth-ldap /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-auth-oidc /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-auth-saml /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-backup-reports /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-load-balancer /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-netbox /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-perf-alert /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-sdn-controller /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-test /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-test-plugin /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-transport-email /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-transport-icinga2 /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-transport-nagios /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-transport-slack /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-transport-xmpp /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-usage-report /usr/local/lib/node_modules/
ln -s /xen-orchestra/packages/xo-server-web-hooks /usr/local/lib/node_modules/

#default credentials:
#user: admin@admin.net
#password: admin
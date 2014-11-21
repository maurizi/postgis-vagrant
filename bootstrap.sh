#!/bin/sh

set -e

# Dependencies
sudo apt-get update
sudo apt-get install -y build-essential postgresql-9.3 postgresql-server-dev-9.3 libgeos-c1 libgdal-dev libproj-dev libjson0-dev libxml2-dev libxml2-utils xsltproc docbook-xsl docbook-mathml subversion autoconf

# Download source
svn co http://svn.osgeo.org/postgis/trunk postgis

# Compile
cd postgis
./autogen.sh
./configure
make
sudo make install
sudo ldconfig
sudo make comments-install

# Enable various commandline tools
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/shp2pgsql
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/pgsql2shp
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/raster2pgsql

sudo -u postgres psql -c 'CREATE ROLE vagrant WITH superuser;'
sudo -u postgres psql -c 'ALTER ROLE vagrant LOGIN;'
sudo -u postgres psql -c 'CREATE DATABASE vagrant WITH OWNER vagrant;'

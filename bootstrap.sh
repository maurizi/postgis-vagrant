# Dependencies
sudo apt-get update
sudo apt-get install -y build-essential postgresql-9.3 postgresql-server-dev-9.3 libgeos-c1 libgdal-dev libproj-dev libjson-c-dev libxml2-dev libxml2-utils xsltproc docbook-xsl docbook-mathml

# Download source
wget http://download.osgeo.org/postgis/source/postgis-2.1.3.tar.gz
tar xfz postgis-2.1.3.tar.gz
cd postgis-2.1.3

# Compile
./configure
make
sudo make install
sudo ldconfig
sudo make comments-install

# Enable various commandline tools
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/shp2pgsql
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/pgsql2shp
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/raster2pgsql

sudo -u postgres psql - c 'CREATE ROLE vagrant WITH superuser;'
sudo -u postgres psql - c 'ALTER ROLE vagrant LOGIN;'

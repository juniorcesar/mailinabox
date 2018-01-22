#!/bin/bash
# Nextcloud
##########################

source setup/functions.sh # load our functions
source /etc/mailinabox.conf # load global vars

# ### Installing Nextcloud

echo "Installing Nextcloud (contacts/calendar)..."

# Keep the php5 dependancies for the owncloud upgrades
apt_install \
	dbconfig-common \
	php5-cli php5-sqlite php5-gd php5-imap php5-curl php-pear php-apc curl libapr1 libtool libcurl4-openssl-dev php-xml-parser \
	php5 php5-dev php5-gd php5-fpm memcached php5-memcached

apt-get purge -qq -y owncloud*

apt_install php7.0 php7.0-fpm \
	php7.0-cli php7.0-sqlite php7.0-gd php7.0-imap php7.0-curl php-pear php-apc curl \
        php7.0-dev php7.0-gd memcached php7.0-memcached php7.0-xml php7.0-mbstring php7.0-zip php7.0-apcu

# Enable PHP modules and restart PHP.
restart_service php7.0-fpm

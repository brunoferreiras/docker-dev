#!/bin/bash
set -e

# Microsoft SQL Server Drivers
apt-get install -y apt-transport-https
 
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

#Download appropriate package for the OS version
#Choose only ONE of the following, corresponding to your OS version
#Ubuntu 16.04
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt-get update
ACCEPT_EULA=Y apt-get -y install msodbcsql17
# optional: for bcp and sqlcmd
ACCEPT_EULA=Y apt-get -y install mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
# source /usr/local/bin/virtualenvwrapper.sh
# optional: for unixODBC development headers
apt-get -y install unixodbc-dev

echo extension=pdo_sqlsrv.so >> /etc/php/7.1/apache2/conf.d/30-pdo_sqlsrv.ini
echo extension=pdo_sqlsrv.so >> /etc/php/7.1/cli/conf.d/30-pdo_sqlsrv.ini
echo extension=sqlsrv.so >> /etc/php/7.1/apache2/conf.d/20-sqlsrv.ini
echo extension=sqlsrv.so >> /etc/php/7.1/cli/conf.d/20-sqlsrv.ini

pecl install sqlsrv
pecl install pdo_sqlsrv

# apt-get -y install libapache2-mod-php7.1 apache2
a2dismod mpm_event
a2enmod mpm_prefork
a2enmod php7.1
echo "extension=sqlsrv.so" >> /etc/php/7.1/apache2/php.ini
echo "extension=sqlsrv.so" >> /etc/php/7.1/cli/php.ini
echo "extension=pdo_sqlsrv.so" >> /etc/php/7.1/apache2/php.ini
echo "extension=pdo_sqlsrv.so" >> /etc/php/7.1/cli/php.ini
# /etc/init.d/apache2 reload
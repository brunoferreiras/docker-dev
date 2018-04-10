FROM ubuntu:16.04

LABEL Bruno Souza <fs.brunoferreira@gmail.com>

# Let the container know that there is no tty
ENV DEBIAN_FRONTEN noninteractive

RUN dpkg-divert --local --rename --add /sbin/initctl && \
	ln -sf /bin/true /sbin/initctl && \
	mkdir /var/run/sshd && \
	mkdir /run/php && \	
	apt-get update && \
	apt-get install -y --no-install-recommends apt-utils \ 
		software-properties-common \
		python-software-properties \
		language-pack-en-base && \
	LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php && \
	apt-get update && apt-get upgrade -y && \
	apt-get install -y python-setuptools \ 
		curl \
		git \
		nano \
		vim \
		sudo \
		unzip \
		openssh-server \
		openssl \
		supervisor \
		memcached \
		ssmtp \
		cron

# Install Apache
RUN apt-get install -y apache2

# Install PHP 7.1
RUN apt-get install -y php7.1 \
		libapache2-mod-php7.1 \
		php7.1-cli \
		php7.1-common \
		php7.1-mbstring \
		php7.1-gd \
		php7.1-intl \
		php7.1-xml \
		php7.1-mysql \
		php7.1-mcrypt \
		php7.1-zip \
		mcrypt \
		php7.1-mcrypt \
		php-memcache \
		php7.1-json \
		php7.1-soap \
		php-pear \
		php7.1-dev 

# Cleanup
RUN apt-get remove --purge -y software-properties-common \
	python-software-properties && \
	apt-get autoremove -y && \
	apt-get clean && \
	apt-get autoclean

# Install Composer
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Apache configuration
COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

# Install SQL SERVER
# Shell for install MSSQL
ADD mssql.sh /usr/local/bin/mssql.sh
RUN chmod +x /usr/local/bin/mssql.sh

RUN /usr/local/bin/mssql.sh

# Expose Ports
EXPOSE 80

ENTRYPOINT [ "/usr/local/bin/run" ]
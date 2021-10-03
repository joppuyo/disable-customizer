ARG wp_docker_tag

FROM wordpress:$wp_docker_tag

RUN apt-get update && apt-get install -y sudo less mariadb-client

RUN pecl install xdebug-3.0.4 && docker-php-ext-enable xdebug

RUN curl -o /bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /bin/wp

RUN docker-php-ext-install \
pdo_mysql

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

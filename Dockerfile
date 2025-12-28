FROM mediawiki:latest

# Instalar extensión PostgreSQL para PHP
RUN apt-get update && \
    apt-get install -y \
    php-pgsql \
    postgresql-client && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-enable pgsql pdo pdo_pgsql

COPY init-mediawiki.sh /usr/local/bin/init-mediawiki.sh
RUN chmod +x /usr/local/bin/init-mediawiki.sh

EXPOSE 80

CMD ["/usr/local/bin/init-mediawiki.sh"]

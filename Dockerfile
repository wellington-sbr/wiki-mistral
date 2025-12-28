FROM mediawiki:latest

RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

COPY init-mediawiki.sh /usr/local/bin/init-mediawiki.sh
RUN chmod +x /usr/local/bin/init-mediawiki.sh

EXPOSE 80

CMD ["/usr/local/bin/init-mediawiki.sh"]

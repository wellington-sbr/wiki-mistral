FROM mediawiki:latest

# Copiar script
COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 80

# Ejecutar script al iniciar
CMD ["/usr/local/bin/init.sh"]

FROM mediawiki:latest

# Instalar herramientas
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

EXPOSE 80

# Arranca directamente Apache
CMD ["apache2-foreground"]

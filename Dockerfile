FROM node:18-alpine

WORKDIR /wiki

# Instalar Wiki.js globalmente
RUN npm install -g wiki.js

# Crear directorio de datos
RUN mkdir -p /wiki/data

# Exponer puerto
EXPOSE 3000

# Comando para iniciar Wiki.js
CMD ["node", "/usr/local/lib/node_modules/wiki.js/server"]

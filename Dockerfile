FROM node:18-alpine

WORKDIR /wiki

# Instalar git
RUN apk add --no-cache git

# Clonar el repositorio oficial de Wiki.js
RUN git clone --depth 1 https://github.com/Requarks/wiki.git . && \
    npm install --only=production

# Crear directorio de datos
RUN mkdir -p /wiki/data

# Exponer puerto
EXPOSE 3000

# Comando para iniciar
CMD ["node", "server/index.js"]

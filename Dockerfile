FROM node:20

# Crea carpeta de trabajo
WORKDIR /app

# Copia archivos esenciales para dependencias
COPY package.json yarn.lock ./

# Instala dependencias
RUN yarn install --frozen-lockfile

# Copia el resto del código
COPY . .

# Construye la app
RUN yarn build

# Expón el puerto que usa Rocket.Chat por defecto
EXPOSE 3000

# Comando para correr la app (ajusta si tu script se llama distinto)
CMD ["yarn", "start"]

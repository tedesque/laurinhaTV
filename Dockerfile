# Use uma imagem base do Nginx
FROM nginx:alpine

RUN apk add ffmpeg

# Copie o conteúdo do diretório atual para o diretório raiz do servidor Nginx
COPY player.html /usr/share/nginx/html

# Exponha a porta 80 para acessar o servidor
EXPOSE 80

WORKDIR /

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh

# CMD ["nginx", "-g", "daemon off;"]

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
FROM nginx:alpine

RUN apk add --no-cache gettext

# Remove config default
RUN rm -f /etc/nginx/conf.d/default.conf

# Copia o template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Porta usada pelo Railway
ENV PORT=8080

EXPOSE 8080

# Gera o conf e sobe o nginx
CMD sh -c "envsubst < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"

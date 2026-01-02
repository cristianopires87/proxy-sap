FROM nginx:alpine

RUN apk add --no-cache gettext

# Remove config default
RUN rm -f /etc/nginx/conf.d/default.conf

# Copia o template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 8080

CMD sh -c "export PORT=${PORT:-8080} && \
  envsubst '$PORT $CPI_URL $CPI_HOST' \
  < /etc/nginx/templates/default.conf.template \
  > /etc/nginx/conf.d/default.conf && \
  nginx -g 'daemon off;'"


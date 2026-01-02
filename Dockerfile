FROM nginx:alpine

RUN apk add --no-cache gettext apache2-utils

RUN rm -f /etc/nginx/conf.d/default.conf

COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 8080

CMD sh -c "envsubst '$CPI_URL $CPI_HOST' \
  < /etc/nginx/templates/default.conf.template \
  > /etc/nginx/conf.d/default.conf && \
  nginx -g 'daemon off;'"

FROM nginx:alpine

RUN apk add --no-cache gettext

# Remove qualquer config default no build
RUN rm -f /etc/nginx/conf.d/*.conf

# Copia o template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Start do container
CMD sh -c ' \
  rm -f /etc/nginx/conf.d/*.conf && \
  envsubst < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && \
  echo "==== FINAL NGINX CONF ====" && \
  nl -ba /etc/nginx/conf.d/default.conf && \
  echo "=========================" && \
  nginx -t && \
  nginx -g "daemon off;" \
'

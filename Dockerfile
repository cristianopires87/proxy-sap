FROM nginx:alpine

RUN apk add --no-cache gettext

# Remove QUALQUER config existente
RUN rm -f /etc/nginx/conf.d/*.conf

COPY nginx.conf.template /etc/nginx/templates/default.conf.template

CMD sh -c "
rm -f /etc/nginx/conf.d/*.conf && \
envsubst < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && \
echo '==== FINAL NGINX CONF ====' && \
nl -ba /etc/nginx/conf.d/default.conf && \
echo '=========================' && \
nginx -t && \
nginx -g 'daemon off;'
"

FROM nginx:alpine

# Necessário para envsubst
RUN apk add --no-cache gettext

# Remove config padrão
RUN rm /etc/nginx/conf.d/default.conf

# Copia template do nginx
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Porta default (Railway injeta $PORT)
ENV PORT=8080

EXPOSE 8080

# Gera config final e sobe o nginx
CMD sh -c "
envsubst < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf &&
echo '========== GENERATED NGINX CONF ==========' &&
nl -ba /etc/nginx/conf.d/default.conf &&
echo '=========================================' &&
nginx -t
"


FROM kong:0.12.1-alpine
COPY localtime /etc/localtime
COPY kong.conf /etc/kong
RUN apk add --update bash curl
HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD curl -f http://localhost:8001/ || exit 1

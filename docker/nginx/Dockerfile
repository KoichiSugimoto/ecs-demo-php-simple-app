FROM nginx:1.13.5-alpine

# ツールをインストール
RUN apk --update add openssl \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        libc-dev \
        make \
        openssl-dev \
        pcre-dev \
        zlib-dev \
        linux-headers \
        curl \
        gnupg \
        libxslt-dev \
        gd-dev \
        geoip-dev \
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Install app
RUN rm -rf /var/www/*
ADD src /var/www

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
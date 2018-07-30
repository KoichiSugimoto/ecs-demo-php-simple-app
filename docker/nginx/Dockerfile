FROM nginx:latest

# ツールをインストール
# RUN apk --update add openssl \

COPY ./default.conf /etc/nginx/conf.d/default.conf

# Install app
# RUN rm -rf /var/www/*
# ADD ../../src /var/www

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
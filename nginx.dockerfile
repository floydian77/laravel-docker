FROM nginx:1.13

RUN apt-get update && apt-get install -y openssl --no-install-recommends

ADD conf/nginx/default.conf /etc/nginx/conf.d/default.conf

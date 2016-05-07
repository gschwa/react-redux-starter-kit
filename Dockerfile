FROM nginx

MAINTAINER Brian Holmes "brian.holmes@isobar.com"

RUN apt-get update -qq \
 && apt-get install -qqy curl

#COPY NGINX CONFIGS OVER
RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
RUN mkdir /etc/nginx/ssl
COPY default /etc/nginx/sites-enabled/default
COPY default-ssl /etc/nginx/sites-available/default-ssl

COPY ./dist /var/www

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENV NODE_ENV production

CMD ["sh", "/run.sh"]

EXPOSE 80 443

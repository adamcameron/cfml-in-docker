FROM nginx:alpine

WORKDIR /usr/share/nginx/
ENV ENV=/root/.profile

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./sites/ /etc/nginx/sites-available

CMD ["nginx"]
#CMD ["nginx-debug"]

EXPOSE 80

FROM lucee/lucee:5.3

ARG LUCEE_PASSWORD

RUN apt-get update
RUN apt-get install vim --yes

COPY ./root_home/.bashrc /root/.bashrc
COPY ./root_home/.vimrc /root/.vimrc

WORKDIR  /var/www

COPY ./commandbox.properties /usr/local/bin/commandbox.properties
RUN curl -fsSl https://downloads.ortussolutions.com/debs/gpg | apt-key add -
RUN echo "deb https://downloads.ortussolutions.com/debs/noarch /" | tee -a /etc/apt/sources.list.d/commandbox.list
RUN apt-get update && apt-get install apt-transport-https commandbox --yes
RUN echo exit | box

COPY ./box.json /var/www/box.json
RUN mkdir -p /var/www/vendor
RUN box install

RUN echo ${LUCEE_PASSWORD} > /opt/lucee/server/lucee-server/context/password.txt

EXPOSE 8888

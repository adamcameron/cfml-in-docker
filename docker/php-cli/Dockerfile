FROM php:8-cli
RUN apt-get update

RUN apt-get install git --yes
RUN apt-get install net-tools iputils-ping --yes
RUN apt-get install zip unzip --yes
RUN apt-get install vim --yes

COPY ./root_home/.bashrc /root/.bashrc
COPY ./root_home/.vimrc /root/.vimrc

COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR  /usr/share/cfml-in-docker

CMD composer install ; bash
EXPOSE 9000

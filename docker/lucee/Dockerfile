FROM lucee/lucee:5.3

RUN apt-get update
RUN apt-get install vim --yes

COPY ./root_home/.bashrc /root/.bashrc
COPY ./root_home/.vimrc /root/.vimrc

WORKDIR  /var/www

EXPOSE 8080

FROM lucee/lucee:5.3

ARG LUCEE_PASSWORD

RUN apt-get update
RUN apt-get install vim --yes

COPY ./root_home/.bashrc /root/.bashrc
COPY ./root_home/.vimrc /root/.vimrc
COPY ./root_home/.gitconfig /root/.gitconfig
COPY ./.ssh /root/.ssh
COPY ./workspace.code-workspace /root/workspace.code-workspace
RUN chmod 600 /root/.ssh/id_ed25519
COPY ./web.xml /usr/local/tomcat/conf/web.xml

WORKDIR  /var/www

RUN git clone git@github.com:adamcameron/cfml-in-docker.git .

COPY ./commandbox.properties /usr/local/bin/commandbox.properties
RUN curl -fsSl https://downloads.ortussolutions.com/debs/gpg | apt-key add -
RUN echo "deb https://downloads.ortussolutions.com/debs/noarch /" | tee -a /etc/apt/sources.list.d/commandbox.list
RUN apt-get update && apt-get install apt-transport-https commandbox --yes
RUN echo exit | box

RUN mkdir -p vendor
RUN box install

RUN cp -R /var/www/vendor/cfwheels/wheels /var/www/src/wheels

RUN box install commandbox-cfconfig
RUN box cfconfig import to=/opt/lucee/web from=/var/www/cfconfig.json

RUN echo ${LUCEE_PASSWORD} > /opt/lucee/server/lucee-server/context/password.txt

EXPOSE 8888

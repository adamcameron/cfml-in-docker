FROM mariadb:latest

COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
COPY ./conf/logging.cnf /etc/mysql/conf.d/logging.cnf
RUN chmod -R 644 /etc/mysql/conf.d/logging.cnf

CMD ["mysqld"]

EXPOSE 3306

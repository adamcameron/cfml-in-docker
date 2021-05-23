#!/bin/bash
clear; printf "\033[3J"
docker-compose stop
MARIADB_ROOT_PASSWORD=$1 MARIADB_PASSWORD=$2 docker-compose up --detach mariadb
MARIADB_PASSWORD=$2 docker-compose up --detach lucee
docker-compose start nginx

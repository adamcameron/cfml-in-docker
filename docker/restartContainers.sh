#!/bin/bash
clear; printf "\033[3J"
docker-compose stop
MARIADB_ROOT_PASSWORD=$1 MARIADB_PASSWORD=$2 docker-compose start --detach

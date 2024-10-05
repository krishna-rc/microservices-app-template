#!/bin/bash

mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -e "use ${MYSQL_DATABASE}"

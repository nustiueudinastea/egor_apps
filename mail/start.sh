#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
DATA=$SCRIPTPATH/../../data/mail

if [ ! -d "$DATA" ]; then
  echo "--- cant find a data directory for Mail, creating one"
  mkdir $DATA
fi

docker run -p 25:25 -p 993:993 -v $DATA:/extdata --name protos_mail -d protos_mail:latest /root/init.sh

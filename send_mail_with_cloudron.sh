#!/bin/bash
set -e
set -x

DOMAIN=`docker inspect --format '{{ .Config.Env }}' turn | awk '{print $2}' | awk -F '=' '{print $2}' | sed 's/^[^.]*.//'`
SEND_TO=$1
SEND_SUBJECT=$2
SEND_BODY=$3


if [ $# -lt 3 ]; 
   then 
   printf "Not enough arguments (%d given), needs: To, Subject & e-mail body.\n" $# 
   exit 0 
fi 

swaks -s `docker inspect --format '{{ .NetworkSettings.Networks.cloudron.IPAddress }}' mail` -p 2525 --au no-reply@$DOMAIN --ap `docker inspect --format '{{ .Config.Env }}' mail | tr ' ' '\n' | grep CLOUDRON_RELAY_TOKEN | sed 's/^.*=//'` -f no-reply@$DOMAIN -t $SEND_TO --h-Subject "$SEND_SUBJECT" --body "$SEND_BODY"

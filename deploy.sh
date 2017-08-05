#!/bin/bash

docker network create -d overlay hazelcast-genny


if [ -z "${1}" ]; then
HOST_IP=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && HOST_IP=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${HOST_IP}" ]; then
   HOST_IP=127.0.0.1
fi
else
   HOST_IP="${1}"
fi



echo "host ip = ${HOST_IP}"
HOST_IP=${HOST_IP} docker stack deploy --compose-file swarmtest.yml   --with-registry-auth   swarmtest 


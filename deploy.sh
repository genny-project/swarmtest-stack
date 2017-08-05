#!/bin/bash
MY_IP=`ifconfig eth0 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`
echo "host ip = ${MY_IP}"
MY_IP=${MY_IP} docker stack deploy --compose-file swarmtest.yml   --with-registry-auth   swarmtest 


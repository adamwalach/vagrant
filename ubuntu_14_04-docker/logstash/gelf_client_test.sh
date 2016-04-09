#!/bin/bash

docker stop gc
docker rm gc

docker run -d --name gc --log-driver=gelf --log-opt gelf-address=udp://172.17.0.2:12200 busybox \
    /bin/sh -c "while true; do echo '-------TEST MESSAGE-------'; sleep 2; done"

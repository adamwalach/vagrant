#!/bin/bash

docker stop logstash
docker rm logstash

docker run -d \
  --name logstash \
  -p 9292:9292 \
  -p 9200:9200 \
  -p 12200:12200 \
  -p 12200:12200/udp \
  -v /vagrant/logstash/conf.d:/opt/logstash/conf.d \
  pblittle/docker-logstash

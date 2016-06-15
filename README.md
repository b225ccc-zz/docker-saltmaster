# docker-saltmaster

[![Build Status](https://travis-ci.org/b225ccc/docker-saltmaster.svg?branch=master)](https://travis-ci.org/b225ccc/docker-saltmaster)

Running:

~~~ sh
docker run \
  --name saltmaster \
  -v /etc/localtime:/etc/localtime:ro \
  -v /data/services/salt:/salt \
  -p 4505:4505 \
  -p 4506:4506 \
  -e "LOG_LEVEL=debug" \
  b225ccc/docker-saltmaster:latest
~~~


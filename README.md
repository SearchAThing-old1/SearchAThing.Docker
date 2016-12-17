# Docker
docker scripts

## prerequisites

install docker engine

```shell
apt-get update
apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install docker-engine
```

## how to run

this will build the base image
```
cd base
./build.sh
```

to create the container from built image

```
./run.sh
```

to enter the running container

```
./utils/dk-exec base
```

## available containers

| container | description |
|---|---|
| base | common base utilities |
| mono | mono net framework runtimes and compiler |

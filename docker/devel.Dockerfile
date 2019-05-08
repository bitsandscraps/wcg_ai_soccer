FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        bear \
        build-essential \
        gcc \
        g++ \
        lsb-core

RUN mkdir -p /root
WORKDIR /root
COPY ./webots_2019a-rev1_amd64.deb ./
RUN apt-get update && apt-get install -y ./webots_2019a-rev1_amd64.deb
RUN rm ./webots_2019a-rev1_amd64.deb

COPY ./webots.conf /etc/ld.so.conf.d/
RUN ldconfig

RUN mkdir -p /root/controllers
RUN mkdir -p /root/extlibs
RUN mkdir -p /root/plugins

COPY ./make.sh ./
COPY ./make-controllers.sh ./
COPY ./make-plugins.sh ./

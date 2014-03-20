FROM phusion/baseimage

MAINTAINER "Dave Marr <dave.marr@gmail.com>"

ADD . /src

WORKDIR /src

RUN ./run.sh

FROM quay.io/sharpreflections/centos6-build-base
LABEL maintainer="juergen.wind@sharpreflections.com"


ARG version=7.80.0
ARG prefix=/opt/curl-$version

WORKDIR /build/

RUN yum -y install openssl-devel && \
    echo "Downloading curl" && curl -L https://curl.se/download/curl-$version.tar.bz2 --output curl.tar.bz2 && \
    tar xf curl.tar.bz2 && cd curl-$version && \
    echo "Building and installing curl" && \
    ./configure --prefix=$prefix --with-openssl && \
    make install && \
    rm -rf /build/*

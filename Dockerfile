FROM python:2.7.15-alpine3.7

MAINTAINER Global-solutions

ENV ANSIBLE_VERSION=2.5.5

RUN apk --update add --no-cache --virtual .deps gcc libc-dev openssl-dev make \
 && apk add --no-cache libffi-dev openssl \
    rsync openssh-client \
    git \
    tar \
 && pip install --no-cache-dir "ansible==$ANSIBLE_VERSION" \
 && apk del .deps \
 && rm -rf ~/.cache \
 && addgroup -g 1000 ansible \
 && adduser -u 1000 -G ansible -s /bin/sh -D ansible \
 && mkdir /ansible && chown ansible:ansible /ansible

USER ansible
WORKDIR /ansible

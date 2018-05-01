FROM python:2.7.14-alpine3.7

MAINTAINER Global-solutions

ENV ANSIBLE_VERSION=2.5.2

RUN apk --update add --no-cache --virtual .deps gcc libc-dev openssl-dev make \
 && apk add --no-cache libffi-dev \
 && pip install --no-cache-dir "ansible==$ANSIBLE_VERSION" \
 && apk del .deps \
 && rm -rf ~/.cache

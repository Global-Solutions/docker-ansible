FROM python:2.7.13-alpine

MAINTAINER Global-solutions

ENV ANSIBLE_VERSION=2.3.0.0

RUN apk --update add --no-cache --virtual .deps gcc libc-dev openssl-dev \
 && apk add --no-cache libffi-dev \
 && pip install --no-cache-dir "ansible==$ANSIBLE_VERSION" \
 && apk del .deps \
 && rm -rf ~/.cache

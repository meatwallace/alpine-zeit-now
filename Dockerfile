ARG NODEJS_VERSION="10.16.0"

FROM mhart/alpine-node:slim-${NODEJS_VERSION}

ARG NOW_VERSION="15.7.0-canary.9"

RUN \
  apk add --no-cache curl && \
  curl --location "https://github.com/zeit/now-cli/releases/download/${NOW_VERSION}/now-alpine.gz" --output /usr/bin/now.gz && \
  gunzip /usr/bin/now.gz && \
  ls -lah /usr/bin | grep now && \
  chmod +x /usr/bin/now && \
  apk del curl && \
  rm -rf /tmp/* /var/cache/apk/*

WORKDIR "/root/project"


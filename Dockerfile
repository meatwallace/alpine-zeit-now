ARG NODEJS_VERSION

FROM mhart/alpine-node:slim-${NODEJS_VERSION}

ARG NOW_CLI_VERSION

RUN \
  apk add --no-cache curl && \
  curl --location "https://github.com/zeit/now-cli/releases/download/${NOW_CLI_VERSION}/now-alpine.gz" --output /usr/bin/now.gz && \
  gunzip /usr/bin/now.gz && \
  chmod +x /usr/bin/now && \
  apk del curl && \
  rm -rf /tmp/* /var/cache/apk/*

ARG NODEJS_VERSION="10.16.3"

FROM mhart/alpine-node:${NODEJS_VERSION}

ARG NOW_VERSION="15.8.5"

RUN \
  npm config set ignore-scripts false && \
  npm install -g --unsafe-perm now@${NOW_VERSION}

WORKDIR "/root/project"

ENTRYPOINT ["/usr/bin/now"]
CMD ["deploy"]

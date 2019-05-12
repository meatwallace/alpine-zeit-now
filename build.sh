#!/bin/sh

set -euo pipefail

IMAGE_TAG="$DOCKER_USER/alpine-zeit-now"

docker build . \
  --build-arg="NOW_CLI_VERSION=$GIT_BRANCH" \
  --build-arg="NODEJS_VERSION=$NODEJS_LTS_VERSION" \
  --tag="$IMAGE_TAG:latest"


# if [ "$GIT_BRANCH" = "master" ]; then
  docker tag "$IMAGE_TAG:latest" "$IMAGE_TAG:$NOW_CLI_VERSION"

  echo "$DOCKER_PASS" | docker login --username "$DOCKER_USER" --password-stdin

  docker push "$IMAGE_TAG:$NOW_CLI_VERSION"
  docker push "$IMAGE_TAG:latest"
# fi

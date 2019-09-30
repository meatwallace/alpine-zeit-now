#!/bin/sh

set -eu

IMAGE_TAG="meatwallace/alpine-zeit-now"

echo "$DOCKER_PASS" | docker login --username "$DOCKER_USER" --password-stdin

docker build . --tag="$IMAGE_TAG:latest"

# run the container and print the `now` version to sanity check that we've
# built an image that runs with the correct version
NOW_VERSION="$(docker run "$IMAGE_TAG" --version)"

# tag the image with the appropriate version and push it if we're on master
if [ "$GIT_BRANCH" = "master" ]; then
  docker tag "$IMAGE_TAG:latest" "$IMAGE_TAG:$NOW_VERSION"

  docker push "$IMAGE_TAG:$NOW_VERSION"
  docker push "$IMAGE_TAG:latest"
fi

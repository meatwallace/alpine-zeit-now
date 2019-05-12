#!/bin/sh

set -euo pipefail

NODEJS_VERSION="$NODEJS_LTS_VERSION"
NOW_CLI_VERSION="$GIT_BRANCH"
IMAGE_TAG="$DOCKER_USER/alpine-zeit-now"

echo "$DOCKER_PASS" | docker login --username "$DOCKER_USER" --password-stdin

docker build . \
  --build-arg="CACHE_BUSTER=$(date +%s)" \
  --build-arg="NOW_CLI_VERSION=$NOW_CLI_VERSION" \
  --build-arg="NODEJS_VERSION=$NODEJS_VERSION" \
  --tag="$IMAGE_TAG:latest"

docker tag "$IMAGE_TAG:latest" "$IMAGE_TAG:$NOW_CLI_VERSION"

docker push "$IMAGE_TAG:$NOW_CLI_VERSION"
docker push "$IMAGE_TAG:latest"

SIZE_BYTES="$(docker image inspect $IMAGE_TAG:latest --format='{{.Size}}')"
SIZE_MB="$(printf "%.2f" "$((10**9 * SIZE_BYTES / 1000000))e-9")"

printf "%s\\n" "$IMAGE_TAG:$NOW_CLI_VERSION"
printf "%s: %s%s\\n" "size(uncompressed)" "$SIZE_MB" "MB"


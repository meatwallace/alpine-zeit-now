#!/bin/sh

set -eu

echo "$DOCKER_PASS" | docker login --username "$DOCKER_USER" --password-stdin

# the version extraction logic is brittle as it relies on extracting the end of
# the commit message, however we're able to enforce a strict commit message
# format as a side effect:
# release(#<issue_no>): meatwallace/alpine-zeit-now:<now_version>
COMMIT_MESSAGE="$(git log --format="%B" -n 1 HEAD | head -n 1)"
# as our image tag contains slashes, opted to use | as our seperator for sed
EXPECTED_NOW_VERSION="$(echo "$COMMIT_MESSAGE" | sed -E "s|release\(#[0-9]+\): $IMAGE_TAG:||")"

echo "Building meatwallace/alpine-zeit-now:$EXPECTED_NOW_VERSION"

docker build . \
  --build-arg="CACHE_BUSTER=$(date +%s)" \
  --build-arg="NODEJS_VERSION=$NODEJS_VERSION" \
  --build-arg="NOW_CLI_VERSION=$EXPECTED_NOW_VERSION" \
  --tag="$IMAGE_TAG:latest"

# run the container and print the `now` version to sanity check that we've
# built an image that runs with the correct version
ACTUAL_NOW_VERSION="$(docker run "$IMAGE_TAG" now --version)"

# verify that the versions match, otherwise bail out
if [ "$ACTUAL_NOW_VERSION" != "$EXPECTED_NOW_VERSION" ]; then
  echo "expected now@$EXPECTED_NOW_VERSION but received now@$ACTUAL_NOW_VERSION"

  exit 1
fi

NOW_CLI_VERSION="$ACTUAL_NOW_VERSION"

# determine and print out the uncompressed size which we'll add to our README,
# which sadly requires a custom function to be POSIX compliant
pow() {
  set "$1" "$2" 1
  while [ "$2" -gt 0 ]; do
    set "$1" $(($2 - 1)) $(($1 * $3))
  done
  printf "%d\n" "$3"
}

SIZE_BYTES="$(docker image inspect "$IMAGE_TAG:latest" --format='{{.Size}}')"
SIZE_MB="$(printf "%.2f" "$(($(pow 10 9) * SIZE_BYTES / 1000000))e-9")"

printf '%s\n\n' "$IMAGE_TAG:$NOW_CLI_VERSION"
printf '%s: %s%s\n' "size(uncompressed)" "$SIZE_MB" "MB"

# tag the image with the appropriate version and push it if we're on master
if [ "$GIT_BRANCH" = "master" ]; then
  docker tag "$IMAGE_TAG:latest" "$IMAGE_TAG:$ACTUAL_NOW_VERSION"

  docker push "$IMAGE_TAG:$ACTUAL_NOW_VERSION"
  docker push "$IMAGE_TAG:latest"
fi

# Zeit Now CLI Docker Images

[![CircleCI](https://circleci.com/gh/meatwallace/alpine-zeit-now.svg?style=svg)](https://circleci.com/gh/meatwallace/alpine-zeit-now)

Simple image containing Zeit's [`now` CLI](https://github.com/zeit/now-cli)
using [mhart/alpine-node](https://github.com/mhart/alpine-node)'s latest LTS
slim image as a base.

Images are available at the
[meatwallace/alpine-zeit-now](https://hub.docker.com/r/meatwallace/alpine-zeit-now)
repository, tagged `meatwallace/alpine-zeit-now:<now-version>`. All versions
\>=15.2.0 including canary releases should be available, however only the most
recent 20 of each will be listed below.

## Usage

All versions \>=15.3.0 allow for simple usage by including the function below
in your `~/.bashrc` or equivelant for your shell.

```sh
now() {
  # mounts your current working directory & your machines .now config folder
  docker run -it --rm --name="now" \
    --volume="$PWD:/root/project \
    --volume="$HOME/.now:/root/.now" \
    meatwallace/alpine-zeit-now now "$@"
}
```

## Releases

Stable releases:

| now-version     | nodejs-version | size (uncompressed) |
|-----------------|----------------|---------------------|
| 15.3.0          | 10.15.3        | 96.9MB              |
| 15.2.0          | 10.15.3        | 94.2MB              |

Canary releases:

| now-version     | nodejs-version | size (uncompressed) |
|-----------------|----------------|---------------------|
| 15.2.1-canary.7 | 10.16.0        | 98.7MB              |
| 15.2.1-canary.6 | 10.15.3        | 96.9MB              |
| 15.2.1-canary.5 | 10.15.3        | 96.9MB              |
| 15.2.1-canary.4 | 10.15.3        | 96.9MB              |
| 15.2.1-canary.3 | 10.15.3        | 96.9MB              |
| 15.2.1-canary.2 | 10.15.3        | 96.9MB              |
| 15.2.1-canary.1 | 10.15.3        | 95.2MB              |
| 15.2.1-canary.0 | 10.15.3        | 94.2MB              |
| 15.1.1-canary.4 | 10.15.3        | 94.2MB              |

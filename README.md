# :whale2: Zeit Now CLI Docker Images

[![CircleCI](https://circleci.com/gh/meatwallace/alpine-zeit-now.svg?style=svg)](https://circleci.com/gh/meatwallace/alpine-zeit-now)

Barebones Alpine Linux image containing Zeit's
[`now` CLI](https://github.com/zeit/now-cli) using
[mhart/alpine-node](https://github.com/mhart/alpine-node)'s latest LTS slim
image as a base.

Images are available at the
[meatwallace/alpine-zeit-now](https://hub.docker.com/r/meatwallace/alpine-zeit-now)
repository, tagged `meatwallace/alpine-zeit-now:<now-version>`. All versions
\>=15.2.0 including canary releases should be available, and are < 100MB
uncompressed.

## :rocket: Usage

To deploy your current working directory using the `now` CLI, simply run:

```shell
docker run -it --rm --volume="$PWD:/root/project" meatwallace/alpine-zeit-now now
```

All versions \>=15.3.0 allow for simple usage by including the function below in
your `~/.bashrc` or equivelant for your shell.

```shell
now() {
  # mounts your current working directory & your machines .now config folder
  docker run -it --rm \
    --volume="$PWD:/root/project \
    --volume="$HOME/.now:/root/.now" \
    meatwallace/alpine-zeit-now now "$@"
}
```

## :wrench: Contributing

### :speech_balloon: Code of Conduct

This project has adopted a [Code of Conduct](./CODE_OF_CONDUCT.md) that project
participants are expected to adhere to.

### :book: Contributing Guide

Read the [contributing guide](./CONTRIBUTING.md) to learn about how to propose
and contribute changes to this project.

### :scroll: License

This project is [MIT licensed](./LICENSE)

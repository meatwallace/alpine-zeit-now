# Zeit Now CLI Docker Images

[![CircleCI](https://circleci.com/gh/meatwallace/alpine-zeit-now.svg?style=svg)](https://circleci.com/gh/meatwallace/alpine-zeit-now)

Simple image containing Zeit's [`now` CLI](https://github.com/zeit/now-cli)
using [mhart/alpine-node](https://github.com/mhart/alpine-node)'s latest LTS
slim image as a base.

Images are available at the
[meatwallace/alpine-zeit-now](https://hub.docker.com/r/meatwallace/alpine-zeit-now)
repository, tagged `meatwallace/alpine-zeit-now:<now-version>`. All versions
\>=15.2.0 including canary releases should be available.

| now-version     | nodejs-version | size (un/compressed) |
|-----------------|----------------|----------------------|
| 15.2.1-canary.0 | 10.15.3        | 94.2mb / 36mb        |
| 15.2.0          | 10.15.3        | 94.2mb / 36mb        |
| 15.1.1-canary.4 | 10.15.3        | 94.2mb / 36mb        |

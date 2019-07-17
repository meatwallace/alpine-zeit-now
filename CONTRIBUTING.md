# :wrench: Contributing

:sparkle: Thanks for your interest in contributing! :sparkle:

The following is a set of guidelines for contributing; they are not rules. Use
your best judgement, and feel free to propose changes to this document in a pull
request.

## :speech_baloon: Code of Conduct

To ensure the project is kept open and inclusive, please read and follow the
[Code of Conduct](./CODE_OF_CONDUCT.md)

## :construction: How can I contribute?

Given that the project is essentially simple build infrastructure with a release
cycle that mirrors the [Zeit Now CLI](https://github.com/zeit/now-cli/), the
types of changes that will be considered are typically limited to fixes and
improvements of:

- the Dockerfile - image size, documentation, best practices
- documentation - particularly regarding usage
- build & CI configuration - simplification, automation, or reliability related

## :stars: Submitting a Pull Request

Pull requests are very welcome and appreciated, however they should remain
focused in scope, and a final submission should avoid containing unrelated
commits.

**Please ask first** before embarking on any significant changes, or if you are
uncertain if your changes are in line with the project's purpose.

## :clipboard: How do I set up my environment?

To make changes to the project, you will require Docker and Yarn >= v1.13 so
that tooling within the project works as expected.

To install Yarn, please see their official
[installation instructions](https://yarnpkg.com/lang/en/docs/install/). Once
installed, simply run `yarn` in the root of the repository to install the
project's dependencies.

To install Docker, please see their official
[installation instructions](https://docs.docker.com/install/).

## :memo: What do I need to know before submitting?

This project follows a strict
[commit message structure](https://github.com/meatwallace/alpine-zeit-now/commits/master),
and while not required, you can ensure your commits adhere to this structure by
using the interactive [commitlint CLI](http://commitlint.js.org/) that is
included in the repository. After staging your files, simply run `yarn commit`
and follow the prompt.

During the commit process, git hooks are used to automatically format relevant
files and catch syntax errors using [prettier](https://prettier.io) and
[dockerfmt](https://github.com/jessfraz/dockfmt).

## :tada: Thankyou!

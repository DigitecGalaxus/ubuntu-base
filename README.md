# This repository is archived

> **Warning**
> With the [pull request in DigitecGalaxus/thinclients](https://github.com/DigitecGalaxus/thinclients/pull/17), this repository is no longer needed and therefore archived. The functionality for installing kernel packages lives in the thinclients repository now.

## Introduction

This repository creates a Docker image from the official ubuntu-base image. This allows us to further customize the ubuntu OS within a Docker image build and use Docker (with `docker import`) as an abstraction layer rather than doing a `chroot`. This has the benefit of being able to use docker build caches, as long as subsequent customization builds are executed on the same build agent.

[![Build Status](https://digitecgalaxus.visualstudio.com/SystemEngineering/_apis/build/status/Github/DigitecGalaxus.ubuntu-base?repoName=DigitecGalaxus%2Fubuntu-base&branchName=main)](https://digitecgalaxus.visualstudio.com/SystemEngineering/_build/latest?definitionId=1165&repoName=DigitecGalaxus%2Fubuntu-base&branchName=main)

## Prerequisites

- A docker host to build it manually or access to Azure DevOps to build it automatically with the [azure-pipelines.yml](azure-pipelines.yml) file.
- The docker image named `anymodconrst001dg.azurecr.io/planetexpress/squashfs-tools:latest`, the image which results from the build of the [squashfs-tools repository](https://github.com/DigitecGalaxus/squashfs-tools)

## Usage

Have the docker image from the prerequisites available locally.

Run the build script:

```sh
./build.sh
```

## Contribute

No matter how small, we value every contribution! If you wish to contribute,

1. Please create an issue first - this way, we can discuss the feature and flesh out the nitty-gritty details
2. Fork the repository, implement the feature and submit a pull request
3. Add yourself to the CONTRIBUTORS.txt file in that pull request
4. Your feature will be added once the pull request is merged

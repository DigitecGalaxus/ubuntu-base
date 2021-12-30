#!/bin/bash
set -eu -o pipefail

# Get netbootIP to pass it as build-arg for the DockerfileKernelPackage
if [[ $# -lt 1 ]]; then
        echo "Error: No arguments passed. Make sure to pass at least the Netboot IP Address"
else
        netbootIP="$1"
fi

# Building a docker image, which contains the official ubuntu-base distribution and converts it's filesystem into a tarball at /vart/live/tarball
# --no-cache to be sure that when this pipeline runs, we actually use the latest version of the official distribution
docker image build --no-cache -t ubuntu-base-with-tarball .

echo "Copying tarball from ubuntu-base image"
# Running a container such that we can copy out the tarball
containerID=$(docker container run -d ubuntu-base-with-tarball tail -f /dev/null)
docker cp $containerID:/var/live/tarball tarball
docker rm -f $containerID

# We have to explicitly name the image like the container registry here, otherwise AzureDevOps can't pick up the image correctly to push it
cat tarball | docker import - "anymodconrst001dg.azurecr.io/planetexpress/ubuntu-base:21.04-no-kernel"

docker image build --no-cache --build-arg NETBOOT_IP=$netbootIP -t anymodconrst001dg.azurecr.io/planetexpress/ubuntu-base:21.04 -f DockerfileKernelPackage .

rm -f tarball
# The docker image push will be done by the pipeline

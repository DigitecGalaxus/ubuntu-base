#!/bin/bash
set -e
kernelVersion=$(curl -s --connect-timeout 2 http://netboot.intranet.digitec/kernels/latest-kernel-version.json | jq -r .version)

if [[ "$kernelVersion" == "" ]]
then
  kernelVersion="5.11.0-16-generic"
  echo "Warning: Using fallback static kernel version $kernelVersion"
fi

apt-get -qq update && apt-get -qq install -y linux-image-$kernelVersion linux-modules-extra-$kernelVersion

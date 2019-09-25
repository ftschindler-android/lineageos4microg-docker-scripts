#!/bin/bash

docker run \
    -e "BRANCH_NAME=lineage-16.0" \
    -e "DEVICE_LIST=potter" \
    -e "INCLUDE_PROPRIETARY=false" \
    -e "SIGN_BUILDS=true" \
    -e "SIGNATURE_SPOOFING=restricted" \
    -e "CUSTOM_PACKAGES=GmsCore GsfProxy FakeStore MozillaNlpBackend NominatimNlpBackend FDroid FDroidPrivilegedExtension OpenWeatherMapWeatherProvider" \
    -v "/data/container/lineageos4microg/keys:/srv/keys" \
    -v "/data/container/lineageos4microg/zips:/srv/zips" \
    -v "/data/container/lineageos4microg/devices/potter/lineage-16.0/src:/srv/src" \
    -v "/data/container/lineageos4microg/devices/potter/lineage-16.0/logs:/srv/logs" \
    -v "/data/container/lineageos4microg/devices/potter/lineage-16.0/manifests:/srv/local_manifests" \
    -v "/data/container/lineageos4microg/devices/potter/lineage-16.0/ccache:/srv/ccache" \
    lineageos4microg/docker-lineage-cicd


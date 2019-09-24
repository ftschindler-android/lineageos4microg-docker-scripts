#!/bin/bash

THISDIR="$(cd "$(dirname ${BASH_SOURCE[0]})" ;  pwd -P )"
BASEDIR="$(cd "$(dirname ${BASH_SOURCE[0]})/../../.." ;  pwd -P )"

for ii in zips keys; do
    mkdir -p ${BASEDIR}/$ii
done
for ii in src logs manifests ccache; do
    mkdir -p ${THISDIR}/$ii
done

docker run \
    --memory=10G \
    --kernel-memory=10G \
    --cpus=4 \
    -e "BRANCH_NAME=lineage-15.1" \
    -e "DEVICE_LIST=potter" \
    -e "INCLUDE_PROPRIETARY=false" \
    -e "SIGN_BUILDS=true" \
    -e "SIGNATURE_SPOOFING=restricted" \
    -e "CUSTOM_PACKAGES=GmsCore GsfProxy FakeStore MozillaNlpBackend NominatimNlpBackend FDroid FDroidPrivilegedExtension OpenWeatherMapWeatherProvider" \
    -e "USE_CCACHE=0" \
    -e "CCACHE_SIZE=1M" \
    -e "LOGS_SUBDIR=false" \
    -v "${BASEDIR}/zips:/srv/zips" \
    -v "${BASEDIR}/keys:/srv/keys" \
    -v "${THISDIR}/src:/srv/src" \
    -v "${THISDIR}/logs:/srv/logs" \
    -v "${THISDIR}/manifests:/srv/local_manifests" \
    -v "${THISDIR}/ccache:/srv/ccache" \
    lineageos4microg/docker-lineage-cicd


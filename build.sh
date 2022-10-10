#!/bin/bash

IMAGE_TAG=1.16.3
FINAL_IMAGE=gerault/unbound:${IMAGE_TAG}

echo "Building unbound image ${FINAL_IMAGE}"
docker build -t ${FINAL_IMAGE} \
             --build-arg IMAGE_TAG=${IMAGE_TAG} \
             --no-cache \
             --pull \
             .

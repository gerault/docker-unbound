#!/bin/bash

IMAGE_TAG=1.16.3
IMAGE_NAME=gerault/unbound:${IMAGE_TAG}

echo "Building unbound image ${IMAGE_NAME}"
docker build -t ${IMAGE_NAME} \
             --build-arg IMAGE_TAG=${IMAGE_TAG} \
             --no-cache \
             --pull \
             .

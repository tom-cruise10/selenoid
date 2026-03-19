#!/bin/bash

set -e

echo "$GITHUB_TOKEN" | docker login ghcr.io -u "$GITHUB_ACTOR" --password-stdin
IMAGE_ID=$(echo ghcr.io/$GITHUB_REPOSITORY | tr '[A-Z]' '[a-z]')
docker buildx build --pull --push -t "$IMAGE_ID:$1" --platform linux/amd64,linux/arm64 .

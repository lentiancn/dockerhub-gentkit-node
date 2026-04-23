#
# MIT License
#
# https://github.com/lentiancn/docker-gentkit-node/blob/main/LICENSE
#

#
# Use 'gentkit/alpine' as the base image with specified version
# NOTE : If ALPINE_IMAGE_TAG is "unknown", cause the 'gentkit/alpine' base image to fail the build to ensure the correct version is referenced.
#
ARG ALPINE_IMAGE_TAG="unknown"
FROM gentkit/alpine:${ALPINE_IMAGE_TAG} AS builder

#
# Define build arguments
#
ARG ROOTFS_FILE="unknown"

#
# Copy resources
#
ADD nodefs.tar.gz /

#
# Configure node
#
RUN set -eu && \
    # Update package index without caching \
    apk update --no-cache && \
    # Install dependencies \
    apk add --no-cache libstdc++

FROM scratch AS production

#
# Copy resources
#
COPY --from=builder / /

#
# Define environment variables
#
## Compile cache directory to improve build performance
ENV NODE_COMPILE_CACHE="/var/tmp/node-compile-cache"

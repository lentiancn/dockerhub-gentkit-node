#
# MIT License
#
# https://github.com/lentiancn/docker-gentkit-node/blob/main/LICENSE
#

#
# Stage 1 : Builder
#
## Use 'gentkit/alpine' as the base image with specified version
## NOTE : If ALPINE_IMAGE_TAG is "unknown", cause the 'gentkit/alpine' base image to fail the build to ensure the correct version is referenced.
ARG ALPINE_IMAGE_TAG="unknown"
FROM gentkit/alpine:${ALPINE_IMAGE_TAG} AS builder

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

#
# Stage 2 : Production
#
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

#
# Set the working directory to /root for subsequent instructions
#
WORKDIR /root

#
# Set the default command to execute when running the image
#
CMD ["/bin/sh"]

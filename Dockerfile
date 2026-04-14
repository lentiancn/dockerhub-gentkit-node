#
# MIT License
#
# https://github.com/lentiancn/docker-gentkit-node/blob/main/LICENSE
#

#
# If it is "unknown", cause the 'alpine' base image to fail the build to ensure the correct version is referenced.
#
ARG ALPINE_IMAGE_VERSION="unknown"

#
# Use 'gentkit/alpine' as the base image with specified version
#
FROM gentkit/alpine:${ALPINE_IMAGE_VERSION}

#
# Define build arguments for image metadata
#
ARG IMAGE_VERSION="unknown"
ARG IMAGE_BUILD_DATE="unknown"
# Node source, optional: official_bin (default), official_src, unofficial_bin, unofficial_src
ARG NODE_SOURCE="official_bin"
# Node source path, example "download/release/v24.14.1/node-v24.14.1-linux-x64-musl.tar.xz"
ARG NODE_SOURCE_PATH="unknown"
# Node source format, optional: tar.xz (default), tar.gz
ARG NODE_SOURCE_FORMAT="tar.xz"

#
# Image metadata labels following OCI Image Format Specification
#
LABEL maintainer="Len <lentiancn@126.com>" \
      description="A Docker image for the Node.js environment." \
      org.opencontainers.image.title="Node.js on Docker" \
      org.opencontainers.image.description="A Docker image for the Node.js environment." \
      org.opencontainers.image.vendor="GentKit" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/lentiancn/docker-gentkit-node" \
      org.opencontainers.image.version="${IMAGE_VERSION}" \
      org.opencontainers.image.created="${IMAGE_BUILD_DATE}"

#
# Install node
#
RUN set -eu && \
    # Install dependencies
    apk add --no-cache curl libstdc++ && \
    case "${NODE_SOURCE}" in \
            official_bin) \
                NODE_URL="https://nodejs.org/dist/${NODE_SOURCE_PATH}" \
                ;; \
            official_src) \
                NODE_URL="https://nodejs.org/dist/${NODE_SOURCE_PATH}" \
                ;; \
            unofficial_bin) \
                NODE_URL="https://unofficial-builds.nodejs.org/${NODE_SOURCE_PATH}" \
                ;; \
            unofficial_src) \
                NODE_URL="https://unofficial-builds.nodejs.org/${NODE_SOURCE_PATH}" \
                ;; \
            *) \
            echo "Error: Invalid NODE_SOURCE '${NODE_SOURCE}'. Must be one of: official_bin, official_src, unofficial_bin, unofficial_src" >&2; \
            exit 1 \
            ;; \
    esac && \
    # Download node installation package
    curl -fsSL "${NODE_URL}" -o nodetmpfs.${NODE_SOURCE_FORMAT} && \
    # Create node home
    mkdir -p /usr/local/node && \
    # Extract files to node home
    tar -C /usr/local/node -xf nodetmpfs.${NODE_SOURCE_FORMAT} --strip-components=1 && \
    # Remove temp file
    rm -rf nodetmpfs.${NODE_SOURCE_FORMAT} && \
    # Uninstall temp dependencies
    apk del curl && \
    # Create symbolic links for node commands
    ln -sf /usr/local/node/bin/node /usr/local/bin/node && \
    ln -sf /usr/local/node/bin/npm /usr/local/bin/npm && \
    ln -sf /usr/local/node/bin/npx /usr/local/bin/npx && \
    # Extract Alpine Version from os-release and set welcome message
    ALPINE_ACTUAL_VERSION=$(grep VERSION_ID /etc/os-release | cut -d'=' -f2) && \
    NODE_ACTUAL_VERSION=$(node -v | cut -d'v' -f2) && \
    NPM_ACTUAL_VERSION=$(npm -v) && \
    echo -e "\
    Welcome to Alpine Linux ${ALPINE_ACTUAL_VERSION} on Docker!\n\
    Node.js version: ${NODE_ACTUAL_VERSION}, NPM version: ${NPM_ACTUAL_VERSION}" > /etc/motd

# Set the working directory to /root for subsequent instructions
WORKDIR /root

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
FROM gentkit/alpine:${ALPINE_IMAGE_TAG}

#
# Define build arguments for image metadata
#
ARG ALPINE_IMAGE_TAG="unknown"
## Node source, optional: official_bin (default), official_src, unofficial_bin, unofficial_src
ARG NODE_SOURCE="official_bin"
## Node source path, example "download/release/v24.14.1/node-v24.14.1-linux-x64-musl.tar.xz"
ARG NODE_SOURCE_PATH="unknown"

#
# Prepare node
#
RUN set -eu && \
    # Download node installation package \
    apk add --no-cache curl libstdc++ && \
    case "${NODE_SOURCE}" in \
            official_bin) \
                NODE_URL="https://nodejs.org/${NODE_SOURCE_PATH}" \
                ;; \
            official_src) \
                echo "Error: NODE_SOURCE 'official_src' is not supported. Please use 'official_bin' or 'unofficial_bin'" >&2; \
                exit 1 \
                ;; \
            unofficial_bin) \
                NODE_URL="https://unofficial-builds.nodejs.org/${NODE_SOURCE_PATH}" \
                ;; \
            unofficial_src) \
                echo "Error: NODE_SOURCE 'unofficial_src' is not supported. Please use 'official_bin' or 'unofficial_bin'" >&2; \
                exit 1 \
                ;; \
            *) \
            echo "Error: Invalid NODE_SOURCE '${NODE_SOURCE}'. Must be one of: official_bin, official_src, unofficial_bin, unofficial_src" >&2; \
            exit 1 \
            ;; \
    esac && \
    NODE_SOURCE_FORMAT=$(echo "${NODE_SOURCE_PATH}" | awk -F/ '{print $NF}' | grep -oE '\.(tar\.gz|tar\.xz)$' | cut -c2-) && \
    if [ -z "${NODE_SOURCE_FORMAT}" ]; then \
        echo "Error: NODE_SOURCE_PATH must end with .tar.gz or .tar.xz, got '${NODE_SOURCE_PATH}'" >&2; \
        exit 1; \
    fi && \
    curl -fsSL "${NODE_URL}" -o /tmp/nodetmpfs.${NODE_SOURCE_FORMAT} && \
    # Create node home \
    mkdir -p /usr/local/node && \
    # Extract files to node home \
    tar -C /usr/local/node -xf /tmp/nodetmpfs.${NODE_SOURCE_FORMAT} --strip-components=1 && \
    ## Create symbolic links \
    ln -sf /usr/local/node/bin/node /usr/local/bin/node && \
    ln -sf /usr/local/node/bin/npm /usr/local/bin/npm && \
    ln -sf /usr/local/node/bin/npx /usr/local/bin/npx && \
    # Assemble welcome message \
    ALPINE_VERSION=$(grep VERSION_ID /etc/os-release | cut -d'=' -f2) && \
    NODE_VERSION=$(node -v | cut -d'v' -f2) && \
    NPM_VERSION=$(npm -v) && \
    echo -e "\
Welcome to Alpine Linux ${ALPINE_VERSION} on Docker !\n\
Node.js version: ${NODE_VERSION}, NPM version: ${NPM_VERSION}" > /etc/motd && \
    # Create node filesystem \
    tar -czf /nodefs.tar.gz \
        -C / usr/local/node \
        -C / usr/local/bin/node \
        -C / usr/local/bin/npm \
        -C / usr/local/bin/npx \
        -C / etc/motd && \
    # Remove temp file \
    rm -rf /tmp/nodetmpfs.${NODE_SOURCE_FORMAT} && \
    # Uninstall temp dependencies \
    apk del curl libstdc++

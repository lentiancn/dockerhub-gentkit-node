#!/bin/bash
#
# MIT License
#
# https://github.com/lentiancn/docker-gentkit-node/blob/main/LICENSE
#
set -e
echo "build start!!!..."
NODE_URL="https://nodejs.org/${NODE_SOURCE_PATH}"
INSTALL_PREFIX="/usr/local/node"

curl -fsSL "${NODE_URL}" -o /tmp/nodetmpfs.${NODE_SOURCE_FORMAT}

mkdir -p /tmp/nodetmpfs

# Extract files to tmpfs
tar -C /tmp/nodetmpfs -xf /tmp/nodetmpfs.${NODE_SOURCE_FORMAT} --strip-components=1

cd /tmp/nodetmpfs

# Configure build for Alpine (musl)
## Using small-icu to avoid external ICU dependencies
echo "Configuring build for Alpine Linux (musl)..."
./configure --with-intl=small-icu --prefix="${INSTALL_PREFIX}"

# Build
echo "Building Node.js (this may take several minutes)..."
make -j4

# Install
echo "Installing Node.js to ${INSTALL_PREFIX}..."
sudo make install

# Update library cache for musl
echo "Updating library cache..."
ldconfig

cd ~
rm -rf /tmp/nodetmpfs
rm -rf /tmp/nodetmpfs.${NODE_SOURCE_FORMAT}

echo "build ready!!!..."
SLEEP 20

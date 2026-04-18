#!/bin/bash
#
# MIT License
#
# https://github.com/lentiancn/docker-gentkit-node/blob/main/LICENSE
#
# Build and install Node.js from source for Alpine Linux
# Based on https://github.com/nodejs/node/blob/main/BUILDING.md

set -e

VERSION="23.11.1"
BASE_URL="https://nodejs.org/dist/v${VERSION}"
SOURCE_TAR="node-v${VERSION}.tar.xz"
SOURCE_URL="${BASE_URL}/${SOURCE_TAR}"
INSTALL_PREFIX="/usr/local"

echo "=== Node.js v${VERSION} for Alpine Linux Build Script ==="

# Download source
curl -LO "${SOURCE_URL}"

# Extract source
echo "Extracting source tarball..."
tar -xf "${SOURCE_TAR}"
cd "node-v${VERSION}"

# Configure build for Alpine (musl)
# Using small-icu to avoid external ICU dependencies
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


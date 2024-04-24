#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"

# Define source and destination directories
DEVICE_TREES="$SCRIPT_DIR"
DEST_DIR="/opt/source/dtb-5.10-ti"

# Install device tree stuff
sudo rm -rf "$DEST_DIR/include/"
sudo rm -rf "$DEST_DIR/src/arm64/"
sudo cp -rf "$DEVICE_TREES/include/" "$DEST_DIR/"
sudo cp -rf "$DEVICE_TREES/arm64/" "$DEST_DIR/src/"
sudo make -C "$DEST_DIR" -f Makefile install_arm64

# Copy over extlinux.conf
sudo cp -rf "$DEVICE_TREES/extlinux_deb12.conf" "/boot/firmware/extlinux/extlinux.conf"

echo "Device trees setup"

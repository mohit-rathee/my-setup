#!/bin/bash

DEVICE="$1"
MOUNT_POINT="/mnt"

mkdir -p "$MOUNT_POINT"

mount "$DEVICE" "$MOUNT_POINT"

#!/bin/sh

hash_firmware_directory() {
  local dir="$SNAP/opencr"
  tar cf - "$dir" | sha256sum | awk '{print $1}'
}

write_firmware_hash() {
  local firmware_hash=$(hash_firmware_directory)
  logger -t $SNAP_NAME "OpenCR directory hash is $firmware_hash"
  logger -t $SNAP_NAME "$firmware_hash" > $SNAP_COMMON/OPENCR_HASH
}

is_hash_the_same() {
  local firmware_hash=$(hash_firmware_directory)
  logger -t $SNAP_NAME "OpenCR directory hash is $firmware_hash"
  local flashed_hash=$(cat "$SNAP_COMMON/OPENCR_HASH")
  logger -t $SNAP_NAME "Flashed OpenCR directory hash is $flashed_hash"
  if [ "$firmware_hash" = "$flashed_hash" ]; then
    logger -t $SNAP_NAME "Same hashes!"
    return 0
  fi
  logger -t $SNAP_NAME "Different hashes!"
  return 1
}


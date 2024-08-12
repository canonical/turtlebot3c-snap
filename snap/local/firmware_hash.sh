#!/bin/sh

hash_file() {
  sha256sum "$1" | awk '{print $1}'
}

hash_directory() {
  local dir="$1"
  local hash=""

  find "$dir" -type f -print0 | while IFS= read -r -d '' file; do
    file_hash=$(hash_file "$file")
    hash="$hash$file_hash"
  done

  # Calculate final hash of concatenated file hashes
  echo "$hash" | sha256sum | awk '{print $1}'
}

hash_firmware_directory() {
  hash_directory "$SNAP/opencr"
}

write_firmware_hash() {
  local firmware_hash=$(hash_firmware_directory)
  logger -t $SNAP_NAME "OpenCR directory hash is $firmware_hash"
  echo "${firmware_hash}" > "$SNAP_COMMON/OPENCR_HASH"
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


#!/bin/sh
# Fix volume permissions for Railway deployment
# The volume mounts as root; we need node user to write to it
if [ -d "/data" ]; then
  # Use sudo or run as root briefly to fix perms
  # Since we're USER node, we try to create the dir and handle gracefully
  mkdir -p /data/paperclip 2>/dev/null || true
fi
exec "$@"

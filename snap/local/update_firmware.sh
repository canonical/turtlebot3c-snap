#!/bin/sh

arch=$(uname -m)

if [ "$arch" = "x86_64" ]; then
  echo "System is AMD64, only ARM devices can update the firmware."
  exit 1
fi

OPENCR_PORT=$(snapctl get opencr-port)
echo "OpenCR port is: ${OPENCR_PORT}"

OPENCR_MODEL=$(snapctl get turtlebot3-model)
if [[ "$OPENCR_MODEL" == "waffle_pi" ]]; then
  OPENCR_MODEL="waffle"
fi
echo "OpenCR model is: ${OPENCR_MODEL}"

cd $SNAP/opencr
./update.sh "$OPENCR_PORT" "./$OPENCR_MODEL.opencr"


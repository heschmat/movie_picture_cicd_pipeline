#!/bin/bash

docker run --rm -it \
  -v "$PWD":/app \
  -w /app \
  -e CI=true \
  node:20 \
  sh -c "npm ci && npm test"

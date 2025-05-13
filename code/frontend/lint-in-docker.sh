#!/bin/bash

docker run --rm -it \
  -v "$PWD":/app \
  -w /app \
  node:20 \
  sh -c "npm install && npx eslint . --fix"

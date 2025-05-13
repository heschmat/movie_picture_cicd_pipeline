#!/bin/bash

docker run --rm -it \
  -v "$PWD":/app \
  -w /app \
  python:3.10 \
  bash -c "
    pip install pipenv &&
    pipenv install --dev &&
    pipenv run flake8
  "

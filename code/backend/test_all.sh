#!/bin/bash

echo "🔍 Running Flake8 linting..."
./lint_in_docker.sh || exit 1

echo "✅ Lint passed. Running tests..."
./test_in_docker.sh || exit 1

echo "🎉 All backend checks passed!"

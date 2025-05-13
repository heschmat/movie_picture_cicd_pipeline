#!/bin/bash

echo "🔍 Running ESLint..."
./lint-in-docker.sh || exit 1

echo "✅ ESLint passed. Now running tests..."
./test-in-docker.sh || exit 1

echo "🎉 All checks passed!"

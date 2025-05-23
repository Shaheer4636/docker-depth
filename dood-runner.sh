#!/bin/sh

echo "Building Python app using DooD..."

docker build -t sample-python-app /workspace

docker run -d -p 5000:5000 sample-python-app

docker ps
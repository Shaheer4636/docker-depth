#!/bin/sh

# Start Docker daemon in background
dockerd-entrypoint.sh &

# Wait for Docker daemon to be ready
echo "Waiting for Docker daemon to start..."
while(! docker info > /dev/null 2>&1); do
    sleep 1
done

echo "Docker is ready. Now building the image..."

# Build your app's image
docker build -t sample-python-app /workspace

# Run the container
docker run -d -p 5000:5000 sample-python-app

# Get logs
docker ps
docker logs $(docker ps -q)

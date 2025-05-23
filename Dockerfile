# Use an official Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy files into container
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Expose port and run the app
EXPOSE 5000
CMD ["python", "app.py"]

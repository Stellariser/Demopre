# Use a minimal, updated base image
FROM python:3.9-slim

# Set a non-root user
# As root
#RUN useradd -ms /bin/bash myuser
#USER myuser


# Copy only necessary files
WORKDIR /app
COPY app.py requirements.txt /app/

# Install dependencies with version pinning
RUN pip install --no-cache-dir -r requirements.txt

# Expose only required ports
EXPOSE 8080 3306

# Run the application
CMD ["python", "app.py"]

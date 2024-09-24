# Use a minimal, updated base image
FROM python:3.9-slim

# Set a non-root user
# As root
#RUN useradd -ms /bin/bash myuser
#USER myuser

# Update system packages and upgrade libexpat1 to fix security vulnerabilities
RUN apt-get update && apt-get install --no-install-recommends -y \
    libexpat1 && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Copy only necessary files
WORKDIR /app
COPY app.py requirements.txt /app/

# Install dependencies with version pinning
RUN pip install --no-cache-dir -r requirements.txt

# Expose only required ports
EXPOSE 8080 3306

# Run the application
CMD ["python", "app.py"]

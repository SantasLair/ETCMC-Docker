# Use the official Python base image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Update package lists and install necessary packages
# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    unzip \
    gcc \
    python3-dev \
    build-essential

# Create a directory named ETCMC
RUN mkdir ETCMC

# Copy the ETCMC_Linux.zip file from the host to the container
COPY ETCMC_Linux.zip .

# Unzip the ETCMC_Linux.zip file into the ETCMC directory
RUN unzip ETCMC_Linux.zip -d ETCMC

# Change permissions of the ETCMC directory to be fully accessible
RUN chmod -R 777 ETCMC

# Set the working directory to the ETCMC directory
WORKDIR /app/ETCMC

# Install dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Start the script and keep the container alive
CMD ["sh", "-c", "python Linux.py start --port 5000 & tail -f /dev/null"]

# Use a base image with necessary dependencies for training
FROM python:3.10

# Copy requirements file
COPY requirements.txt .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Copy the training script
COPY train.py .

# Copy the test script
COPY test.py .

# Create a directory named "data" in the working directory
RUN mkdir data

# Copy train and test data to data folder
COPY data/train.csv data/
COPY data/test.csv data/

# Run the training script during build phase
RUN python train.py

# Command to run the test script when the container is started
CMD ["python", "test.py"]

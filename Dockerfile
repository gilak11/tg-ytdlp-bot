FROM python:3.10

ENV TZ=Asia/Kolkata

# Set the working directory
WORKDIR /app

# Copy the Python scripts and requirements file
COPY magic.py .
COPY config.py .
COPY requirements.txt .

# Update and install dependencies
RUN apt-get update -y \
    && apt-get install -y ffmpeg \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Set the entry point for the container
CMD ["python", "magic.py"]

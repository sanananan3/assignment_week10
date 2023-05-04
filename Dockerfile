# Base image
FROM ubuntu:latest

# Install python3 and git
RUN apt-get update && apt-get install -y python3 python3-pip git

# Create directories
RUN mkdir /root/A /root/B /root/C /root/files

# Create files
RUN touch /root/files/a.txt /root/files/b.txt /root/files/c.txt

# Clone assignment_week8 repository
RUN git clone https://github.com/sanananan3/sanaya.git /root/sanaya

# Set working directory
WORKDIR /root/sanaya

# Copy file_sort.py to current directory
COPY file_sort.py .

# Set environment variables
ENV PYTHONPATH "${PYTHONPATH}:/root/sanaya"

# Run command
CMD ["python3", "file_sort.py"]

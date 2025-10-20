# Use the official Python image
FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy requirements file
COPY requirements.txt /app/backend

# Install required system packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files into the image
COPY . /app/backend

# Expose Django’s default port
EXPOSE 8000

# Optional: run migrations during build (can be commented out if handled in pipeline)
# RUN python manage.py migrate
# RUN python manage.py makemigrations

# ✅ Start the Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]


# Use official Python image
FROM python:3.9

# Set work directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Django port
EXPOSE 8000

# Default command
CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]

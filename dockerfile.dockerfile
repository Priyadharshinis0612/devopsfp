# Install necessary dependencies
RUN pip install flask

# Add your application code
COPY . /app

# Set the working directory
WORKDIR /app

# Expose the Flask port
EXPOSE 5000

# Start the Flask app
CMD ["python", "app.py"]

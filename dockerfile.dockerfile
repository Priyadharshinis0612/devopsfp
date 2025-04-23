# Use a lightweight web server image (nginx)
FROM nginx:alpine

# Install Python and dependencies (for Flask)
RUN apk update && apk add python3 py3-pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Flask app and NGINX configuration file into the container
COPY . /app
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the HTML file to the web server's default folder
COPY index.html /usr/share/nginx/html/index.html

# Expose the ports for Flask and NGINX
EXPOSE 80 5000

# Start both NGINX and Flask app
CMD service nginx start && python /app/app.py

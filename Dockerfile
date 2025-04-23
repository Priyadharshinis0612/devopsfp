# Use a lightweight web server image
FROM nginx:alpine

# Copy your HTML file to the web server's default folder
COPY index.html /usr/share/nginx/html/index.html

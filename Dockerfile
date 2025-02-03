# Use nginx alpine as the base image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove existing files
RUN rm -rf ./*

# Install git and clone your portfolio repository
RUN apk add --no-cache git && \
    git clone https://github.com/Bindhhuu/Resume.git /temp-repo && \
    cp -r /temp-repo/* . && \
    rm -rf /temp-repo

# Expose port 80 for serving the site
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

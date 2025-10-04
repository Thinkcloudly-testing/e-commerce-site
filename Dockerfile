# Build stage
FROM node:16 as buddy

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Start the application
#CMD ["npm", "start"]

# Build the application
RUN npm run build

# Production stage
FROM nginx:alpine

# Copy build files from builder stage
COPY --from=buddy /app/build /usr/share/nginx/html

# Copy nginx configuration
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

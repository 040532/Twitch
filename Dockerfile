# Dockerfile for fullstack monorepo
FROM node:18

# Set working directory
WORKDIR /app

# Copy server files
COPY server ./server
COPY client ./client

# Install server dependencies
WORKDIR /app/server
RUN npm install

# Build client
WORKDIR /app/client
RUN npm install && npm run build

# Serve static files from server (if supported)
# You can move build files to server/public or similar if needed

# Set working dir back to server
WORKDIR /app/server

# Set environment variable
ENV NODE_ENV=production
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start the server
CMD ["npm", "start"]

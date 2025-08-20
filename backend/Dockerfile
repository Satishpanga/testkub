# Use the official Node.js 18 image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the backend files
COPY . .

# Expose backend port
EXPOSE 5000

# Start the backend
CMD ["node", "server.js"]

# # Use official Node.js 18 image
# FROM node:18

# # Set working directory
# WORKDIR /usr/src/app

# # Copy package files and install dependencies
# COPY package.json ./
# RUN npm install

# # Copy remaining frontend files
# COPY . .

# # Expose frontend development server port
# EXPOSE 3000

# # Start the frontend (development mode)
# CMD ["npm", "start"]


# Use official Node.js 18 image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json ./
RUN npm install

# Copy remaining frontend files
COPY . .

# Expose frontend development server port
EXPOSE 3000

# Ensure frontend listens on all interfaces
ENV HOST=0.0.0.0

# Start the frontend (development mode)
CMD ["npm", "start"]

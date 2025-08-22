# Stage 1: Build the application
FROM node:20-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --production

COPY . .

RUN npm run build # Or your specific build command (e.g., yarn build)

# Stage 2: Serve the application with a web server (e.g., Nginx)
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html # Adjust '/app/dist' to your build output directory

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]



# # ---------- Stage 1: Build React app ----------
# FROM node:18-alpine AS build

# WORKDIR /app

# # Install dependencies (only production)
# COPY package*.json ./
# RUN npm ci --only=production

# # Copy source code and build
# COPY . .
# RUN npm run build

# # ---------- Stage 2: Serve with Nginx ----------
# FROM nginx:alpine

# # Clean default files
# RUN rm -rf /usr/share/nginx/html/*

# # Copy built React files
# COPY --from=build /app/build /usr/share/nginx/html

# # Expose port 80
# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]



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

# # Ensure frontend listens on all interfaces
# ENV HOST=0.0.0.0

# # Start the frontend (development mode)
# CMD ["npm", "start"]



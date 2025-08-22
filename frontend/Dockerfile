
# # ========================
# # Stage 1: Node Build Stage
# # ========================
# FROM node:18-alpine3.18 AS nodework

# WORKDIR /app

# # Install CA certificates for HTTPS
# RUN apk add --no-cache ca-certificates

# # Copy dependency files first for better caching
# COPY package.json package-lock.json ./

# # Install dependencies
# RUN npm ci --legacy-peer-deps

# # Copy rest of the source code
# COPY . .

# # Build React app
# RUN npm run build

# # ========================
# # Stage 2: Nginx Production Stage
# # ========================
# FROM nginx:1.23-alpine

# # Set working directory
# WORKDIR /usr/share/nginx/html

# # Remove default Nginx content
# RUN rm -rf ./*

# # Copy React build from Node stage
# COPY --from=nodework /app/build .

# # Expose port 3000
# EXPOSE 3000

# # Start Nginx
# ENTRYPOINT ["nginx", "-g", "daemon off;"]



# node block
FROM node:alpine3.18 as nodework
WORKDIR /app
COPY  package.json .
RUN npm install
COPY . .
RUN npm run build

# nginx block
FROM nginx:1.23-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*!SECTION
COPY --from=nodework /app/build .
# EXPOSE 80
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]



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

CMD ["nginx", "-g", "daemon off;"]



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



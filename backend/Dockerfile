# # Use the official Node.js 18 image
# FROM node:18

# # Set working directory
# WORKDIR /usr/src/app

# # Copy package files and install dependencies
# COPY package.json ./
# RUN npm install

# # Copy the rest of the backend files
# COPY . .

# # Expose backend port
# EXPOSE 5000

# # Start the backend
# CMD ["node", "server.js"]



# ---------- Stage 1: Install dependencies ----------
FROM node:18-alpine AS deps

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

# ---------- Stage 2: Copy only what’s needed ----------
FROM node:18-alpine

WORKDIR /app

# Copy node_modules from deps stage
COPY --from=deps /app/node_modules ./node_modules

# Copy only app source code (not tests, docs, etc.)
COPY . .

EXPOSE 5000

CMD ["node", "server.js"]

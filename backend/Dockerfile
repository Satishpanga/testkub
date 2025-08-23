# Stage 1: Install production dependencies
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Stage 2: Final image
FROM node:18-alpine

# Use a non-root user for security
USER node

WORKDIR /app

# Copy dependencies first
COPY --from=deps /app/node_modules ./node_modules

# Copy application source code
COPY --chown=node:node . .

EXPOSE 5000

CMD ["node", "server.js"]









# # Stage 1: Install production dependencies
# FROM node:18-alpine AS deps
# WORKDIR /app
# COPY package*.json ./
# RUN npm ci --only=production

# # Stage 2: Final image
# FROM node:18-alpine
# WORKDIR /app
# COPY --from=deps /app/node_modules ./node_modules
# COPY . .
# EXPOSE 5000
# CMD ["node", "server.js"]

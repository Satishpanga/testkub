# -------- Stage 1: Build the App --------
FROM node:18.20.8-slim AS builder

WORKDIR /app

# Copy package files and install deps
COPY package.json yarn.lock* package-lock.json* ./

RUN npm install

# Copy the rest of the code
COPY . .

# Build the static files (e.g., React/Vite)
RUN npm run build

# -------- Stage 2: Serve with Nginx --------
FROM nginx:1.25-alpine AS production

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy built static files from the build stage
COPY --from=builder /app/build /usr/share/nginx/html

# Optional: custom Nginx config (see below)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

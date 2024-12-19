# Use an official Node.js image as the base for building
FROM node:16-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy only the package.json and package-lock.json for efficient caching
COPY React-Demo/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the React app's source code
COPY React-Demo/ ./

# Build the React app for production
RUN npm run build

# Use a lightweight Node.js image to serve the app
FROM node:16-alpine

# Install a static file server
RUN npm install -g serve

# Set the working directory
WORKDIR /app

# Copy the production build from the build stage
COPY --from=build /app/dist ./dist

# Expose port 3000
EXPOSE 3000

# Serve the production build
CMD ["serve", "-s", "dist", "-l", "3000"]

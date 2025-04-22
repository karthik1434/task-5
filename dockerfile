# Use the official Node.js 18 image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install Strapi dependencies
RUN npm install

ENV NODE_ENV=production
# Build Strapi admin panel for production
RUN npm run build

# Copy the Strapi application files to the working directory
COPY . .

# Expose the port that Strapi runs on (default: 1337)
EXPOSE 1337

# Set the command to start the Strapi server in production mode.  Added --no-deprecation
CMD ["npm", "run", "start"]

# Use a lightweight Node.js image
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the entire application code
COPY . .

# Build the application
RUN npm run build

# Expose port 3000 for the frontend
EXPOSE 3000

# Serve the static files using 'serve'
CMD ["npx", "serve", "-s", "build", "-l", "3000"]

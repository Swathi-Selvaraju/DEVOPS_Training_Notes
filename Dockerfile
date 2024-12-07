# Step 1: Use Node.js 18 as the base image
FROM node:18 AS build

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code to the working directory
COPY . .

# Step 6: Build the React app
RUN npm run build

# Step 7: Use a lightweight Nginx image to serve the built app
FROM nginx:alpine

# Step 8: Copy the built React app from the previous stage to the Nginx container
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Expose the default Nginx HTTP port
EXPOSE 80

# Step 10: Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]

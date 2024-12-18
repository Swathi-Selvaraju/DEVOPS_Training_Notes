Previous Step - [Phase 3](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Daemonize.md)
# Phase 4 : Dockerization
This document provides step-by-step instructions to Dockerize the ReactJS frontend, Spring Boot backend, and MySQL database, and deploy the application using Docker Compose.

## Prerequisites
* Docker (Ensure Docker is installed and running)
* Docker Compose (Typically included with Docker Desktop or installed separately)
  >  `Docker Compose` is a tool that define and run multiple Docker containers using a single configuration file, typically named docker-compose.yml. This file uses YAML syntax to specify the services, networks, and volumes required for the application.

### 1. React JS Frontend
* Navigate to the `frontend folder`
  ```bash
   cd ems-ops-phase-0/react-hooks-frontend/
   ```
* Create a `Dockerfile`

  ```bash
   sudo nano Dockerfile
  ```
*  Add the following content:
   Dockerfile` for frontend
   ```bash

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
    ```
##### Give permission to `Dockerfile` for access Docker service
  ```bash
      sudo chmod +x Dockerfile
      sudo chown -R swathi:swathi Dockerfile
  ```

![image](https://github.com/user-attachments/assets/f9cb9ecf-9354-4283-b9d6-d2ab77786865)
### Dockerfile Explanation
The `Dockerfile` is optimized for production and uses a lightweight Node.js image. Below is a step-by-step explanation:
1. **Base Image:**
` FROM node:16-alpine`
  * Starts with the lightweight node:16-alpine image, which is ideal for production because of its small size and reduced attack surface.
2. **Set Working Directory:**
 `WORKDIR /app`
  * Sets the working directory inside the container to `/app`. All subsequent commands will operate relative to this directory.
3. **Copy Dependency Files:**
` COPY package*.json ./
  RUN npm install`
  * Copies the package.json and package-lock.json (if present) to the working directory.
  * Installs the application dependencies using npm install.
4. **Copy Application Code:**
 `COPY . .`
  * Copies all files from the current directory on the host machine to the working directory (/app) in the container.
5. **Build the Application:**
  `RUN npm run build`
  * Executes the build script defined in the package.json file to generate production-ready static files, typically stored in the build directory.
6. **Expose Application Port:**
 `EXPOSE 3000`
  * Informs Docker that the container will listen on port 3000, allowing external access to the application.
7. **Serving Static Files:**
`CMD ["npx", "serve", "-s", "build", "-l", "3000"]`
  * Uses npx serve to serve the static files in the build directory over port 3000.
---

### 2.  Spring Boot Backend
* Navigate to the `backend `folder
```bash
   cd ems-ops-phase-0/springboot-backend/
```
* Create a `Dockerfile`

``` bash
    sudo nano Dockerfile
```
* Add the following content:
Dockerfile` for backend
```bash
  # Use an OpenJDK image
  FROM openjdk:17-jdk-slim

  # Set the working directory
  WORKDIR /app

  # Copy the JAR file into the image
  COPY target/springboot-backend-0.0.1-SNAPSHOT.jar app.jar

  # Expose port 8080 for the backend
  EXPOSE 8080

  # Run the Spring Boot application
  CMD ["java", "-jar", "app.jar"]
```
####  DockerFile Explanation
This Dockerfile is designed to containerize a Spring Boot application.
1. **Base Image :**
`FROM openjdk:17-jdk-slim`
* Specifies the base image for the container.
* Uses the openjdk:17-jdk-slim image, which provides a lightweight Java Development Kit (JDK) for running Java applications.
2. **Working Directory :**
`WORKDIR /app`
* Sets the working directory inside the container to /app.
* All subsequent commands will be executed in this directory.
3. **Copy JAR File :**
`COPY target/springboot-backend-0.0.1-SNAPSHOT.jar app.jar`
* Copies the Spring Boot application JAR file from the target directory on the host to the container's /app directory with the name app.jar.
* Replace springboot-backend-0.0.1-SNAPSHOT.jar with your application's JAR file name if it differs.
4. **Expose Port :**
`EXPOSE 8080`
* Informs Docker that the application listens on port 8080.
* This is the default port for Spring Boot applications. You may need to map this port when running the container.
5.**Start the Application :**
`CMD ["java", "-jar", "app.jar"]`
* Specifies the command to run the application inside the container
* Uses the java -jar command to start the Spring Boot application
#### Screenshot of Dockerfile permission
![Screenshot 2024-11-30 135523](https://github.com/user-attachments/assets/952a8da1-abd7-4090-8621-503387ad6aa4)

###### Give Permission to `Docker file` for access
```bash
sudo chmod +x Dockerfile
sudo chown -R swathi:swathi Dockerfile
```
![image](https://github.com/user-attachments/assets/0eb89806-58a4-49ca-9f58-f18e69c9bbb4)
![image](https://github.com/user-attachments/assets/d47c3c90-d652-43a7-86d9-0dfcf1687856)


3. Docker Compose Configuration
* Navigate to the `root` folder
```bash
   cd ems-ops-phase-0/
```

* Create a `docker-compose.yml` file
```bash
   sudo nano docker-compose.yml
```

* Add the following content
```bash
version: '3.8'
services:
  # React Frontend Service
  frontend:
    build:
      context: ./react-hooks-frontend
      dockerfile: Dockerfile
    ports:
      - "3000:3000"  # React app accessible on localhost:3000
    networks:
      - frontend_network
    depends_on:
      - backend

  # Spring Boot Backend Service
  backend:
    build:
      context: ./springboot-backend
      dockerfile: Dockerfile
    ports:
      - "8080:8080"  # Spring Boot app accessible on localhost:8080
    environment:
      SPRING_DATASOURCE_URL: jdbc:mysql://database:3306/ems
      SPRING_DATASOURCE_USERNAME: username
      SPRING_DATASOURCE_PASSWORD: password
    depends_on:
      - database
    networks:
      - frontend_network
      - backend_network

  # MySQL Database Service
  database:
    image: mysql:8
    environment:
      MYSQL_DATABASE: ems
      MYSQL_ROOT_PASSWORD: password
      MYSQL_USER: username
      MYSQL_PASSWORD: password
    volumes:
      - mysql-data:/var/lib/mysql  # Persistent volume for database data
    networks:
      - backend_network

# Network Configuration to Isolate Services
networks:
  frontend_network:
    driver: bridge  # Network connecting frontend and backend
  backend_network:
    driver: bridge  # Network connecting backend and database

# Persistent Volume for MySQL Database
volumes:
  mysql-data:
    driver: local
```
##### Give Permission to `docker-compose.yml` for access
```bash
sudo chmod +x Dockerfile
sudo chown -R swathi:swathi docker-compose.yml
```
![image](https://github.com/user-attachments/assets/b616a046-7dde-4c6d-a6c7-f2d4906f33a4)
# Docker Compose File Explanation

This `docker-compose.yml` file orchestrates a multi-container application comprising a React frontend, a Spring Boot backend, and a MySQL database. Each service is configured to work seamlessly with the others using Docker Compose.
- version: '3.8' : The version key specifies the version of the Docker Compose file format being used.

- services: The services section defines all the containers that will be part of the application. Each service can have its configuration options, such as which image to use, environment variables, ports, and volumes.

### React Frontend Service:

- frontend: This is the name of the service for the React application.

- build: Specifies how to build the container.


     * context: The directory where the Dockerfile for the frontend is located (current path/react-hooks-frontend).

     * dockerfile: The name of the Dockerfile (assumed to be Dockerfile).

- ports: Maps port 3000 on the host to port 3000 in the container (3000 default port for React applications).

- networks: Connects this service to frontend_network.

- depends_on: Specifies that this service should start after the backend service is up and running.

### Spring Boot Backend Service:

- backend: This is the name of the service for the Spring Boot application.

- build: It specifies to find the Dockerfile for building.(currentpath/springboot-backend)

- ports: Maps port 8080 on the host to port 8080 in the container (8080 default port for Spring Boot applications).

- environment: Sets environment variables needed by Spring Boot to connect to MySQL.

     * SPRING_DATASOURCE_URL: The JDBC URL for connecting to MySQL, specifying the database name and connection options.
     * SPRING_DATASOURCE_USERNAME:should be default 'root' user.
     * SPRING_DATASOURCE_PASSWORD:password of the root user.

- depends_on: Ensures that this service starts after the database service is running.

- networks: Connects this service to both frontend_network and backend_network.

### Database Service

- database: This is the name of the service for MySQL.

- image: Uses the official MySQL image version 8.

- environment: Sets up MySQL with necessary configuration.

     * MYSQL_DATABASE creates a new database named mynewdatabase.

     * MYSQL_USER, MYSQL_PASSWORD, and MYSQL_ROOT_PASSWORD set credentials for accessing MySQL.

- ports: Maps port 3306 on the host to port 3306 in the container (3306 default MySQL port).

- volumes: Defines a persistent volume (mysql-data) that stores MySQL data in /var/lib/mysql, ensuring data persistence across container restarts.

- networks: Connects this service to backend_network.

- healthcheck: Monitors the health of the MySQL container by pinging it every 30 seconds. If it fails, it will retry up to five times before considering it unhealthy.

### Network Configuration

- This section defines custom networks for isolating services.

- frontend_network and backend_network are both created using the bridge driver, which allows containers on these networks to communicate with each other while keeping them isolated from other containers not on these networks.

### Persistent Volume

- This section defines a named volume called mysql-data. The driver specifies that it uses local storage, which means that data will be stored on your local filesystem. 
give more content on this file
---

#### Build and Run
* Build the `Docker images`:
```bash
docker-compose build
``` 
![Screenshot (889)](https://github.com/user-attachments/assets/e4f75063-0e6b-47e0-8ed0-033cf797fa26)

* Run the application:
``` bash
docker-compose up -d
```
![image](https://github.com/user-attachments/assets/8210e429-ec0a-4d5b-874c-b45280de8c87)
* `docker-compose up -d`
This command is used to start all the services defined in a `docker-compose.yml` file in detached mode, which means the containers will run in the background instead of attaching their logs to your terminal.
* `docker-compose`
The Docker Compose CLI tool, used to manage multi-container Docker applications.

Check the status of services:
```bash
docker-compose ps
```

![image](https://github.com/user-attachments/assets/a91c0fd5-4f97-4bad-8b77-3a5a5bdb03d2)


### Run the dockerized application

http://localhost:3000/employee
![image](https://github.com/user-attachments/assets/189ee97c-6bb9-4608-a3b0-80920fcea8c0)

##### Error :

![Screenshot (883)](https://github.com/user-attachments/assets/2bf20358-bcf4-4187-803c-8449a90fe92a)
I encountered an issue where the container was in an exited state due to a port conflict. After identifying the container in the exited state and restarting it, the container worked fine.
![Screenshot (888)](https://github.com/user-attachments/assets/0e0c8866-b4fc-4677-8753-29ed5b1bc38f)



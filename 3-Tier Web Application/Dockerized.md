# Dockerization
This document provides step-by-step instructions to Dockerize the ReactJS frontend, Spring Boot backend, and MySQL database, and deploy the application using Docker Compose.

## Prerequisites
* Docker (Ensure Docker is installed and running)
* Docker Compose (Typically included with Docker Desktop or installed separately)

1. React Frontend
* Navigate to the `frontend folder`
```bash
cd ems-ops-phase-0/react-hooks-frontend/
```
* Create a `Dockerfile`

```bash
sudo nano Dockerfile
```
* Add the following content:
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



2.  Spring Boot Backend
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



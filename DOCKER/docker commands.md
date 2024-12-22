**Docker :**

- Docker is a **container runtime engine** that takes up some space on your system to store the libraries and dependencies required for specific applications.
- It packages these resources in an isolated environment and runs them as containers. 
- This process ensures that applications run consistently across different systems, and this entire mechanism is referred to as Docker.
- It can avoid or reduce the infrastructure cost

**For example**: Let’s say Tomcat 8.5 is running on Ubuntu. If Ubuntu stops supporting this version of Tomcat, you can run it on Red Hat or centralized means, If you cannot upgrade a particular version of software for a specific time, it may become inoperable. To use a different version, you might need a new operating system and an additional server machine. Docker eliminates all these issues by allowing you to run different versions in isolated containers on the same machine.

**Container**

- Docker container is a runtime instance of an image. Allows developers to package applications with all parts needed such as libraries and other dependencies.
- Docker Containers are runtime instances of Docker images. 
- Containers contain the whole kit required for an application, so the application can be run in an isolated way. 

**Docker Image**

Image is a file in the template formate is a set of instruction used to create docker container in a read only format.

**Docker Commands:**
**Docker images**
### Docker Images
- `docker pull <image-name>`  
- Download an image from the registry.
![image](https://github.com/user-attachments/assets/b52d18e8-8965-430d-9d63-4c630977e420)

- `docker images`  
- List all downloaded images.
- ![image](https://github.com/user-attachments/assets/6ea9a7f8-4749-4e55-8300-c927e356f4ad)

- `docker rmi <image>`  
-  Removes a specific image.
-  ![image](https://github.com/user-attachments/assets/af1f8953-4074-49cb-ba84-3e1506228cbe)
---
### Docker Containers

- `docker run --name <container-name> <image-name>`  
-  Run a container from an image.
- ![image](https://github.com/user-attachments/assets/fd921064-5071-4948-97e7-36f0616bfc5d)

- `docker run -d <image>`
-  Run a container in detached mode.
- ![image](https://github.com/user-attachments/assets/4e3dcf97-3d7a-454d-bb20-975e7d43e1ee)

- `docker run -d -p <port-on-host>:<port-on-container> --name <container-name> <image-name>`  
-  Run a container with ports mapped.
- ![image](https://github.com/user-attachments/assets/a48315cd-66d0-4855-81a0-5791cfe28bb3)

- `docker ps`  
-  List all running containers.
- ![image](https://github.com/user-attachments/assets/00430be1-08b7-479c-b63d-87029266f2b7)

- `docker ps -a`  
-  List all containers, including stopped ones.
- ![image](https://github.com/user-attachments/assets/e82c9d69-b890-4f44-91c9-ace2a9d32618)

- `docker stop <container-name>`  
-  Stop a running container.
- ![image](https://github.com/user-attachments/assets/7f303b56-5dca-4212-a758-a2a5e405bc4b)

- `docker start <container-name>`  
-  Start a stopped container.
- ![image](https://github.com/user-attachments/assets/ec39ca7a-5725-467a-ba2f-f69bc2009cfd)

- `docker restart <container-name>`  
-  Restart a stopped container.
- ![image](https://github.com/user-attachments/assets/87b58407-9adb-4b1a-87c3-c197b949fc7b)


- `docker rm <container-ID>`  
-  Remove a stopped container.
- ![image](https://github.com/user-attachments/assets/d7adf379-865c-4348-8bfd-02a610b37a5e)

- `docker logs <container-name>`  
-  View logs of a container.
- ![image](https://github.com/user-attachments/assets/d61777a0-c4df-43a6-a14a-2f1da30d49e6)

- `docker inspect <container-name>`  
-  Get detailed information about a container.
-  ![image](https://github.com/user-attachments/assets/ebe51482-a8fa-4335-bd16-d632fee9dd9b)
- ![image](https://github.com/user-attachments/assets/ee302b10-4bc6-4215-9e38-93e2f88fd944)

- `docker exec -it <container> <command>`  
-  Execute a command inside a running container.
- ![image](https://github.com/user-attachments/assets/6300d4e2-1465-453b-8478-3273b62177ae)
![image](https://github.com/user-attachments/assets/ab8a7f31-7942-4c07-9d0f-913b1fea3c97)

---
### System Management

- `docker system df`  
-   Show Docker disk usage.
-   ![image](https://github.com/user-attachments/assets/3bc69d4d-4a67-4018-b67c-289d31b75635)

- `docker system prune`  
-  Remove unused Docker data (stopped containers, dangling images, etc.).
  
- `docker stats`  
-  Display real-time stats of running containers.
- ![image](https://github.com/user-attachments/assets/fddcdeec-725f-42ae-94cc-384667e67093)

- `docker info`  
-  Display Docker system-wide information.
- ![image](https://github.com/user-attachments/assets/91e490ef-b346-4cae-a5b3-aaafff1455d8)

---

### Networks

- `docker network ls`  
- List all Docker networks.
- ![image](https://github.com/user-attachments/assets/4871b477-f7fc-4d0b-b5c2-ec969daf8f73)

---

## Dockerfile

A Dockerfile is a text-based document used to create a container image. It provides instructions for the image builder on the commands to run, files to copy, startup command, and more.

### Common Instructions in Dockerfile:

- `FROM <image>`  
  Specifies the base image that the build will extend.

- `WORKDIR <path>`  
  Specifies the "working directory" for commands and file operations.

- `COPY <host-path> <image-path>`  
  Copies files from the host to the container image.

- `RUN <command>`  
  Runs the specified command during image building.

- `ENV <name> <value>`  
  Sets environment variables for the container.

- `EXPOSE <port-number>`  
  Indicates the port the image would like to expose.

- `USER <user-or-uid>`  
  Sets the default user for instructions.

- `CMD ["<command>", "<arg1>"]`  
  Sets the default command the container will run.

---

## Create a Dockerfile Example

### Step 1: Create a Project Directory

```bash
mkdir docker
cd docker
```
Step 2: Create an HTML File
Create an index.html file:

```bash
sudo nano index.html
Add content to the index.html file.
```
![image](https://github.com/user-attachments/assets/c6bc0179-4f7f-4383-9489-2ab0b4164b2a)

Step 3: Create the Dockerfile
Create a file named Dockerfile:

```bash

sudo nano Dockerfile
```
![image](https://github.com/user-attachments/assets/0da2e21a-1099-416a-b267-480e55b01a50)

Add the following content:

dockerfile
```bash
FROM nginx
COPY ./index.html /usr/share/nginx/html/index.html
```
Step 4: Build the Docker Image
```bash

docker build -t new-nginx-image .
```
Step 5: Run the NGINX Container
```bash

docker run --name my-new-nginx -p 8081:80 -d new-nginx-image
```
![image](https://github.com/user-attachments/assets/258f4dd2-e45a-4ef1-87ef-a6e12936d04a)

Step 6: Access in Web Browser
Open your browser and visit http://localhost:8081.
![image](https://github.com/user-attachments/assets/6dca5c4a-4b3a-4eac-a503-2d0b8a55d644)

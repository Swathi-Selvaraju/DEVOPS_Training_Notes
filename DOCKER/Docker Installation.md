# Docker Installation Guide

## Step 1: Update the System
Update the package index and upgrade installed packages to ensure the system is up to date.

  ```bash
   sudo apt update && sudo apt upgrade -y
 ```
## Step 2: Install Required Dependencies
Install necessary packages for setting up Docker.

```bash
sudo apt install -y ca-certificates curl gnupg lsb-release
```
## Step 3: Add Docker’s GPG Key
Add the official Docker GPG key to verify package authenticity.

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
## Step 4: Add Docker Repository
Add Docker’s official APT repository to the system.

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## Step 5: Update Package Information
Update the package list to include Docker packages.

```bash
sudo apt update
```
## Step 6: Install Docker Engine
Install Docker Engine, CLI, and required plugins.

```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Step 7: Verify Docker Version
To ensure that Docker was installed correctly, check its version.

```bash
docker --version
```
![image](https://github.com/user-attachments/assets/f395c2b1-4051-4462-9a52-54c432e284e5)

## Step 8: Verify Docker Installation
Check Docker’s status to ensure it is installed and running.

```bash
sudo systemctl status docker
```
![image](https://github.com/user-attachments/assets/280081d7-1d4b-46bb-9d42-d614f709d2d2)

## Step 9: Enable Docker to Start on Boot
Enable the Docker service to start automatically at boot.

```bash
sudo systemctl enable docker
```
## Step 10: Allow Running Docker Without `sudo` (Optional)
Add your user to the Docker group:

```bash
sudo usermod -aG docker $USER
# Example: sudo usermod -aG docker swathi
```

Log out and log back in, or restart your session:

```bash
newgrp docker
```

Verify your user is in the Docker group:

```bash
groups
```
## Step 11: Test Docker
Run a test container to confirm Docker is working correctly:

```bash
docker run hello-world
```
![image](https://github.com/user-attachments/assets/d01c7cef-b807-46d0-93a9-0dbac1b1428e)

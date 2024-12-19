# Tomcat Installation Guide

This guide provides step-by-step instructions to install and configure Apache Tomcat on a Linux system.

---

## Steps for Installation

### Step 1: Update the Package Index
Update the package index to ensure the system has the latest repository information.
```bash
sudo apt update
```

### Step 2: Install OpenJDK 11
Install OpenJDK 11, which is required for Tomcat.
```bash
sudo apt install openjdk-11-jdk
```

Verify the installed Java version:
```bash
java -version
```

### Step 3: Create a Tomcat User
Create a dedicated user for Tomcat with no login shell.
```bash
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
```

### Step 4: Download Tomcat
Navigate to the `/tmp` directory and download Tomcat version 8.5.100.
```bash
cd /tmp
sudo wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.zip
```

### Step 5: Extract the Tomcat Package
Extract the downloaded zip file and move it to `/opt/tomcat`.
```bash
unzip apache-tomcat-*.zip
sudo mv apache-tomcat-*/ /opt/tomcat/
```

### Step 6: Create a Symbolic Link
Create a symbolic link named `latest` pointing to the Tomcat installation directory for easier management.
```bash
sudo ln -s /opt/tomcat/apache-tomcat-* /opt/tomcat/latest
```

### Step 7: Set Permissions
Grant ownership of the Tomcat installation directory to the Tomcat user.
```bash
sudo chown -R tomcat: /opt/tomcat
```

### Step 8: Create a Systemd Service File
Create a service file for Tomcat to manage it as a system service.
```bash
sudo nano /etc/systemd/system/tomcat.service
```

Add the following content:
```
[Unit]
Description=Tomcat 8.5 servlet container
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"
Environment="CATALINA_BASE=/opt/tomcat/latest"
Environment="CATALINA_HOME=/opt/tomcat/latest"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
```
Save and close the file.

### Step 9: Start Tomcat Automatically
Reload the system daemon to apply the new service file.
```bash
sudo systemctl daemon-reload
```

Start the Tomcat service:
```bash
sudo systemctl start tomcat
```

Enable Tomcat to start on boot:
```bash
sudo systemctl enable tomcat
```

Verify that Tomcat is running:
```bash
sudo systemctl status tomcat
```

### Step 10: Start Tomcat Manually
If automatic start fails, you can start Tomcat manually.

Navigate to the Tomcat `bin` directory:
```bash
cd /opt/tomcat/latest/bin
```

Start Tomcat using the `startup.sh` script:
```bash
./startup.sh
```

Stop Tomcat using the `shutdown.sh` script:
```bash
./shutdown.sh
```

### Step 11: Access Tomcat
To access Tomcat, open a web browser and navigate to:
```
http://localhost:8080
```

---

Follow these steps to successfully install and manage Apache Tomcat on your Linux system.
![Screenshot 2024-11-09 141306](https://github.com/user-attachments/assets/5c34bf88-d8fe-481e-9edb-af2f5b45146d)

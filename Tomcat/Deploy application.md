[Previous Step Installation]()
# Deploying an Application in Tomcat

This guide provides step-by-step instructions to deploy an application in a Tomcat server setup.

---

## Steps to Deploy

### Step 1: Edit the Tomcat Users Configuration
Modify the `tomcat-users.xml` file to add a manager user.

1. Open the configuration file:
   ```bash
   sudo nano /opt/tomcat/latest/conf/tomcat-users.xml
   ```

2. Add the following user details inside the `<tomcat-users>` tag:
   ```xml
   <role rolename="manager-gui" />
   <user username="admin" password="admin" roles="manager-gui" />
   ```
3. Save and close the file.
![Screenshot 2024-11-09 150250](https://github.com/user-attachments/assets/bd89dcd5-cdee-4cca-8c5c-b1b751287a19)

### Step 2: Start the Tomcat Service
If running Tomcat manually:
```bash
cd /opt/tomcat/latest/bin
./startup.sh
```

Or if using `systemd`, start the service:
```bash
sudo systemctl start tomcat
```

Open a web browser and navigate to:
```
http://localhost:8080
```
![Screenshot 2024-11-09 141306](https://github.com/user-attachments/assets/70c8cab8-2fb4-4faa-adc1-6c930f275d45)

### Step 3: Open the Tomcat Manager
On the Tomcat home page, click on **Manager App** to open the Manager application. Log in with the credentials added in Step 1 (e.g., username: `admin`, password: `admin`).
![Screenshot 2024-11-09 151913](https://github.com/user-attachments/assets/fd2840f1-aa4f-45fd-b7f5-11c1b139a706)

### Step 4: Deploy a WAR File
1. Download a sample WAR file by searching for "sample WAR file for Tomcat" in a search engine.
2. In the Manager App, find the **Deploy** section.
3. Upload the downloaded WAR file to deploy your application.
![Screenshot 2024-11-09 152124](https://github.com/user-attachments/assets/4d4001d6-097f-4de1-ad11-ed100b6a0f22)

### Step 5: Access the Application
After successful deployment, access your application in a web browser using the URL:
```
http://localhost:8080/<project-name>
```
Example:
```
http://localhost:8080/sample
```
![Screenshot 2024-11-09 152932](https://github.com/user-attachments/assets/4cd5674c-8d2e-470d-b861-5471ce6da639)


Follow these steps to deploy and access your application in Tomcat effectively!

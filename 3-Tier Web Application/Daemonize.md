Previous Step - [Phase 2](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Backend-setup.md)
# Phase 3 : Daemonize the Services
This phase guides how to daemonize the services

## 1. Java Backend

#### Step:1 Prepare the Backend:

* Move out from project
![Screenshot 2024-11-29 101542](https://github.com/user-attachments/assets/b39e8fec-d308-423b-8fd7-330a45cedfdf)

* create a folder /opt/java-backend 
```bash 
sudo mkdir -p /opt/java-backend/

```
* Copy the `*.jar` generated in `Phase 2` using `mvn clean install` to `/opt/java-backend`

```bash
sudo cp -r /home/swathi/ems-ops-phase-0/springboot-backend/target/springboot-backend-0.0.1-SNAPSHOT.jar /home/swathi/opt/java-backend/
```
#### Step 2: Create the Service File:

``` bash
sudo nano /etc/systemd/system/app_ems.service
```
 Use the following.Replace 'user=swathi' with OS username.
```
 [Unit]
  Description=StudentsystemApplication Java service
  After=syslog.target network.target
  
  [Service]
  SuccessExitStatus=143
  User=swathi //Os username
  Type=simple
  Restart=on-failure
  RestartSec=10
  
  WorkingDirectory=/opt/java-backend/
  ExecStart=/usr/bin/java -jar springboot-backend-0.0.1-SNAPSHOT.jar
  ExecStop=/bin/kill -15 $MAINPID
  
  [Install]
  WantedBy=multi-user.target
  ```

#### Step 3: Start the Service:
```bash
    sudo systemctl daemon-reload
    sudo systemctl start reactapp_ems.service
    systemctl status reactapp_ems.service
```
## 2. Frontend-reactjs
### Step 1: Prepare the Frontend:

* Build the frontend application:
```bash
cd react-hooks-frontend/
```
* create a folder `opt/react-backend`
``` bash
sudo mkdir -p /opt/react-backend/
```
```bash
npm run build
```
After build the application, build/ folder is created inside the frontend
####  Copy the `build` folder generated phase-1 using `npm run build` to `/opt/react-frontend`
* Move the folder to /opt/react-backend folder

```bash
  sudo cp -r /home/swathi/ems-ops-phase-0/react-hooks-frontend/build/ /home/swathi/opt/react-backend/
 ```
 ### Step 2: Install `serve` node package

 ```bash
 npm install -g serve
 ```  

### Step 3: Create the `Systemd service`
 ```bash
  sudo nano /etc/systemd/system/reactapp_ems.service
```
* Paste the following configuration :
   ```bash
        [Unit]
        Description=StudentsystemApplication React service
        After=syslog.target network.target
        
        [Service]
        SuccessExitStatus=143
        User=swathi 
        Type=simple
        Restart=on-failure
        RestartSec=10
        
        WorkingDirectory=/opt/react-backend/
        ExecStart=serve -s build
        ExecStop=/bin/kill -15 $MAINPID
        
        [Install]
        WantedBy=multi-user.target
    ```
### Step 4 : Daemon Reload and systemctl command
  ```bash
    sudo systemctl daemon-reload
    sudo systemctl start reactapp_ems.service
    systemctl status reactapp_ems.service
  ```  
  
![Screenshot 2024-11-29 123601](https://github.com/user-attachments/assets/b323b27a-556f-4444-98d4-51fbb37171f7)

Next Step - [Phase 4](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Dockerized.md)

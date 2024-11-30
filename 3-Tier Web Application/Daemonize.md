
# Daemonize the Services

## Java Backend

1. Prepare the Backend:

* Move out from project
![Screenshot 2024-11-29 101542](https://github.com/user-attachments/assets/b39e8fec-d308-423b-8fd7-330a45cedfdf)

* create a /opt/java-backend folder
```bash 
sudo mkdir -p /opt/java-backend/

```
* Copy the backend *.jar file to this folder

```bash
sudo cp -r /home/swathi/ems-ops-phase-0/springboot-backend/target/springboot-backend-0.0.1-SNAPSHOT.jar /home/swathi/opt/java-backend/
```
####  Create the Service File:

``` bash
sudo nano /etc/systemd/system/app_ems.service
```
Paste the following configuration:
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

#### Start the Service:
```bash
    sudo systemctl daemon-reload
    sudo systemctl start reactapp_ems.service
    systemctl status reactapp_ems.service
```
## 2. Frontend-reactjs
Prepare the Frontend:

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
[image]
* Move the folder to /opt/react-backend folder
```bash
  sudo cp -r /home/swathi/ems-ops-phase-0/react-hooks-frontend/build/ /home/swathi/opt/react-backend/
 ```
 #### Install `serve` node package

 ```bash
 npm install -g serve
 ```  

### Create the `Systemd service`
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
* Daemon Reload and systemctl command
  ```bash
    sudo systemctl daemon-reload
    sudo systemctl start reactapp_ems.service
    systemctl status reactapp_ems.service
  ```  
  
![Screenshot 2024-11-29 123601](https://github.com/user-attachments/assets/b323b27a-556f-4444-98d4-51fbb37171f7)

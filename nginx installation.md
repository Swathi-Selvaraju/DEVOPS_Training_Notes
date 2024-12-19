# Installation of Nginx
> Nginx (pronounced as “Engine-X”) is an open source web server that is often used as reverse proxy or HTTP cache. It is available for Linux for free.
## Step 1: Update the Package
Update the package list to ensure you have the latest information about available packages.
```bash
sudo apt update
```

## Step 2: Install Nginx
Install the Nginx package.
```bash
sudo apt install nginx
```

## Step 3: Enable the Nginx Service
Ensure the Nginx service starts automatically on boot.
```bash
sudo systemctl enable nginx
```

## Step 4: Start the Nginx Service
Start the Nginx service.
```bash
sudo systemctl start nginx
```

## Step 5: Observe the Nginx Process
Check if the Nginx process is running.
```bash
ps aux | grep nginx
```

## Step 6: Check the Port Used by Nginx
Find out which port Nginx is listening on.
```bash
sudo lsof -i -P -n | grep LISTEN | grep nginx
```

## Step 7: Get the Status of the Nginx Service
Check the status of the Nginx service.
```bash
sudo systemctl status nginx
```

## Step 8: Stop the Nginx Service
Stop the Nginx service.
```bash
sudo systemctl stop nginx
```

## Step 9: Start the Nginx Service Again
Start the Nginx service again.
```bash
sudo systemctl start nginx
```

## Step 10: Kill the Nginx Process
To manually kill the Nginx process, first find the Process ID (PID):
```bash
ps aux | grep nginx
pidof nginx
```
Then, kill the process using the PID:
```bash
sudo kill -TERM <PID>
```
![Screenshot (796)](https://github.com/user-attachments/assets/890857bd-203b-420d-b4d4-78c735a5ea7a)
![Screenshot (798)](https://github.com/user-attachments/assets/b67d38a8-989a-4f35-bba3-ff07cf6a293a)
![Screenshot (799)](https://github.com/user-attachments/assets/a7747447-763e-4315-9efb-16015bb40831)
![Screenshot (793)](https://github.com/user-attachments/assets/37b42c4a-6d78-49a8-b7bc-029f701206c8)



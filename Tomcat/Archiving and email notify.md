# Archiving and Rotating Log Files, Email Notifications for Tomcat Failures

## 1. Archive and Rotate Log Files Every Hour

To manage the rotation and archiving of log files for Tomcat, we use **logrotate**, a Linux utility that automates this process. Below are the steps:

### Step 1: Install logrotate
```bash
sudo apt-get update
sudo apt-get install logrotate
```

### Step 2: Configure logrotate for Tomcat Logs
1. Create a new configuration file for Tomcat logs:
   ```bash
   sudo nano /etc/logrotate.d/tomcat
   ```
2. Add the following configuration:
   ```
   /opt/tomcat/logs/*.log {
       hourly
       missingok
       rotate 24
       compress
       delaycompress
       notifempty
       create 640 tomcat tomcat
       sharedscripts
       postrotate
           systemctl reload tomcat || true
       endscript
   }
   ```
  

3. Save and close the file using `Ctrl+O`, `Enter`, and `Ctrl+X`.

### Step 3: Test Configuration
Run the following command to test the log rotation setup:
```bash
sudo logrotate -f /etc/logrotate.d/tomcat
```

---

## 2. Email Notification for Tomcat Status

### Step 1: Install and Configure Mailutils
1. Install mailutils:
   ```bash
   sudo apt update
   sudo apt install mailutils
   ```

### Step 2: Create a Script to Check Tomcat Status
1. Create a shell script to check if Tomcat is running and send an email if it stops:
   ```bash
   sudo nano /usr/local/bin/check_tomcat.sh
   ```
2. Add the following script (replace `admin@example.com` with your email):
   ```bash
   #!/bin/bash
   # Check if Tomcat is running
   if ! systemctl is-active --quiet tomcat; then
       # If Tomcat is not running, send an email
       echo "Tomcat has stopped or failed to start!" | mail -s "Tomcat Service Alert" admin@example.com
   fi
   ```
   ![Screenshot 2024-11-10 195933](https://github.com/user-attachments/assets/bebc6046-5028-47fd-b156-ad8d4859292e)

3. Make the script executable:
   ```bash
   sudo chmod +x /usr/local/bin/check_tomcat.sh
   ```

### Step 3: Configure Postfix for Email Notifications

#### 1. Install and Configure Postfix
1. During the installation of `mailutils`, you may encounter Postfix configuration screens. Follow these steps:
   - **Select "Internet with smarthost"** and press `Enter`.
   - Leave the system mail name as `ubuntu` or change it to `localhost`.
   - For the **SMTP relay host**, use:
     ```
     [smtp.gmail.com]:587
     ```
![Screenshot 2024-11-09 200517](https://github.com/user-attachments/assets/fe82df50-b8a3-44d7-bd22-e9a4cc98b590)
![Screenshot 2024-11-09 201141](https://github.com/user-attachments/assets/c8bb98bc-139d-4afc-9285-bbb799dd2f3f)
![Screenshot 2024-11-09 201505](https://github.com/user-attachments/assets/7b478fdd-25c9-4e83-b7e0-928c39ffa694)

#### 2. Set Up Postfix to Use Gmail's SMTP Server
1. Edit the Postfix configuration file:
   ```bash
   sudo nano /etc/postfix/main.cf
   ```
2. Add the following settings at the end of the file:
   ```
   relayhost = [smtp.gmail.com]:587
   smtp_sasl_auth_enable = yes
   smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
   smtp_sasl_security_options = noanonymous
   smtp_tls_security_level = encrypt
   smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
   ```

   ![Screenshot 2024-11-10 204137](https://github.com/user-attachments/assets/685681ed-faef-437e-917d-51b44506a42a)

3. Create the `sasl_passwd` file to store your Gmail credentials:
   ```bash
   sudo nano /etc/postfix/sasl_passwd
   ```
   Add the following line (replace with your Gmail credentials):
   ```
   [smtp.gmail.com]:587 your-email@gmail.com:your-app-password
   ```
   ![Screenshot 2024-11-10 203659](https://github.com/user-attachments/assets/aa57f13f-361f-4e5c-a43b-19c0d2d42a04)

4. Secure and hash the password file:
   ```bash
   sudo chmod 600 /etc/postfix/sasl_passwd
   sudo postmap /etc/postfix/sasl_passwd
   ```
5. Restart Postfix:
   ```bash
   sudo systemctl restart postfix
   ```

#### Steps to Generate an App Password for Gmail
1. Enable **2-Step Verification** in your Google Account under the **Security** section.
2. Generate an **App Password** under **App Passwords** and copy the 16-character password.
3. Use this password in the `sasl_passwd` file instead of your Google account password.
![Screenshot 2024-11-10 163020](https://github.com/user-attachments/assets/bf07e215-cc30-40b1-b78e-b466feb0c8c0)
![Screenshot (821)](https://github.com/user-attachments/assets/8ca68b71-77b8-42fc-9dce-0d92bf31ce9f)

### Step 4: Set Up a Cron Job
1. Open your crontab for editing:
   ```bash
   sudo crontab -e
   ```
2. Add the following line to run the script every hour:
   ```
   0 * * * * /usr/local/bin/check_tomcat.sh
   ```
3. Save and exit.
   
![Screenshot 2024-11-10 175048](https://github.com/user-attachments/assets/1674d242-3329-4e77-8f4c-0123d59fb9ea)

### Step 5: Test the Script
1. Stop Tomcat manually to test the email notification:
   ```bash
   sudo systemctl stop tomcat
   ```
2. Ensure that the email is sent successfully when Tomcat is down.
![image](https://github.com/user-attachments/assets/cdab31a1-f523-4bdd-b1e1-df05b34434be)




# Logrotate Configuration for Tomcat

## Step 1: Create Logrotate Configuration

1. Open a terminal.
2. Create a new configuration file for Tomcat in the `/etc/logrotate.d/` directory:

   ```bash
   sudo nano /etc/logrotate.d/tomcat
   ```

## Step 2: Define the Logrotate Rules to Manage `catalina.out`

Add the following configuration to the file. Replace `/opt/tomcat/logs/` with the actual path to your Tomcat log directory:

```plaintext
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

### Explanation of the Directives

#### Log Path and File Pattern

```plaintext
/opt/tomcat/logs/*.log {
```
- Targets all `.log` files in the `/opt/tomcat/logs/` directory.
- Applies to any log file with the `.log` extension in the specified directory.

#### 1. Skip Missing Files

```plaintext
missingok
```
- Prevents errors if the specified log files are missing.
- Logrotate skips the rotation for missing files without producing an error message.

#### 2. Number of Log Rotations to Keep

```plaintext
rotate 24
```
- Retains the last 24 rotated log files.
- When the limit is reached, the oldest log file is deleted to free up disk space.

#### 3. Compression

```plaintext
compress
```
- Compresses rotated log files to save disk space, typically resulting in `.log.gz` files.

```plaintext
delaycompress
```
- Delays compression of the most recently rotated log file until the next rotation.
- Ensures the most recent rotated log is accessible without decompression.

#### 4. Skip Empty Logs

```plaintext
notifempty
```
- Skips rotation if the log file is empty.
- Prevents unnecessary rotation and avoids clutter.

#### 5. Create New Logs with Specific Permissions

```plaintext
create 640 tomcat tomcat
```
- Sets the permissions of new log files:
  - Owner: Read and write (6).
  - Group: Read-only (4).
  - Others: No access (0).
- Sets the ownership of new log files to the `tomcat` user and group.

#### 6. Shared Script

```plaintext
sharedscripts
```
- Ensures the `postrotate` script runs only once, even if multiple log files are rotated.

#### 7. Post-Rotate Script

```plaintext
postrotate
    systemctl reload tomcat || true
endscript
```
- Reloads the Tomcat service to ensure it writes to the new log file after rotation.
- The `|| true` prevents errors from stopping the logrotate process if the `systemctl` command fails.

## Step 3: Verify Ownership and Permissions

Ensure the log files and directory are owned by the `tomcat` user and group. Adjust permissions if necessary:

```bash
sudo chown -R tomcat:tomcat /opt/tomcat/logs
sudo chmod 640 /opt/tomcat/logs/*.log
```

## Step 4: Test the Logrotate Configuration

Run the following command to simulate log rotation and check for errors without making changes:

```bash
sudo logrotate -d /etc/logrotate.d/tomcat
```

## Step 5: Setup Cron Job to Run Every Minute

Create a script to monitor Tomcat logs:

```bash
sudo nano /usr/local/bin/check_tomcat.sh
```

Add the necessary script commands and make the file executable:

```bash
chmod +x /usr/local/bin/check_tomcat.sh
```

Schedule the cron job:

```bash
crontab -e
```

Add the following line to run the script every minute:

```plaintext
* * * * * /usr/local/bin/check_tomcat.sh

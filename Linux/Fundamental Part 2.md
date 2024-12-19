# Linux Fundamental -2 
## PROCESS
-	Process is a Set of instructions that CPU follows to complete the task 
-	We can perform multiple tasks in a system so kept it process is important to for multiple tasking
## PROCESS MANAGEMENT
- Each process use system resources like CPU, memory so OS managed these resource to ensure that each process get necessary resource to function properly
## Two types of process
1. Foreground process
   -	A process that currently running on the terminal
   - 	This process  is running in terminal mean we cannot use these terminal to run the other commands,Until process is finished or stopped
2. Background process
   -  Is run the terminal independently. It runs multiple terminals simultaneously

## User Management
- **Check Current User**: `whoami`
- **Add User**: `sudo adduser <username>`
- **Change Password**: `passwd <username>`
- **Switch User**: `su <username>`

## Process Management
- **List Processes**: `ps aux`
- **Monitor Processes**: `top` or `htop`
- **Kill a Process**: `kill <PID>`
- **Background Process**: `&` (e.g., `command &`)
  
## PROCESS MANAGEMENT COMMAND
-	`ps` - Display the current running process
- `top` - Provides a real time view of System process
-	`kill` - Stop the process of pid
-	`ps aux`- all process running in computer.
-	`top.h `- human readable 
-	`jobs`- background process
## SYSTEM MONITORING TOOLS
-	`du` -> directory space usage and space to estimate, check for entire file
-	`df` -> display disk space, Check for specific file or directory
-	`free`-> show memory and swap usage
## Networking Basics
- **Check IP Address**: `ip addr` or `ifconfig`
- **Ping a Host**: `ping <hostname>`
- **Test Port Connectivity**: `telnet <hostname> <port>` or `nc -z <hostname> <port>`
- **Check Network Statistics**: `netstat` or `ss`
## NETWORKING COMMANDS
-	`Ping` ->to test the server is reachable if check any package loss or not . eg: ping google.com
-	`Curl`-> any file can be download and transfer the data
- `Curl` -I -> It's used to fetch only the HTTP headers of a specified URL,`eg :curl -I https://www.example.com`
- `Curl-o `-> download zip file
- `Curl -h`-> check access have or not
- `telnet`-> used to test manage and debug port 
## File Permissions
Linux uses a permissions model to control access:
- `ls -l`: View permissions of files
- `chmod`: Change file permissions
- `chown`: Change file ownership

### Permission Types
- `r`: Read
- `w`: Write
- `x`: Execute
### Example
```bash
chmod 755 script.sh
```
This grants the owner full permissions and others read/execute permissions.

# SSH

## SSH (Secure Shell)
SSH is a protocol used to securely log into a remote machine and execute commands over an encrypted connection.
-	SSH stand for Secure shell hash protocol
-	It communicate b/w client and server
### SSH Authentication Methods
SSH supports two main types of authentication:
1. **Password-Based Authentication**
   - The user provides a password to authenticate.
   - Less secure compared to key-based authentication, as passwords can be guessed or intercepted.

2. **Key-Based Authentication**
   - Uses a pair of cryptographic keys: a private key (kept secure on the client) and a public key (stored on the server).
   - Provides stronger security and eliminates the need to repeatedly enter passwords.
   - generate keypair for public key and private key
   -	private key store in user machine
   -	public key store in remote machine
   -	private key kept securely it not share with anyone 
   -	ssh -keygen -t rsa -b 4096 ->private and public key generation
   -	ssh -i “filepath” name@ip

### Key Features of SSH
- **Secure Communication**: Encrypts all traffic between the client and the server.
- **Remote Management**: Allows remote access to systems.
- **File Transfer**: Can transfer files securely using `scp` or `sftp`.

### Common SSH Commands
- **Connect to a Server**:
  ```bash
  ssh <username>@<hostname>
  ```
- **Copy a File to a Remote Server**:
  ```bash
  scp <file> <username>@<hostname>:<destination>
  ```
- **Copy a File from a Remote Server**:
  ```bash
  scp <username>@<hostname>:<remote_file> <local_destination>
  ```
- **Transfer Files Using SFTP**:
  ```bash
  sftp <username>@<hostname>
  ```

### SSH Key Authentication
1. **Generate SSH Keys**:
   ```bash
   ssh-keygen -t rsa -b 4096
   ```
2. **Copy Public Key to Server**:
   ```bash
   ssh-copy-id <username>@<hostname>
   ```
3. **Log in Using Key Authentication**:
   ```bash
   ssh <username>@<hostname>
   ```
# Resource
[SSH Keygen ](https://www.geeksforgeeks.org/how-to-generate-ssh-key-with-ssh-keygen-in-linux/)

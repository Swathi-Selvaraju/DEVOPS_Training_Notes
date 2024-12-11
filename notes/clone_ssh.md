# Cloning a Git Repository Using SSH

This guide will help you clone a Git repository using SSH for secure and efficient access.


## Prerequisites

1. **Git Installed**  
   Ensure you have Git installed on your system. [Download Git](https://git-scm.com/downloads) if needed.

2. **SSH Key Set Up**  
   - Generate an SSH key if you don't already have one:
     ```bash
     ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
     ```
   - Add the SSH key to the SSH agent:
   - Start the SSH agent:
     ```bash
     eval "$(ssh-agent -s)"
     ```
   - Add your SSH key:
     ```bash
     ssh-add ~/.ssh/id_rsa
     ```
   - Add the SSH key to your GitHub or GitLab account:
     - Copy the public key to your clipboard:
       ```bash
       cat ~/.ssh/id_rsa.pub
       ```
     - Add it to your Git platform under **SSH Keys**.
     - Paste the key into your Git hosting service under Settings > SSH Keys.

3. **SSH Authentication Test**  
   Test your SSH connection to ensure it works:
   ```bash
   ssh -T git@github.com
   ```
   ## Clone the Repository
   Run the git clone command with the SSH URL:
   ```bash
        git clone git@github.com:username/repository.git
   ```
   

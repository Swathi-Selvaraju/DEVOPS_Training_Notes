# GIT
# Git - Global Information Tracker
Git is a distributed version control system widely used by programmers to manage source code efficiently. It allows tracking of changes, collaboration among multiple developers, and maintaining a complete local copy of the repository along with its history, even without network access.
## VERSION CONTROL
-	the practice of tracking and managing changes to software code.
-	It manage changes to source code over time.
## GIT
-	Git stand for Global Information Tracker
-	Git is version control methodology
-	It is kind of client version control,we don’t need to any of server to support that git has run
## How does git works?
- It works on Local and remote repositories
- Repositories-> all the file and folder that you want to keep track of it with version that all placed into repositories
## Key Features
- **Free and Open Source:** Git is free to use and open source, making it accessible for everyone.
- **Local and Remote Repositories:** It supports local repositories for offline work and remote repositories for collaboration.
- **Version Tracking:** Tracks changes to files over time, allowing for easy rollbacks and version comparisons.
- **Git Hosting Services:** Popular platforms like GitHub, GitLab, and Bitbucket provide Git repository hosting.
  # Git Workflow

## The Git workflow includes the following areas:

1. **Working Directory:** The local directory where files are edited.
2. **Staging Area:** A temporary area where changes are prepared for commit.
3. **Local Repository:** A complete repository stored on your local machine.
4. **Remote Repository:** A server-hosted repository for collaboration.
## Basic Git Commands

### Setup Commands
- **`git --version`**: Checks the installed Git version.
- **`git config --global user.name "<name>"`**: Sets the global username.
- **`git config --global user.email "<email>"`**: Sets the global email address.
- **`git config --list`**: Lists all the configured settings.

### Repository Initialization
- **`git init`**: Initializes a new Git repository in the current directory.

### Staging and Committing
- **`git add <file>`**: Adds a specific file to the staging area.
- **`git add .`**: Stages all modified and new files.
- **`git commit`**: Commits staged changes (opens a text editor for the message).
- **`git commit -m "<message>"`**: Commits changes with an inline message.
- **`git commit --amend`**: Modifies the last commit.

### Branching and Merging
- **`git branch`**: Lists all branches.
- **`git branch <branch-name>`**: Creates a new branch.
- **`git checkout <branch-name>`**: Switches to a specific branch.
- **`git checkout -b <new-branch-name>`**: Creates and switches to a new branch.
- **`git merge <branch-name>`**: Merges a branch into the current branch.
- **`git branch -d <branch-name>`**: Deletes a branch.

### Viewing and Undoing Changes
- **`git status`**: Displays the state of the working directory and staging area.
- **`git diff`**: Shows changes between the working directory and the staging area.
- **`git log`**: Displays the commit history.
- **`git reset <commit>`**: Resets to a specific commit.
- **`git checkout <file>`**: Discards changes in the working directory.
  

### Remote Repositories
- **`git remote add origin <url>`**: Adds a remote repository.
- **`git remote -v`**: Lists remote repositories.
- **`git pull`**: Fetches and merges changes from a remote repository.
- **`git push`**: Pushes changes to a remote repository.
- **`git clone <url>`**: Creates a local copy of a remote repository.

### Tagging
- **`git tag <tag-name>`**: Creates a new tag.
- **`git tag`**: Lists all tags.
- **`git push origin <tag-name>`**: Pushes a specific tag to the remote repository.

### Miscellaneous
- **`git mv <old-path> <new-path>`**: Moves or renames a file or directory.
- **`git rm <file>`**: Removes a file from the working directory and stages the deletion.
- **`git stash`**: Temporarily saves changes that are not ready to commit.
- **`git stash apply`**: Applies stashed changes.

---
## Sample Workflow

1. **Initialize a repository:**
   ```bash
   git init
   ```
2. Configure user information:

    ```bash
    
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"
    ```
3. Add and commit changes:
   ``` bash
   
   git add .
   git commit -m "Initial commit"
   ```
4. Create a new branch:

   ``` bash
   
    git checkout -b feature-branch
   ```
5. Merge changes into the main branch:

   ``` bash
   
    git checkout main
    git merge feature-branch
   ```
6. Push changes to the remote repository:

   ```bash
  
    git remote add origin <remote-url>
    git push -u origin main
   ```

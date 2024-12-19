# Shell Scripting: 

- Automates tasks in the Linux environment. 
- Offers time-saving and improved accuracy for repetitive operations. 

## Key Features:  

- Automation
- Time/Task scheduling 
- Input/output handling 
- Operator, Loops and Conditional statements
## Linux scripting types:
-	KSH
-	ZSH
-	SH
-	BASH
## Text Editor
You Can write all commands, logic for particular script and save it. There are 3 commonly used.
-	Nano –we need to install
-	Vim & vi – it’s default available in linux and mostly used this

### In vim text Editor
   > eg : Vim firstcript.sh 
- It work with or without .sh extension
* `Touch` ->create a empty file
*	`Cat` ->create a file with some draft content
* `Vim` ->create a file that going to have some logic and script
* If file is exist mean it open with existing content
* If file is not exist mean it create a new file 
* File open in editing mode ,click i- insert add the content ,click esc + :q – quit
* Esc +:wq! – save and quit , esc+:q!-forcely quit

## Basic Shell Script Structure
A typical shell script contains:
1. **Shebang**: Specifies the interpreter.
   ```bash
   #!/bin/bash
   ```
2. **Commands**: Instructions to execute.
   ```bash
   echo "Hello, World!"
   ```
3. **Comments**: Use `#` for comments.
   ```bash
   # This is a comment
   ```
## How to Run a Shell Script
1. **Create a shell script file**:
- Save the file with a .sh extension
   ```bash
   nano script.sh
   ```
2. **Make the script executable**:
- Make the script executable using chmod +x filename.sh 
   ```bash
   chmod +x script.sh
   ```
3. **Run the script**:
- Run the script with ./filename.sh 
   ```bash
   ./script.sh
   ```
## Common Commands
- `echo`: Print messages to the terminal.
- `read`: Accept user input.
- `if/else`: Conditional statements.
- `for/while`: Loops for iteration.
- `grep`: Search text using patterns.
- `awk`: Process and format text.
- `vim filename.sh`: Opens the script for editing. 
- `mkdir`: Creates a directory. 
- `cd`: Changes the current directory. 
- `history`: Shows a list of previously used commands. 
### Cat Command also used in editing file
- To add new file
```bash
   cat > newfile
```
- To get a multiple time and line
- Add on the additional information to the existing file

```bash
  cat >> filename
  cat <EOF> > new file
```
- To save the file
- Ctrl + D -> to save


## Examples
### Example 1: Hello World Script
```bash
#!/bin/bash
# This script prints Hello, World!
echo "Hello, World!"
```

### Example 2: User Input
```bash
#!/bin/bash
# This script accepts user input
read -p "Enter your name: " name
echo "Hello, $name!"
```

### Example 3: Simple Loop
```bash
#!/bin/bash
# This script loops through numbers
for i in {1..5}; do
  echo "Number: $i"
done
```
### Resources
- [Examples of shell script](https://www.geeksforgeeks.org/shell-script-examples/)
- [Shell Scripting Tutorial](https://linuxconfig.org/bash-scripting-tutorial)

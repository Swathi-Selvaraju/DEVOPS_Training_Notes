#!/bin/bash

mkdir -p project_setup
echo "Created directory: project_setup"


echo "# Project Setup" > project_setup/README.md
echo "This is the initial setup for the project, containing basic configuration files." >> project_setup/README.md
echo "Created README.md with a project description."


cat <<EOL > project_setup/config.txt
SERVER_NAME=localhost
ENVIRONMENT=development
PORT=8080
EOL
echo "Created config.txt with initial configuration settings."

echo "Setup complete!"

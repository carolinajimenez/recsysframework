#!/bin/bash

# Detect the operating system
OS="$(uname)"

# Install jq and other necessary packages
install_packages() {
    if [ "$OS" == "Darwin" ]; then  # macOS
        if ! command -v jq &> /dev/null; then
            echo "Installing jq..."
            brew install jq
        fi
    elif [ "$OS" == "Linux" ]; then  # Linux
        if ! command -v jq &> /dev/null; then
            echo "Installing jq..."
            sudo apt-get update
            sudo apt-get install -y jq
        fi
    else
        echo "Unsupported operating system."
        exit 1
    fi
}

# Call the function to install packages
install_packages

# Request the full path of the virtual environment
echo "Please enter the full path of the virtual environment:"
read venv_path

# Activate the virtual environment
source $venv_path/bin/activate

# Verify that the virtual environment was activated correctly
if [ $? -ne 0 ]; then
    echo "Error activating the virtual environment. Ensure you provide the correct path."
    exit 1
fi

# Step 1: Execute cookiecutter
cookiecutter RecSysFramework

# Deactivate the virtual environment
deactivate

# Detect the directory of the project created by cookiecutter
project_dir=$(ls -d */ | grep -v "RecSysFramework" | head -n 1)

# Read the Docker repository name from the answers.json file
docker_repo_name=$(jq -r '.docker_image_name' "$project_dir/answers.json")

# Step 2: Execute helm
helm create recsyshelm

# Update the values.yaml file with the Docker repository name
if [ "$OS" == "Darwin" ]; then  # macOS
    sed -i '' "s|repository: nginx|repository: $docker_repo_name|" recsyshelm/values.yaml
elif [ "$OS" == "Linux" ]; then  # Linux
    sed -i "s|repository: nginx|repository: $docker_repo_name|" recsyshelm/values.yaml
fi

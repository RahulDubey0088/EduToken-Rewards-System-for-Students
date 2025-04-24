#!/bin/bash

# Variables
REPO_NAME="0xdA228b6353A7448386481D1afb4Bc43C8a5a4fFf"
GITHUB_URL="https://github.com/RahulDubey0088/$REPO_NAME.git"

# Create README.md with initial content
echo "# $REPO_NAME" > README.md

# Optionally add license
echo -e "\nAdding MIT License..."
cat <<EOL > LICENSE
MIT License

Copyright (c) $(date +%Y)

Permission is hereby granted, free of charge, to any person obtaining a copy...
(license body continues)
EOL

# Optionally create .gitignore for common languages (here: Python)
echo -e "\nCreating .gitignore..."
cat <<EOL > .gitignore
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*.so

# Virtual environment
venv/

# Environment variables
.env

# macOS
.DS_Store
EOL

# Git initialization and first commit
echo -e "\nInitializing Git repo..."
git init
git add README.md LICENSE .gitignore
git commit -m "Initial commit with README, License, and .gitignore"

# Set main branch and connect remote
git branch -M main
git remote add origin $GITHUB_URL

# Push to GitHub
git push -u origin main

# Optionally create and activate virtual environment (for Python)
if command -v python3 &> /dev/null; then
    echo -e "\nSetting up virtual environment..."
    python3 -m venv venv
    echo "Virtual environment 'venv' created. Activate with 'source venv/bin/activate'"
fi

echo -e "\nProject setup complete!"

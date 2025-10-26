#!/bin/bash

set -e

# Get project name from current directory and replace - with _
project_name="$(basename "$PWD" | tr '-' '_')"

echo "Setting up project: ${project_name}"

# Update pyproject.toml
sed -i "s/name = \"modele\"/name = \"${project_name}\"/" pyproject.toml
sed -i "s/source = \[\"modele\"\]/source = [\"${project_name}\"]/" pyproject.toml

# Update CI workflow
sed -i "s/--cov=modele/--cov=${project_name}/" .github/workflows/ci.yaml

# Rename project directory
mv modele "${project_name}"

# Update project __init__.py
sed -i "s/\"The modele package.\"/\"The ${project_name} package.\"/" "${project_name}/__init__.py"

# Update tests __init__.py
sed -i "s/\"The modele tests.\"/\"The ${project_name} tests.\"/" "tests/__init__.py"

# Rename and update test file
mv tests/test_modele.py "tests/test_${project_name}.py"
sed -i "s/from modele/from ${project_name}/" "tests/test_${project_name}.py"
sed -i "s/\"Tests for modele.\"/\"Tests for ${project_name}.\"/" "tests/test_${project_name}.py"

echo "Setup complete!"

# Remove setup script
rm -- "$0"
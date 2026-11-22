#!/bin/bash

# Prompt the user for confirmation before proceeding
read -p "Are you sure? (y/n): " confirm
if [ "$confirm" != "y"  ]; then
	echo "Operation aborted."
	exit 1
fi

# Find and remove all .class files recursively
find . -type f -name "*.class" -exec rm -f {} +
echo "All .class files removed successfully."

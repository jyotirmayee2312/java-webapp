#!/bin/bash

# Remove existing .war file if it exists
TARGET_FILE="/opt/myapp/myapp.war"

if [ -f "$TARGET_FILE" ]; then
    echo "Removing existing .war file: $TARGET_FILE"
    rm -f "$TARGET_FILE" || exit 1
fi

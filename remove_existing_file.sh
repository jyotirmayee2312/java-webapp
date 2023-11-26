#!/bin/bash

# Remove the existing file if it exists
TARGET_FILE="/opt/myapp/spring-boot-web.jar.original"

if [ -f "$TARGET_FILE" ]; then
    echo "Removing existing file: $TARGET_FILE"
    rm -f "$TARGET_FILE" || exit 1
fi

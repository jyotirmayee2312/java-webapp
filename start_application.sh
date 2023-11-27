#!/bin/bash

# Define the target file
TARGET_FILE="/opt/myapp/extracted/target/spring-boot-web.jar.original"

# Check if the file exists and remove it
if [ -f "$TARGET_FILE" ]; then
    echo "Removing existing file: $TARGET_FILE"
    rm "$TARGET_FILE" || exit 1
fi

# Run the Java application using the .war file
java -jar /opt/myapp/extracted/*.war

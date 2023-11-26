#!/bin/bash

# Specify the target file
TARGET_FILE="/opt/myapp/extracted/spring-boot-web.jar.original"

# Remove the existing file if it exists
if [ -f "$TARGET_FILE" ]; then
    echo "Removing existing file: $TARGET_FILE"
    rm "$TARGET_FILE" || exit 1
fi

# Download artifact from S3
aws s3 cp s3://codepipeline-ap-south-1-803549830893/JYOTI-01 /opt/myapp/artifact.zip || exit 1

# Unzip the artifact
unzip -q /opt/myapp/artifact.zip -d /opt/myapp/extracted || exit 1

# Run the Java JAR file
java -jar /opt/myapp/extracted/app.jar
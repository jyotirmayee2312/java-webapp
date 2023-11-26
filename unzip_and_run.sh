#!/bin/bash

# Define the target file
TARGET_FILE="/target/spring-boot-web.jar.original"

# Check if the file exists and remove it
if [ -f "$TARGET_FILE" ]; then
    echo "Removing existing file: $TARGET_FILE"
    rm "$TARGET_FILE" || exit 1
fi

# Download artifact from S3
aws s3 cp s3://codepipeline-ap-south-1-803549830893/JYOTI-01 /opt/myapp/artifact.zip || exit 1

# Unzip the artifact
unzip -q /opt/myapp/artifact.zip -d /opt/myapp/extracted || exit 1

# Rename the new JAR file
mv /opt/myapp/extracted/spring-boot-web.jar /opt/myapp/extracted/app.jar || exit 1

# Run the Java JAR file
java -jar /opt/myapp/extracted/app.jar
